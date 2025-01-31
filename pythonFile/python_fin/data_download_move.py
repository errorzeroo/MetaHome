import os
import time
import shutil
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager


def wait_for_download(download_dir, timeout=120):
    start_time = time.time()
    initial_files = set(os.listdir(download_dir))  # 기존 파일 목록 저장
    last_file_size = {}

    while True:
        current_files = set(os.listdir(download_dir))
        new_files = current_files - initial_files  # 새로 추가된 파일만 모니터링

        for file in new_files:
            file_path = os.path.join(download_dir, file)
            
            # 다운로드 중인 파일 (.crdownload 확장자 확인)
            if file.endswith(".crdownload"):
                print(f"File is still downloading: {file}")
                continue
            
            # 파일 크기 확인
            current_size = os.path.getsize(file_path)
            if last_file_size.get(file_path) == current_size:
                print(f"Download completed for: {file_path}")
                return file  # 파일 크기가 변화하지 않으면 다운로드 완료로 판단
            else:
                last_file_size[file_path] = current_size

        # 타임아웃 초과 시 None 반환
        if time.time() - start_time > timeout:
            print("Download timed out.")
            return None

        time.sleep(1)  # 1초 대기 후 재확인


def copy_and_rename_file(src_dir, dest_dir, downloaded_file_name, new_file_name):
    original_file_path = os.path.join(src_dir, downloaded_file_name)

    # 다운로드된 파일이 존재하고, 확장자가 .crdownload가 아닌지 확인
    if os.path.exists(original_file_path) and not downloaded_file_name.endswith(".crdownload"):
        # 대상 디렉터리 생성
        os.makedirs(dest_dir, exist_ok=True)

        # 파일 복사
        new_file_path = os.path.join(dest_dir, new_file_name)
        shutil.copy(original_file_path, new_file_path)
        print(f"File successfully copied to: {new_file_path}")
        return new_file_path
    else:
        print(f"Download file is incomplete or does not exist: {original_file_path}")
        return None



def download_csv_with_click(file_url, download_dir, dest_dir, new_file_name):
    # Chrome 옵션 설정
    options = webdriver.ChromeOptions()

    # WebDriver 경로 설정
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

    try:
        # 웹 페이지 열기
        driver.get(file_url)
        print("Page loaded:", file_url)

        # 다운로드 버튼 찾고 클릭 (CSS 셀렉터를 해당 페이지에 맞게 수정)
        download_button = driver.find_element(By.CSS_SELECTOR, "#tab-layer-file > div.data-detail-wrap > div:nth-child(4) > div.just-mb.mt-3 > div > a")  # 버튼 선택자
        driver.execute_script("arguments[0].scrollIntoView(true);", download_button)
        download_button.click()
        print("Download button clicked.")

        # Alert 창 전환
        alert = driver.switch_to.alert
        print(f"Alert text: {alert.text}")  # Alert 내용 출력 (디버깅용)

        # Alert 확인 버튼 클릭 (닫기)
        alert.accept()

        # 다운로드 완료 대기
        downloaded_file_name = wait_for_download(download_dir, timeout=120)  # 최대 2분 대기
        if downloaded_file_name:
            # 파일 복사 및 이름 변경
            final_path = copy_and_rename_file(download_dir, dest_dir, downloaded_file_name, new_file_name)
            print(f"File successfully saved to: {final_path}")
            return final_path
        else:
            print("File download timed out or failed.")
            return None

    except Exception as e:
        print(f"Error occurred: {e}")
        return None

    finally:
        time.sleep(5)
        driver.quit()

# 사용 예시
if __name__ == "__main__":
    # URL 및 경로 설정
    url = "https://www.data.go.kr/data/15067528/fileData.do"
    download_folder = r"C:\\Users\\user\\Downloads"  # 브라우저 기본 다운로드 경로
    destination_folder = r"C:\\Lecture\\final"  # 최종 저장할 폴더
    target_file_name = "park_data.csv"

    # 다운로드 폴더 생성
    os.makedirs(download_folder, exist_ok=True)

    # 함수 호출
    saved_file_path = download_csv_with_click(url, download_folder, destination_folder, target_file_name)
    if saved_file_path:
        print(f"File successfully saved to: {saved_file_path}")
