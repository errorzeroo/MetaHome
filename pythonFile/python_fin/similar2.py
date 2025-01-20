import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
import sys
import json
import sys
sys.stdout.reconfigure(encoding='utf-8')

# 파일 경로 (CSV 파일 경로 설정)
file_path = 'C:/Lecture/final/scaleResult.csv'

# 데이터 읽기
data = pd.read_csv(file_path)

# 명령줄 인수 처리
args = sys.argv[1:]  # 첫 번째 인수는 스크립트 이름, 그 이후가 실제 입력값

if len(args) < 2:
    sys.exit(1)

# 입력된 컬럼명과 값 파싱
selected_columns = args[0].split(',')  # 쉼표로 구분된 컬럼명
user_values = list(map(float, args[1].split(',')))  # 쉼표로 구분된 값

# 선택한 열 확인
if not set(selected_columns).issubset(data.columns):
    sys.exit(1)

# 선택한 열 데이터 추출
selected_features = data[selected_columns]

# 사용자 입력값 배열 생성
user_array = np.array([user_values])

# 코사인 유사도 계산 (사용자 입력값과 데이터 비교)
similarity_scores = cosine_similarity(selected_features, user_array).flatten()

# 유사도 결과를 데이터프레임에 추가
data['similar'] = similarity_scores

# 상위 5개 유사한 주소 찾기
most_similar_addresses = data.sort_values(by='similar', ascending=False).head(5)

# 사용자 선택 열만 포함한 JSON 생성 (주소, 유사도, 선택 열)
result = most_similar_addresses[['adress', 'similar'] + selected_columns].to_dict(orient='records')

# JSON 형태로 결과 출력
output_json = json.dumps(result, ensure_ascii=False, indent=4)
print(output_json)
