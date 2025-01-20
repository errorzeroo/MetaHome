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
  <link rel="stylesheet" type="text/css" href="style.css">
  <script src="script.js"></script>
</head>

<body>

    <!-- 선위에 요소들 style에 .클래스 이름으로 스타일 정의해 놓음 -->
    <h3 class = "title">메타홈</h3>
    <button class = "white-button1">맞춤 지도</button>
    <button class = "white-button2">우리 동네 이사와 생활 서비스</button>
    <button class = "white-button3">로그인</button>
    <button class = "white-button4">멤버쉽 가입</button>

    <!-- 위쪽 선 -->
    <hr class="styled-line1">

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
            const labels = parsedData.map(item => item.adress); // 주소를 라벨로 사용
            const similarities = parsedData.map(item => item.similarity); // 유사도 점수

            console.log("Parsed Data: ", parsedData);
            console.log("Labels: ", labels);
            console.log("Similarities: ", similarities);

            // Chart.js로 차트 생성
            try {
                const ctx = document.getElementById('myChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels, // X축 라벨
                        datasets: [{
                            label: '유사도 점수',
                            data: similarities, // Y축 데이터
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true, // Y축 0부터 시작
                                max: 1.1 // 최대값 1.1로 설정
                            }
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

<!--<script src="/js/map.js"></script>
    <script src="/js/slide.js"></script>-->
    <!-- 동적 슬라이드를 위한 자바 스크립트 -->
    


</body>
</html>
<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>Title</title>
      <!-- 카카오맵 추가 -->
      <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=49f96cb9363021db6391a1ff37dbae61&libraries=services,clusterer,drawing&autoload=false"></script>
    </head>
    
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
        
            
            

    <!-- //     // 매물 목록을 렌더링
    //     function renderListings(page) {
    //     const start = (page - 1) * listingsPerPage;
    //     const end = start + listingsPerPage;
    //     const visibleListings = listings.slice(start, end);

    //     const listingsContainer = document.getElementById("list");
    //     listingsContainer.innerHTML = `
    //         <ul>
    //         ${visibleListings.map((item, index) => `<li class="room"data-index="${index}">${item}</li>`).join("")}
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