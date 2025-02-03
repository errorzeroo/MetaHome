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
        download_button = driver.find_element(By.CSS_SELECTOR, "#btnCsv > span")  # 버튼 선택자
        download_button.click()
        print("Download button clicked.")

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
    url = "https://data.seoul.go.kr/dataList/OA-13122/S/1/datasetView.do"
    download_folder = r"C:\\Users\\user\\Downloads"  # 브라우저 기본 다운로드 경로
    destination_folder = r"C:\\Lecture\\final"  # 최종 저장할 폴더
    target_file_name = "parking_data.csv"

    # 다운로드 폴더 생성
    os.makedirs(download_folder, exist_ok=True)

    # 함수 호출
    saved_file_path = download_csv_with_click(url, download_folder, destination_folder, target_file_name)
    if saved_file_path:
        print(f"File successfully saved to: {saved_file_path}")



import pandas as pd

# 데이터 불러오기
df = pd.read_csv('C:/Lecture/final/parking_data.csv', encoding='cp949')  # 파일 경로와 인코딩 확인

# 필요한 컬럼만 선택 (금액 정보 포함)
selected_columns = [
    '주차장명', '위도', '경도', '주소', '전화번호', '유무료구분', 
    '기본 주차 요금', '추가 단위 요금', '기본 주차 시간(분 단위)', '추가 단위 시간(분 단위)',
    '일 최대 요금', '버스 기본 주차 요금', '버스 추가 단위 요금'
]
processed_df = df[selected_columns]


# 전처리된 데이터 저장
processed_df.to_csv('C:/Lecture/final/서울시 공영주차장_전처리.csv', index=False, encoding='utf-8-sig')


processed_df = processed_df.drop_duplicates(subset=['주차장명'], keep='first')

# 위도와 경도 중 하나라도 값이 없는 행 제거
processed_df = df.dropna(subset=['위도', '경도'])

# 결과를 CSV로 저장
processed_df.to_csv('C:/Lecture/final/서울시 공영주차장_전처리.csv', index=False, encoding='utf-8-sig')


import pandas as pd
import cx_Oracle

# NaN 값을 처리 (숫자 컬럼은 0, 문자열 컬럼은 빈 문자열로 대체)
processed_df.fillna({
    '주차장명': '',  # PARKING_NAME
    '위도': 0,  # PARKING_LAT
    '경도': 0,  # PARKING_LON
    '주소': '',  # PARKING_ADDRESS
    '전화번호': '',  # PARKING_CALL
    '유무료구분': '',  # PARKING_FREE
    '기본 주차 요금': 0,  # PARKING_PLANE
    '추가 단위 요금': 0,  # PARKING_MORE
    '기본 주차 시간(분 단위)': 0,  # PARKING_PLANE_TIME
    '추가 단위 시간(분 단위)': 0,  # PARKING_MORE_TIME
    '일 최대 요금': 0,  # PARKING_DMAX
    '버스 기본 주차 요금': 0,  # PARKING_BUS_PLANE
    '버스 추가 단위 요금': 0  # PARKING_BUS_MORE
}, inplace=True)

# Oracle DB 연결 정보
dsn = cx_Oracle.makedsn("localhost", "1521", service_name="XE")
connection = cx_Oracle.connect(user="C##SCOTT", password="tiger", dsn=dsn)

# Cursor 생성
cursor = connection.cursor()

try:
    cursor.execute("DELETE FROM PARKING")
except Exception as e:
    print(f"데이터 삭제 중 오류 발생: {e}")

# 테이블에 데이터를 삽입하는 함수
def insert_data(row):
    try:
        query = """
            INSERT INTO PARKING (
                PARKING_NAME, PARKING_LAT, PARKING_LON, PARKING_ADDRESS,
                PARKING_CALL, PARKING_FREE, PARKING_PLANE, PARKING_MORE,
                PARKING_PLANE_TIME, PARKING_MORE_TIME, PARKING_DMAX,
                PARKING_BUS_PLANE, PARKING_BUS_MORE
            ) VALUES (
                :1, :2, :3, :4,
                :5, :6, :7, :8,
                :9, :10, :11, :12, :13
            )
        """
        cursor.execute(query, (
            row['주차장명'], 
            row['위도'], 
            row['경도'], 
            row['주소'], 
            row['전화번호'], 
            row['유무료구분'], 
            row['기본 주차 요금'], 
            row['추가 단위 요금'], 
            row['기본 주차 시간(분 단위)'], 
            row['추가 단위 시간(분 단위)'], 
            row['일 최대 요금'], 
            row['버스 기본 주차 요금'], 
            row['버스 추가 단위 요금']
        ))

    except cx_Oracle.IntegrityError as e:
        print(f"중복 데이터 삽입 오류: {row['주차장명']}, 오류 메시지: {e}")
    except Exception as e:
        print(f"오류 발생: {e}, 데이터: {row}")

# DataFrame의 각 행 데이터를 삽입
for _, row in processed_df.iterrows():
    insert_data(row)

# DB에 커밋
connection.commit()

# 연결 종료
cursor.close()
connection.close()
