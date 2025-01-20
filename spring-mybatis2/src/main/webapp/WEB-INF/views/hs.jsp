<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>MetaHome</title>
      <!-- 카카오맵 추가 -->
      <!--<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=49f96cb9363021db6391a1ff37dbae61&libraries=services,clusterer,drawing&autoload=false"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>-->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>
    </head>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            position: relative; /* 부모 기준을 설정 */
            height: 100%; /* 화면 높이를 기준으로 설정 */
            width: 100%; /* 화면 너비를 기준으로 설정 */
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


        #map{
            position: absolute;
            top: 66px; /* styled-line1의 바로 아래로 위치 */
            left: 0;
            width: 100%; /* 화면 너비 꽉 차게 */
            height: calc(100% - 66px); /* 화면 전체 높이에서 styled-line1 위치 제외 */
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
            height: 90.3%;
            width: 430px; /* 패널 너비 */
            display: flex;
            align-items: center;
            z-index: 1000;
        }

        .sliding-panel {
            position: relative;
            top: 66px; /* 위쪽 공간을 10px로 줄임 */
            left: 0; /* 처음에는 화면 밖에 위치 */
            height: 100%;
            width: 430px;
            background-color: white;
            border-right: 1px solid lightgray; /* 왼쪽에서 나오기 때문에 오른쪽 테두리 */
            transition: left 0.3s ease; /* 슬라이드 애니메이션 */
            padding: 0px;
        }

        .sliding-panel.collapsed {
          left: -430px;
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

        .box {
          display: none;

        }

        .box.active{
          display: block;
        }

        #box1{
            margin-top: 10px;
            padding: 10px;
            background-color: rgb(255, 255, 255);
            border: 1px solid black;
            position : absolute;
            top: 40px;
            left: 20px;
            width: 70px; /* 박스 너비 */
            height: 300px; /* 박스 높이 */
            overflow-y:scroll

        }

        #box2{
            margin-top: 10px;
            padding: 10px;
            background-color: rgb(255, 255, 255);
            border: 1px solid black;
            position : absolute;
            top: 40px;
            left: 130px;
            width: 70px; /* 박스 너비 */
            height: 300px; /* 박스 높이 */
        }

        #box3{
            margin-top: 10px;
            padding: 10px;
            background-color: rgb(255, 255, 255);
            border: 1px solid black;
            position : absolute;
            top: 50px;
            left: 200px;
            width: 150px; /* 박스 너비 */
            height: 300px; /* 박스 높이 */
            overflow-y:scroll
        }

        .scroll-button{
            background-color: white; /* 기본 배경색 */
            border: 1px solid gray;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .scroll-button.selected{
            background-color: red;
            color: white;
        }

        .listBox{
            position : relative;
            top: 60px;
            max-height: 551.5px; /* 박스 높이 */
            overflow-y:scroll

        }
        .list{
            margin-top: 10px;
            padding: 10px;
            background-color: rgb(255, 255, 255);
            left: 0px;
            /* border: 1px solid black; */
        }

        .room{
            position: relative;
            top: 10px;
            left: -50px;
            width: 117%;
            height: 100px; /* 각 매물 항목의 높이를 100으로 설정 */
            display: flex;
            align-items: center; /* 내용이 세로로 중앙에 오도록 설정 */
            justify-content: center; /* 내용이 가로로 중앙에 오도록 설정 */
            background-color: #ececec; /* 배경색을 추가 (선택 사항) */
            border-bottom: 1px solid #ddd; /* 각 항목 아래에 경계선 추가 (선택 사항) */
            margin: 5px 0; /* 항목 사이에 마진을 추가 (선택 사항) */
        }


        /* 팝업 스타일 */
.popup {
    position: fixed;
    background-color: white;
    border: 1px solid black;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1000;
    padding: 15px;
    width: 200px;
    height: 100px;
    top: 100px;
    left: 400px;

}

.popup .popup-close {
    position: absolute;
    top: 5px;
    right: 5px;    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
}

        .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 15px;
        position: relative;
        bottom: 10px; /* 페이지네이션이 목록 아래에 위치하도록 설정 */
        width: 100%;
        padding: 10px;
        border-top: 1px solid #ddd; /* 상단 경계선 추가 */
        background-color: white; /* 페이지네이션 배경 색 */
        box-sizing: border-box; /* 패딩을 포함하여 전체 크기 설정 */
        }

        .pagination button {
        margin: 0 5px;
        padding: 5px 10px;
        border: 1px solid #ccc;
        background-color: white;
        cursor: pointer;
        border-radius: 4px;
        }

        .pagination .active {
        background-color: #6ac1ff; /* 활성화된 버튼 색상 */
        color: white;
        font-weight: bold;
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

        <!-- 지도 -->
        <div id="map"></div>



        <!-- slide area -->
        <div class="sliding-container">
            <div class="sliding-panel" id="slidingPanel">
                <button id="slideToggleButton" class="slide-toggle-button">❮</button>
                <button class="dropdown-button1" onclick="toggleBox('box1')">
                  지역 선택
                  <span class="dropdown-icon"></span> <!-- 화살표 -->
                </button>

                <button class="dropdown-button2" onclick="toggleBox('box2')">
                  주택 유형
                  <span class="dropdown-icon"></span> <!-- 화살표 -->
                </button>

                <button class="dropdown-button3" onclick="toggleBox('box3')">
                  생활 인프라 매칭하기
                  <span class="dropdown-icon"></span> <!-- 화살표 -->
                </button>

                <button class="icon-button" id="refreshButton" onclick="resetSelection()">
                  <span class="icon icon-refresh">&#x21BB;</span> <!-- 새로 고침 아이콘 -->
                </button>

                <hr class="styled-line2">

                <!-- 매물 목록 -->
                <div class="listBox">
                <div class="list" id="list">
                    <div>

                    </div>

                </div>

                    <div class="pagination">
                        <button id="prev-page" disabled>&lt;</button> <!-- '<' 버튼 -->
                        <button class="page-number" data-page="1">1</button>
                        <button class="page-number" data-page="2">2</button>
                        <button class="page-number" data-page="3">3</button>
                        <button class="page-number" data-page="4">4</button>
                        <button class="page-number" data-page="5">5</button>
                        <button id="next-page">&gt;</button> <!-- '>' 버튼 -->
                    </div>
                </div>





                <!-- 지역선택버튼들 -->
                <div class="box" id="box1" >
                    <div class = "scrollable-box">
                        <button class="scroll-button" onclick="selectButton(this)">버튼 1</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 2</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 3</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 4</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 5</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 6</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 7</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 8</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 9</button>
                        <button class="scroll-button" onclick="selectButton(this)">버튼 10</button>
                    </div>
                </div>

                <!-- 주택유형버튼들 -->
                <div class="box" id="box2"><div class = "scrollable-box">
                    <button class="scroll-button" onclick="selectButton(this)">버튼 1</button>
                    <button class="scroll-button" onclick="selectButton(this)">버튼 2</button>
                    <button class="scroll-button" onclick="selectButton(this)">버튼 3</button>
                    <button class="scroll-button" onclick="selectButton(this)">버튼 4</button>
                    <button class="scroll-button" onclick="selectButton(this)">버튼 5</button>
                </div></div>
                <div class="box" id="box3">
                    <input type="range" id="slider1" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider2" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider3" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider4" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider5" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider6" min="0" max="100" value="50" class="slider">
                    <input type="range" id="slider7" min="0" max="100" value="50" class="slider">
                    <button id="submitButton">제출</button>
                </div>

            </div>
        </div>







        <!-- 동적 슬라이드를 위한 자바 스크립트 -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const panel = document.getElementById("slidingPanel");
                const button = document.getElementById("slideToggleButton");

                panel.classList.add("active");

                button.addEventListener("click", function () {
                    if (panel.classList.contains("collapsed")) {
                        panel.classList.remove("collapsed");
                        panel.classList.add("active");
                        button.textContent = "❮"; // 아이콘 변경
                    } else {
                        panel.classList.remove("active");
                        panel.classList.add("collapsed");
                        button.textContent = "❯"; // 아이콘 변경
                    }
                });

                function generateRandomCoordinates() {
                    const lat = 37.5 + Math.random() * 0.2;
                    const lng = 126.9 + Math.random() * 0.2;
                    return new kakao.maps.LatLng(lat, lng);
                }

                let markers = [];

                kakao.maps.load(function () {
                    const mapContainer = document.getElementById('map');
                    const mapOption = {
                        center: new kakao.maps.LatLng(37.54699, 127.09598),
                        level: 4
                    };

                    const map = new kakao.maps.Map(mapContainer, mapOption);

                    const listings = Array.from({ length: 50 }, (_, i) => ({
                        name: `매물 ${i + 1}`,
                        coordinates: generateRandomCoordinates()
                    }));

                    const paginationButtons = document.querySelectorAll(".page-number");
                    const prevButton = document.getElementById("prev-page");
                    const nextButton = document.getElementById("next-page");

                    let currentPage = 1;
                    const totalPages = 5;
                    const listingsPerPage = 10;

                    function fetchListingsFromServer() {
                        return new Promise((resolve) => {
                            setTimeout(() => {
                                resolve(listings);
                            }, 1000);
                        });
                    }

                    function renderListings(page) {
                        fetchListingsFromServer().then((listings) => {
                            const start = (page - 1) * listingsPerPage;
                            const end = start + listingsPerPage;
                            const visibleListings = listings.slice(start, end);

                            const listingsContainer = document.getElementById("list");
                            listingsContainer.innerHTML = `
                                <ul>
                                visibleListings.map((item, index) => `
                                  <li class="room" data-index="\${index}">
                                      \${item.name}
                                  </li>
                                `).join("");
                                </ul>
                            `;

                            // 팝업이 이미 열려있으면 닫기
                            const openPopup = document.querySelector(".popup");
                            if (openPopup) {
                                openPopup.remove();
                            }

                            document.querySelectorAll(".room").forEach((room) => {
                                room.addEventListener("click", (event) => {
                                    const roomIndex = event.target.getAttribute("data-index");
                                    showPopup(`매물 정보: ${event.target.textContent}`, event.target);

                                    const selectedCoordinates = listings[roomIndex].coordinates;

                                    // 마커 삭제
                                    markers.forEach(marker => marker.setMap(null));
                                    markers = [];

                                    const marker = new kakao.maps.Marker({
                                        position: selectedCoordinates
                                    });
                                    marker.setMap(map);
                                    markers.push(marker);

                                    // 지도 중심 이동: 화면 오른쪽 절반으로 이동
                                    // 지도 중심 이동: 선택된 좌표가 화면의 200px 왼쪽에 오도록 이동
                                    const mapWidth = mapContainer.offsetWidth;
                                    const mapHeight = mapContainer.offsetHeight;

                                    // 화면에서 좌표가 위치해야 할 X축 위치 (200px 왼쪽)
                                    const moveX = selectedCoordinates.getLng() - (150 / mapWidth) * (map.getBounds().getNorthEast().getLng() - map.getBounds().getSouthWest().getLng());
                                    const moveY = selectedCoordinates.getLat();  // 세로는 그대로 중앙

                                    // 새로 이동할 지도 중심 좌표
                                    const newCenter = new kakao.maps.LatLng(moveY, moveX);

                                    // 지도 이동
                                    map.panTo(newCenter);

                                });
                            });

                            const listBox = document.querySelector(".listBox");
                            if (listBox) {
                                listBox.scrollTop = 0;
                            }
                        });
                    }

                    renderListings(currentPage);

                    function updatePagination() {
                        paginationButtons.forEach((button) => {
                            button.classList.toggle("active", button.dataset.page == currentPage);
                        });

                        prevButton.disabled = currentPage === 1;
                        nextButton.disabled = currentPage === totalPages;
                    }

                    paginationButtons.forEach((button) => {
                        button.addEventListener("click", function () {
                            currentPage = parseInt(button.dataset.page);
                            renderListings(currentPage);
                            updatePagination();
                        });
                    });

                    prevButton.addEventListener("click", function () {
                        if (currentPage > 1) {
                            currentPage--;
                            renderListings(currentPage);
                            updatePagination();
                        }
                    });

                    nextButton.addEventListener("click", function () {
                        if (currentPage < totalPages) {
                            currentPage++;
                            renderListings(currentPage);
                            updatePagination();
                        }
                    });

                    updatePagination();
                });

                function showPopup(content) {
                    // 팝업이 이미 열려 있으면 닫기
                    const existingPopup = document.querySelector(".popup");
                    if (existingPopup) {
                        existingPopup.remove();
                    }

                    // 새로운 팝업 생성
                    const popup = document.createElement("div");
                    popup.className = "popup";
                    popup.innerHTML = `
                        <div class="popup-content">
                            <div class="popup-close">×</div>
                            <div>${content}</div>
                        </div>
                    `;
                    document.body.appendChild(popup);

                    // 닫기 버튼 클릭 시 팝업 닫기
                    popup.querySelector(".popup-close").addEventListener("click", () => {
                        popup.remove();
                    });
                }

                // 매물 클릭 시 팝업 토글
                document.querySelectorAll(".room").forEach((room) => {
                    room.addEventListener("click", (event) => {
                        const roomIndex = event.target.getAttribute("data-index");
                        const popup = document.querySelector(".popup");

                        if (popup) {
                            // 이미 팝업이 열려 있으면 닫기
                            popup.remove();
                        } else {
                            // 팝업 열기
                            showPopup(`매물 정보: ${event.target.textContent}`);
                        }
                    });
                });
            });
   </script>



    <!-- //     // 매물 목록을 렌더링
    //     function renderListings(page) {
    //     const start = (page - 1) * listingsPerPage;
    //     const end = start + listingsPerPage;
    //     const visibleListings = listings.slice(start, end);

    //     const listingsContainer = document.getElementById("list");
    //     listingsContainer.innerHTML = `
    //         <ul>
    //         visibleListings.map((item, index) => `<li class="room" data-index="\${index}">\${item}</li>`).join("");
    //         </ul>
    //     `;

    //     document.querySelectorAll(".room").forEach((room) => {
    //     room.addEventListener("click", (event) => {
    //         const roomIndex = event.target.getAttribute("data-index");
    //         // 해당 매물에 대한 사각형 팝업을 띄웁니다
    //         showPopup(`매물 정보: ${event.target.textContent}`, event.target);
    //     });
    // });

    //     const listBox = document.querySelector(".listBox");
    // if (listBox) {
    //     listBox.scrollTop = 0; // 스크롤을 맨 위로 이동
    // }
    //     }


    //     //팝업관리함수
    //     let activePopup = null; // 현재 활성화된 팝업을 추적

    //     function showPopup(content, target) {
    //     // 이미 팝업이 활성화되어 있으면 기존 팝업을 닫습니다
    //         if (activePopup) {
    //             activePopup.popup.remove();
    //         }

    //         // 새로운 팝업 생성
    //         const popup = document.createElement("div");
    //         popup.className = "popup";  // 팝업에 대한 클래스 설정
    //         popup.innerHTML = `
    //             <div class="popup-content">
    //                 <div class="popup-close">×</div>
    //                 <div>${content}</div>
    //             </div>
    //         `;

    //         // 팝업을 body에 추가
    //         document.body.appendChild(popup);

    //         // 닫기 버튼에 클릭 이벤트 추가
    //         popup.querySelector(".popup-close").addEventListener("click", () => {
    //             popup.remove();
    //             activePopup = null;  // 팝업 상태 초기화
    //         });

    //         // 새로운 팝업을 활성화된 팝업으로 저장
    //         activePopup = { popup, target };
    //     }



        // // 페이지 변경 이벤트 핸들러
        // function changePage(page) {
        //     currentPage = page;
        //     renderListings(page);
        //     updatePagination();
        // }

        // // 버튼 클릭 이벤트 등록
        // paginationButtons.forEach((button) => {
        //     button.addEventListener("click", function () {
        //     changePage(Number(this.dataset.page));
        //     });
        // });

        // prevButton.addEventListener("click", function () {
        //     if (currentPage > 1) changePage(currentPage - 1);
        // });

        // nextButton.addEventListener("click", function () {
        //     if (currentPage < totalPages) changePage(currentPage + 1);
        // });

        // // 초기 렌더링
        // renderListings(currentPage);
        // updatePagination();

   -->







    </body>
    </html>