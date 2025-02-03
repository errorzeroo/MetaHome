import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np
import sys
import json
sys.stdout.reconfigure(encoding='utf-8')

# 파일 경로 (CSV 파일 경로 설정)
file_path = 'C:/Lecture/final/scaleResults.csv'

# 데이터 읽기
data = pd.read_csv(file_path)

# 명령줄 인수 처리
args = sys.argv[1:]  # 첫 번째 인수는 스크립트 이름, 그 이후가 실제 입력값

if len(args) < 2:
    sys.exit(1)

# 입력된 컬럼명과 값 파싱
selected_address = args[0] if len(args) > 0 else ""
selected_address = "" if selected_address == "No" else selected_address

selected_homeKind = args[1] if len(args) > 1 else ""
selected_homeKind = "" if selected_homeKind == "No" else selected_homeKind
selected_columns = args[2].split(',')  # 쉼표로 구분된 컬럼명
user_values = list(map(float, args[3].split(',')))  # 쉼표로 구분된 값


# 선택한 열 확인
if not set(selected_columns).issubset(data.columns):
    sys.exit(1)

# address에 selected_address를 포함하는 레코드 필터링 (빈 문자열일 경우 모든 값 포함)
if selected_address:
    filtered_data = data[data['address'].str.contains(selected_address, na=False)]
else:
    filtered_data = data.copy()

# homeKind가 selected_homeKind와 완전히 일치하는 레코드 필터링 (빈 문자열일 경우 모든 값 포함)
if selected_homeKind:
    filtered_data = filtered_data[filtered_data['homeKind'] == selected_homeKind]

# 선택한 열 데이터 추출
selected_features = filtered_data[selected_columns]

# 사용자 입력값 배열 생성
user_array = np.array([user_values])

# 코사인 유사도 계산 (사용자 입력값과 데이터 비교)
cosine_sim = cosine_similarity(selected_features, user_array).flatten()

# 유클리드 거리 계산
euclidean_dist = np.linalg.norm(selected_features - user_array, axis=1)

# 유클리드 거리를 반대로 변환 (값이 작을수록 유사도가 높도록 조정)
max_dist = np.max(euclidean_dist) if np.max(euclidean_dist) != 0 else 1  # 0으로 나누는 오류 방지
euclidean_sim = 1 / (1 + euclidean_dist)

# 혼합 점수 계산 (가중치: 코사인 4, 유클리드 6)
alpha_cosine = 0.2
alpha_euclidean = 0.8
# 'similar' 열을 추가하기 전에 .copy()로 복사본 생성
filtered_data = filtered_data.copy()
filtered_data['similar'] = (alpha_cosine * cosine_sim) + (alpha_euclidean * euclidean_sim)

# 상위 5개 유사한 주소 찾기
most_similar_addresses = filtered_data.sort_values(by='similar', ascending=False).head(5)

# 사용자 선택 열만 포함한 JSON 생성 (주소, 유사도, 주택유형, 선택 열)
result = most_similar_addresses[['address', 'similar', 'homeKind'] + selected_columns].to_dict(orient='records')

# JSON 형태로 결과 출력
output_json = json.dumps(result, ensure_ascii=False, indent=4)
print(output_json)
