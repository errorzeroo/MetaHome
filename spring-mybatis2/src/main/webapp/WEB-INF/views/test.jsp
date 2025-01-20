<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Metahome</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!--<link ref="stylesheet" type="text/css" href="C:/Lecture/MetaHome/spring-mybatis2/src/main/resources/static/css/style.css">
-->
</head>
<style>
    body, html {
        margin: 0;
        padding: 0;
        position: relative; /* 부모 기준을 설정 */
        height: 100%; /* 화면 높이를 기준으로 설정 */
        width: 100%; /* 화면 너비를 기준으로 설정 */
        overflow-x: hidden; /* 수평 스크롤바 비활성화 */
        overflow-y: hidden; /* 수직 스크롤바 제거 */
    }

    .title {
        position: absolute; /* 절대 위치 */
        top: 13px; /* 위에서 10px 아래 */
        left: 80px;
        font-size: 25px;
        font-family: AppleSDGothicNeo, sans-serif;
        margin: 0; /* 제목 여백 제거 */
        padding: 0; /* 제목 여백 제거 */
    }

    .styled-line1 {
        border: 1px solid lightgray;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 65px; /* 위쪽에서 200px 아래로 이동 */
        left: 0; /* 왼쪽 정렬 */
        width: 100%; /* 전체 너비 */
    }
    .styled-line2 {
        border: 1px solid lightgray;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 60px; /* 위쪽에서 200px 아래로 이동 */
        left: 0; /* 왼쪽 정렬 */
        width: 430px; /* 전체 너비 */
    }
    .white-button1 {
        border: 2px solid white;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 980px;
        font-size: 16px;
        font-family: AppleSDGothicNeo, sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .white-button2 {
        border: 2px solid white;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1065px;
        font-size: 16px;
        font-family: AppleSDGothicNeo, sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
        display: flex;
    }
    .white-button3 {
        border: 2px solid #FF6F3C;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1330px;
        font-size: 16px;
        font-family: AppleSDGothicNeo, sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
        display: flex;
    }
    .white-button4 {
        display: flex;
        border: 2px solid #6AC1FF;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1400px;
        font-size: 16px;
        font-family: AppleSDGothicNeo, sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .button:hove {
        background-color: #f0f0f0; /* 호버 시 연한 회색으로 변경 */
    }

    /* 버튼 스타일 */
    .dropdown-button1 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: AppleSDGothicNeo, sans-serif;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: space-between; /* 텍스트와 아이콘 간격 유지 */
        padding: 4px 8px; /* 버튼 여백 */
        font-size: 13px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 90px; /* 버튼 너비 고정 */
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 18px; /* 위에서 10px 아래 */
        left: 20px;
    }
    .dropdown-button2 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: AppleSDGothicNeo, sans-serif;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: space-between; /* 텍스트와 아이콘 간격 유지 */
        padding: 4px 8px; /* 버튼 여백 */
        font-size: 13px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 90px; /* 버튼 너비 고정 */
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 18px; /* 위에서 10px 아래 */
        left: 115px;
    }
    .dropdown-button3 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: AppleSDGothicNeo, sans-serif;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: space-between; /* 텍스트와 아이콘 간격 유지 */
        padding: 4px 8px; /* 버튼 여백 */
        font-size: 13px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 160px; /* 버튼 너비 고정 */
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 18px; /* 위에서 10px 아래 */
        left: 210px;
    }

    /* 아래 화살표 스타일 */
    .dropdown-icon {
        margin-left: 5px; /* 텍스트와 아이콘 간격 */
        font-size: 10px; /* 화살표 크기 */
        border: solid #333; /* 화살표 색상 */
        border-width: 0 1px 1px 0; /* 삼각형 모양 테두리 */
        display: inline-block;
        padding: 3px; /* 화살표 크기 조정 */
        transform: rotate(45deg); /* 아래 방향 화살표로 회전 */
    }

    .icon-button {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 28px; /* 버튼의 너비와 높이를 동일하게 설정 */
        height: 28px;
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 50%; /* 둥근 모서리 */
        background-color: white; /* 배경색 */
        cursor: pointer; /* 클릭 가능한 포인터 */
        transition: background-color 0.3s ease, transform 0.3s ease;
        position: absolute; /* 절대 위치 */
        top: 18px; /* 위에서 10px 아래 */
        left: 378px;
    }

    hr.vertical-line {
        width: 2px; /* 세로선 너비 */
        height: 1600px; /* 세로선 높이 */
        border: none; /* 기본 테두리 제거 */
        background-color: #D3D3D3; /* 세로선 색상 */
        position: absolute; /* 절대 위치 */
        top: 10px; /* 위에서 10px 아래 */
        left: 425px;
    }

    .sliding-container {
        position: absolute;
        top: 0;
        left: 0; /* 왼쪽에서 시작 */
        height: 100%;
        width: 430px; /* 패널 너비 */
        display: flex;
        align-items: center;
        z-index: 1000;
    }

    .sliding-panel {
        position: absolute;
        top: 66px; /* 위쪽 공간을 10px로 줄임 */
        left: 0px; /* 처음에는 화면 밖에 위치 */
        height: 100%;
        width: 430px;
        background-color: white;
        border-right: 1px solid lightgray; /* 왼쪽에서 나오기 때문에 오른쪽 테두리 */
        transition: left 0.3s ease; /* 슬라이드 애니메이션 */
        padding: 0px;
    }

    .sliding-panel.active {
        left: 0; /* 화면 안으로 이동 */
    }

    .slide-toggle-button {
        position: absolute;
        top: 50%;
        right: -30px; /* 버튼이 패널에 붙어 위치 */
        transform: translateY(-50%);
        background-color: white;
        border: 1px solid lightgray;
        cursor: pointer;
        z-index: 1001;
        font-size: 16px;
        padding: 10px;
        transition: transform 0.3s ease;
    }

    .slide-toggle-button:hover {
        transform: translateY(-50%) scale(1.1);
    }

    .map {
        position: absolute; /* 절대 위치 */
        top: 66px; /* 위에서 10px 아래 */
        width:100%;
        height:100%;
        z-index: 1;
    }
    .chart-container {
        position: absolute; /* 절대 위치 */
        top: 150px; /* 차트를 맵 위에 적절히 배치 */
        left: 50px; /* 원하는 위치 지정 */
        width: 450px; /* 여기에 if문으로 차트 크기 조절 */
        height: 200px;
        z-index: 10; /* 맵보다 높은 계층 */
        background-color: rgba(255, 255, 255, 1); /* 차트 배경 설정 */
        border: 1px solid lightgray; /* 차트 경계선 */
        border-radius: 8px; /* 모서리 둥글게 */
        padding: 10px;
    }

    .list-item {
        padding: 0; /* 내부 여백 제거 */
        border: none; /* 테두리 제거 */
        background-color: transparent; /* 배경 투명 */
        box-shadow: none; /* 박스 섀도우 제거 */
        height: 190px;
        display: flex;
        flex-direction: column;
        gap: 10px;
        border-bottom: 1px solid black; /* 회색 선 추가 */
        cursor: pointer; /* 마우스 오버 시 손 모양 */
    }
    .list-item:last-child {
        border-bottom: none; /* 마지막 항목에는 선 제거 */
    }


    .list-header {
        font-size: 18px;
        font-weight: bold;
        color: #333;
        position: relative; /* 기준 위치에서 이동 */
        left: 20px; /* 오른쪽으로 20px 이동 */
        top: 20px;
    }

    .vertical-line {
        width: 100%; /* 선의 너비 */
        height: 1px; /* 선의 두께 */
        background-color: #ccc; /* 회색 선 */
        position: relative; /* 기준 위치에서 이동 */
        left: 20px; /* 오른쪽으로 20px 이동 */
        top: 30px;
    }


    .list-subtitle {
        font-size: 14px;
        color: #666;
        position: relative; /* 기준 위치에서 이동 */
        left: 10px; /* 오른쪽으로 20px 이동 */
        top: 35px;
    }

    .vertical-line2 {
        width: 1.5px; /* 선의 너비 */
        height: 100%; /* 선의 두께 */
        background-color: #ccc; /* 회색 선 */
        position: relative; /* 기준 위치에서 이동 */
        left: 195px; /* 오른쪽으로 20px 이동 */
        top: 30px;
    }

    .co {
        font-size: 14px;
        color: #555;
        position: relative; /* 기준 위치에서 이동 */
        left: 10px; /* 오른쪽으로 20px 이동 */
        top: -20px;
    }
    .dep {
        font-size: 14px;
        color: #555;
        position: relative; /* 기준 위치에서 이동 */
        left: 210px; /* 오른쪽으로 20px 이동 */
        top: -15px;
    }
    .month {
        font-size: 14px;
        color: #555;
        position: relative; /* 기준 위치에서 이동 */
        left: 210px; /* 오른쪽으로 20px 이동 */
        top: 10px;
    }

    .detail-label {
        font-weight: bold;
        color: #777;
    }

    .detail-value {
        font-weight: bold;
        color: #222;
    }

    .slide-content-container {
        overflow-y: auto; /* 수직 스크롤 허용 */
        max-height: 570px; /* 스크롤 가능한 최대 높이 */
        margin-top: 70px; /* 상단에서 100px 떨어지게 설정 */
        padding: 10px; /* 내부 여백 추가 */
    }





</style>
<body>

    <!-- 선위에 요소들 style에 .클래스 이름으로 스타일 정의해 놓음 -->
    <h3 class = "title">메타홈</h3>
    <button class = "white-button1">맞춤 지도</button>
    <button class = "white-button2">우리 동네 이사와 생활 서비스</button>
    <button class = "white-button3">로그인</button>
    <button class = "white-button4">멤버쉽 가입</button>

    <!-- 위쪽 선 -->
    <hr class="styled-line1">

    <!-- 템플릿 -->
     <template id="slide-item-template">
         <div class="list-item">
             <div class="list-header">
                 <span class="list-title"></span>
             </div>
             <div class="vertical-line"></div>
             <div class="list-subtitle">
                 <span class="list-type"></span>
             </div>
             <div class="vertical-line2"></div>
            <div class="dep">
                 <span class="detail-label">임대 보증금:</span>
                 <span class="detail-value deposit"></span>
             </div>

             <div class="month">
                 <span class="detail-label">월 임대료:</span>
                 <span class="detail-value monthly-rent"></span>
             </div>
              <div class="co">
                 <span class="detail-label">임대사업자:</span>
                 <span class="detail-value company"></span>
             </div>
         </div>
     </template>


    <!-- slide area -->
    <div class="sliding-container">
        <div class="sliding-panel" id="slidingPanel">
            <button id="slideToggleButton" class="slide-toggle-button">❯</button>
            <button class="dropdown-button1">
              지역 선택
              <span class="dropdown-icon"></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button2">
              주택 유형
              <span class="dropdown-icon"></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button3">
              생활 인프라 매칭하기
              <span class="dropdown-icon"></span> <!-- 화살표 -->
            </button>
            <button class="icon-button">
              <span class="icon icon-refresh">&#x21BB;</span> <!-- 새로 고침 아이콘 -->
            </button>
            <hr class="styled-line2">

            <div id="slideContentContainer" class="slide-content-container"></div>
            <div id="detailContainer"></div>


            <!-- 버튼이 아니라 백에서 코드로 실행 좌표도 그때 넣어줘야함 -->
            <!-- <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> -->
        </div>
    </div>

        <!-- 차트 추가 -->
        <div class="chart-container">
            <canvas id="myChart"></canvas>
        </div>
        <!--<script src="/js/kakao.js"></script>-->
        <script>
            // JSP에서 JSON 데이터를 안전하게 가져오기
            const jsonData = ${jsonData}; // JSP에서 전달된 JSON 데이터 (문자열로 전달)
            console.log("JSON Data:", jsonData);
            const parsedData = jsonData;

            // 데이터 처리
            const labels = parsedData.map(item => item.address); // 주소를 라벨로 사용
            const similarities = parsedData.map(item => item.similar); // 유사도 점수
            const parks = parsedData.map(item => item.park); // 공원
            const hospitals = parsedData.map(item => item.hospital); // 병원
            const subways = parsedData.map(item => item.subway); // 지하철
            const buses = parsedData.map(item => item.bus); // 버스
            const elements = parsedData.map(item => item.element); // 초등학교
            const middles = parsedData.map(item => item.middle); // 중학교
            const highes = parsedData.map(item => item.high); // 고등학교
            const hcounts = parsedData.map(item => item.hospitalcount); // 병원수

            if (parks == null){
                park = 0
            }else{
                park = parks[0]*100
            }
            if (hospitals == null){
                hospital = 0
            }else{
                hospital = hospitals[0]*100
            }
            if (subways == null){
                subway = 0
            }else{
                subway = subways[0]*100
            }
            if (buses == null){
                bus = 0
            }else{
                bus = buses[0]*100
            }
            if (elements == null){
                element = 0
            }else{
                element = elements[0]*100
            }
            if (middles == null){
                middle = 0
            }else{
                middle = middles[0]*100
            }
            if (highes == null){
                high = 0
            }else{
                high = highes[0]*100
            }
            if (hcounts == null){
                hcount = 0
            }else{
                hcount = hcounts[0]*100
            }

            console.log("Parsed Data: ", parsedData);
            console.log("Labels: ", labels);
            console.log("Similarities: ", similarities);
            console.log("p", parks);
            console.log("h", hospitals);
            console.log("s", subways);
            console.log("b", buses);
            console.log("e", elements);
            console.log("m", middles);
            console.log("hi", highes);
            console.log("hc", hcounts);


            // Chart.js로 차트 생성
            try {
                const ctx = document.getElementById('myChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['공원', '병원', '지하철', '버스', '초등학교', '중학교', '고등학교', '병원수'], // X축 라벨
                        datasets: [{
                            label: (similarities[0]*100).toFixed(2),
                            data: [
                            park, // Y축 데이터 park
                            hospital, // Y축 데이터 hospital
                            bus, // Y축 데이터 bus
                            subway, // Y축 데이터 subway
                            element, // Y축 데이터 element
                            middle, // Y축 데이터 middle
                            high, // Y축 데이터 high
                            hcount, // Y축 데이터 hospitalcount
                            ],
                            backgroundColor: [
                                'rgba(111, 140, 93, 1)',
                                'rgba(255, 107, 107, 1)',
                                'rgba(255, 111, 60, 1)',
                                'rgba(134, 205, 255, 1)',
                                'rgba(255, 255, 86, 1)',
                                'rgba(155, 136, 255, 1)',
                                'rgba(175, 136, 101, 1)',
                                'rgba(255, 107, 107, 1)',
                            ],
                            //borderColor: 'rgba(106, 193, 255, 1)',
                            borderWidth: 1,
                            maxBarThickness: 20, // 최대 bar의 두께 설정
                            borderSkipped:false,
                            borderRadius: [
                                { topLeft: 20, topRight: 20},
                            ]
                        }]
                    },
                    options: {
                        title : {
                            display: true,
                            text: "title"
                        },
                        legend: {
                            display: true,
                            position: 'right'
                        },
                        scales: {
                            x: {
                              beginAtZero: true,
                              scaleLineColor: 'red',
                              grid: {
                              color: 'transparent',
                              },
                            },
                            y: {
                                beginAtZero: true, // Y축 0부터 시작
                                grid: {
                                color: 'transparent',
                                }
                            },
                        }
                    }
                });
            } catch (error) {
                console.error("Chart.js 렌더링 중 오류 발생:", error);
            }

        </script>

    <!-- 카카오맵 -->
    <div id="map" class = "map"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
            center: new kakao.maps.LatLng(37.4833939381, 127.01698271446),
            level: 5
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        function panTo() {
            <!--  이동할 위도 경도 위치를 생성합니다 -->
            var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);

            <!-- 지도 중심을 부드럽게 이동시킵니다 -->
            <!-- 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다 -->
            map.panTo(moveLatLon);
        }

        var positions = [
            {
                title: '카카오',
                latlng: new kakao.maps.LatLng(33.450705, 126.570677)
            },
            {
                title: '생태연못',
                latlng: new kakao.maps.LatLng(33.450936, 126.569477)
            },
            {
                title: '텃밭',
                latlng: new kakao.maps.LatLng(33.450879, 126.569940)
            },
            {
                title: '근린공원',
                latlng: new kakao.maps.LatLng(33.451393, 126.570738)
            }
        ];

        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (var i = 0; i < positions.length; i ++) {

            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지
            });
        }

    </script>

    <script>
        // 서버에서 전달된 JSON 데이터
        const slideData = JSON.parse('${filteredListJson}');
        const DataText = JSON.parse('${homeListJson}');
        console.log("Slide Data: ", slideData);
        console.log("Slide Data: ", DataText);

        // 템플릿과 컨테이너 참조
        const template = document.getElementById("slide-item-template");
        const slideContainer = document.getElementById("slideContentContainer");

        let currentPage = 1; // 현재 페이지
        let isLoading = false; // 데이터 로딩 상태
        const itemsPerPage = 10; // 한 번에 보여줄 아이템 수

        // 초기 데이터 렌더링 함수
        function populateSlideContent(data) {
            if (!data || data.length === 0) {
                slideContainer.innerHTML = "<p>데이터가 없습니다.</p>";
                return;
            }

            data.forEach((item) => {
                const clone = template.content.cloneNode(true);
                clone.querySelector(".list-title").textContent = item.HOME_NAME || "제목 없음";
                clone.querySelector(".list-type").textContent = item.HOME_KIND || "정보 없음";
                clone.querySelector(".deposit").textContent = item.HOME_DEP || "정보 없음";
                clone.querySelector(".monthly-rent").textContent = item.HOME_MOTH_PAI || "정보 없음";
                clone.querySelector(".company").textContent = item.HOME_CO || "정보 없음";

                const listItem = clone.querySelector(".list-item");

                listItem.addEventListener("click", () => {
                    console.log("선택된 데이터:", item);

                    // HOME_ADDRESS 필드를 사용하여 비교
                    const filteredData = DataText.filter(home =>
                        home.HOME_ADDRESS.trim().toLowerCase() === item.HOME_ADDRESS.trim().toLowerCase()
                    );

                    console.log("filteredData Data: ", filteredData);

                    // 필터링된 데이터를 보여주는 함수 호출
                    showFilteredData(filteredData);
                });

                slideContainer.appendChild(clone);
            });
        }

        function showFilteredData(data) {
            const detailContainer = document.getElementById("detailContainer");
            detailContainer.innerHTML = "";

            if (data.length === 0) {
                detailContainer.innerHTML = "<p>관련 데이터가 없습니다.</p>";
                return;
            }

            data.forEach((detail) => {
                const detailItem = document.createElement("div");
                detailItem.classList.add("detail-item");
                detailItem.innerHTML = `
                    <p>주소: ${detail.address}</p>
                    <p>보증금: ${detail.deposit}</p>
                    <p>월세: ${detail.monthlyRent}</p>
                    <p>임대사업자: ${detail.company}</p>
                `;
                detailContainer.appendChild(detailItem);
            });
        }

        // 데이터를 페이지별로 나누는 함수
        function getPaginatedData(page) {
            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            return slideData.slice(start, end);
        }

        // 초기 데이터 로드
        function init() {
            const initialData = getPaginatedData(currentPage);
            populateSlideContent(initialData);
        }

        // 스크롤 이벤트 핸들러
        async function handleScroll() {
            const { scrollTop, scrollHeight, clientHeight } = slideContainer;

            // 스크롤 하단에 도달 시 추가 데이터 로드
            if (scrollTop + clientHeight >= scrollHeight - 10 && !isLoading) {
                isLoading = true;
                currentPage++;

                const newData = getPaginatedData(currentPage);
                if (newData.length > 0) {
                    populateSlideContent(newData);
                } else {
                    console.log("더 이상 데이터가 없습니다.");
                }

                isLoading = false;
            }
        }

        // 슬라이드 패널 토글 버튼
        document.getElementById("slideToggleButton").addEventListener("click", function () {
            const panel = document.getElementById("slidingPanel");
            panel.classList.toggle("active");
            this.textContent = panel.classList.contains("active") ? "❮" : "❯";
        });

        // 이벤트 등록 및 초기화
        document.addEventListener("DOMContentLoaded", () => {
            init();
            slideContainer.addEventListener("scroll", handleScroll);
        });
    </script>


<!--<script src="/js/map.js"></script>
    <script src="/js/slide.js"></script>-->
    <!-- 동적 슬라이드를 위한 자바 스크립트 -->
    <script>
        document.getElementById("slideToggleButton").addEventListener("click", function () {
            const panel = document.getElementById("slidingPanel");
            panel.classList.toggle("active");

            // 버튼 아이콘 변경 (❮ ↔ ❯)
            this.textContent = panel.classList.contains("active") ? "❮" : "❯";
        });


    </script>


</body>
</html>