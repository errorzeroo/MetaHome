from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
import time
import os
import shutil

import os
import time

def wait_for_download(download_dir, timeout=60, check_interval=1):
    start_time = time.time()
    previous_size = 0
    while True:
        files = [f for f in os.listdir(download_dir) if os.path.isfile(os.path.join(download_dir, f))]
        if files:
            latest_file = max(files, key=lambda f: os.path.getctime(os.path.join(download_dir, f)))  # 가장 최근 파일 선택
            latest_file_path = os.path.join(download_dir, latest_file)
            current_size = os.path.getsize(latest_file_path)

            if current_size == previous_size:
                # 파일 크기가 더 이상 변하지 않으면 다운로드 완료로 간주
                print(f"Download complete: {latest_file}")
                return latest_file
            else:
                previous_size = current_size

        if time.time() - start_time > timeout:
            print("Download timed out.")
            return None

        time.sleep(check_interval)

def move_and_rename_file(src_dir, dest_dir, downloaded_file_name, new_file_name):
    os.makedirs(dest_dir, exist_ok=True)  # 대상 폴더 생성
    original_file_path = os.path.join(src_dir, downloaded_file_name)
    new_file_path = os.path.join(dest_dir, new_file_name)

    shutil.move(original_file_path, new_file_path)  # 파일 이동 및 이름 변경
    print(f"File moved to: {new_file_path}")
    return new_file_path

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
        download_button = driver.find_element(By.CSS_SELECTOR, "#stdCsvDownloadBtn")  # 버튼 선택자
        download_button.click()
        print("Download button clicked.")

        # 다운로드 완료 대기
        downloaded_file_name = wait_for_download(download_dir, timeout=60)
        if downloaded_file_name:
            # 파일 이동 및 이름 변경
            final_path = move_and_rename_file(download_dir, dest_dir, downloaded_file_name, new_file_name)
            print(f"File successfully saved to: {final_path}")
            return final_path
        else:
            print("File download timed out or failed.")
            return None

    except Exception as e:
        print(f"Error occurred: {e}")
        return None

    finally:
        print("Waiting for user confirmation to close browser...")
        time.sleep(5)  # 다운로드 프로세스가 완료되도록 추가 대기 시간
        driver.quit()

# 사용 예시
if __name__ == "__main__":
    # URL 및 경로 설정
    url = "https://www.data.go.kr/data/15021148/standard.do"
    download_folder = r"C:\\Users\\user\\Downloads"  # 브라우저 기본 다운로드 경로
    destination_folder = r"C:\\Lecture\\final"  # 최종 저장할 폴더
    target_file_name = "school.csv"

    # 다운로드 폴더 생성
    os.makedirs(download_folder, exist_ok=True)

    # 함수 호출
    saved_file_path = download_csv_with_click(url, download_folder, destination_folder, target_file_name)
    if saved_file_path:
        print(f"File successfully saved to: {saved_file_path}")

import pandas as pd

# 데이터 불러오기
df = pd.read_csv('C:/Lecture/final/school.csv', encoding='cp949')  # 파일 경로와 인코딩 확인

# '소재지도로명주소' 컬럼에서 '서울특별시'가 포함된 행만 필터링
filtered_df = df[df['소재지도로명주소'].str.contains('서울특별시', na=False)]

# 필요한 열만 선택
filtered_df = filtered_df[['학교명', '위도', '경도','설립형태','소재지도로명주소']]

# 각 학교 이름을 기준으로 데이터 분리
elementary_schools = filtered_df[filtered_df['학교명'].str.contains('초등학교', na=False)]
middle_schools = filtered_df[filtered_df['학교명'].str.contains('중학교', na=False)]
high_schools = filtered_df[filtered_df['학교명'].str.contains('고등학교', na=False)]

# 분리된 데이터를 새로운 CSV 파일로 저장
elementary_schools.to_csv('C:/Lecture/final/element.csv', index=False, encoding='utf-8-sig')
middle_schools.to_csv('C:/Lecture/final/middle.csv', index=False, encoding='utf-8-sig')
high_schools.to_csv('C:/Lecture/final/high.csv', index=False, encoding='utf-8-sig')

import pandas as pd
import cx_Oracle

# CSV 파일 로드
file_path = 'C:/Lecture/final/element.csv'
df1 = pd.read_csv(file_path, encoding='utf-8-sig')

time.sleep(1)

# CSV 파일 로드
file_path = 'C:/Lecture/final/middle.csv'
df2 = pd.read_csv(file_path, encoding='utf-8-sig')

time.sleep(1)

# CSV 파일 로드
file_path = 'C:/Lecture/final/high.csv'
df3 = pd.read_csv(file_path, encoding='utf-8-sig')

# Oracle DB 연결 정보
dsn = cx_Oracle.makedsn("localhost", "1521", service_name="XE")
connection = cx_Oracle.connect(user="C##SCOTT", password="tiger", dsn=dsn)

# Cursor 생성
cursor = connection.cursor()

try:
    cursor.execute("DELETE FROM LOWSCHOOLE")
except Exception as e:
    print(f"데이터 삭제 중 오류 발생: {e}")
time.sleep(1)
try:
    cursor.execute("DELETE FROM MIDDLESCHOOLE")
except Exception as e:
    print(f"데이터 삭제 중 오류 발생: {e}")
time.sleep(1)
try:
    cursor.execute("DELETE FROM HIGHSCHOOLE")
except Exception as e:
    print(f"데이터 삭제 중 오류 발생: {e}")

# 데이터 삽입 함수
def insert_data(row):
    try:
        query = """
            INSERT INTO LOWSCHOOLE (
                LOW_NAME, LOW_LAT, LOW_LON, LOW_BUIL, LOW_ADDRESS
            ) VALUES (
                :1, :2, :3, :4, :5
            )
        """
        cursor.execute(query, (
            row['학교명'],      # LOW_NAME
            row['위도'],        # LOW_LAT
            row['경도'],        # LOW_LON
            row['설립형태'],    # LOW_BUIL
            row['소재지도로명주소']  # LOW_ADDRESS
        ))
    except cx_Oracle.IntegrityError:
        print(f"중복 데이터로 삽입 실패: {row['학교명']}")
    except Exception as e:
        print(f"오류 발생: {e}, 학교명: {row['학교명']}")

# 데이터 삽입 실행
for _, row in df1.iterrows():
    insert_data(row)

time.sleep(1)    
# 데이터 삽입 함수
def insert_data(row):
    try:
        query = """
            INSERT INTO MIDDLESCHOOLE (
                MID_NAME, MID_LAT, MID_LON, MID_BUIL, MID_ADDRESS
            ) VALUES (
                :1, :2, :3, :4, :5
            )
        """
        cursor.execute(query, (
            row['학교명'],        # MID_NAME
            row['위도'],          # MID_LAT
            row['경도'],          # MID_LON
            row['설립형태'],      # MID_BUIL
            row['소재지도로명주소'] # MID_ADDRESS
        ))
    except cx_Oracle.IntegrityError:
        print(f"중복 데이터로 삽입 실패: {row['학교명']}")
    except Exception as e:
        print(f"오류 발생: {e}, 학교명: {row['학교명']}")

# 데이터 삽입 실행
for _, row in df2.iterrows():
    insert_data(row)
time.sleep(1)
# 데이터 삽입 함수
def insert_data(row):
    try:
        query = """
            INSERT INTO HIGHSCHOOLE (
                HI_NAME, HI_LAT, HI_LON, HI_BUIL, HI_ADDRESS
            ) VALUES (
                :1, :2, :3, :4, :5
            )
        """
        cursor.execute(query, (
            row['학교명'],        # HI_NAME
            row['위도'],          # HI_LAT
            row['경도'],          # HI_LON
            row['설립형태'],      # HI_BUIL
            row['소재지도로명주소'] # HI_ADDRESS
        ))
    except cx_Oracle.IntegrityError:
        print(f"중복 데이터로 삽입 실패: {row['학교명']}")
    except Exception as e:
        print(f"오류 발생: {e}, 학교명: {row['학교명']}")

# 데이터 삽입 실행
for _, row in df3.iterrows():
    insert_data(row)

# 커밋 및 연결 종료
connection.commit()
cursor.close()
connection.close()

