<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 캐시 비활성화 설정
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Metahome</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- 카카오맵 -->
    <div id="map" class = "map"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>
    <link rel="stylesheet" href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css">
     <link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
     <link rel="stylesheet" href="/css/test.css">

</head>
<body>

    <!-- 선위에 요소들 style에 .클래스 이름으로 스타일 정의해 놓음 -->
    <img src="/images/icon/logo.png" alt="아이콘" class="logo">
    <h3 class = "title">메타홈</h3>
    <div class="menu">
    <!--<button class = "white-button1">맞춤 지도</button>
    <button class = "white-button2" onclick="showAlert()">우리 동네 이사와 생활 서비스</button>
    <button class = "white-button3" onclick="showAlert()">로그인</button>
    <button class = "white-button4" onclick="showAlert()">멤버쉽 가입</button>-->
    </div>
    <!-- 위쪽 선 -->
    <hr class="styled-line1">

    <!-- 템플릿 -->
     <template id="slide-item-template">
         <div class="list-item" data-address="{{address}}">
             <div class="list-header">
                <img src="/images/icon/slideButton.png" class="title-icon" >
                 <span class="list-title"></span>
             </div>
             <div class="vertical-line"></div>
             <div class="list-subtitle">
                 <span class="list-type"></span>
             </div>
             <div class="vertical-line2"></div>
            <div class="dep">
                 <span class="detail-label-deposit">임대 보증금:</span>
                 <span class="detail-value deposit"></span>
             </div>

             <div class="month">
                 <span class="detail-label-month">월 임대료:</span>
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
            <button id="slideToggleButton" class="slide-toggle-button">❮</button>
            <button class="dropdown-button1" id="dropdownButton" onclick="toggleBox('box1')">
              지역 선택
              <span class="dropdown-icon"></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button2" id="homeKindButton" onclick="toggleBox('box2')">
              주택 유형
              <span class="dropdown-icon" ></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button3" id="infrastructureButton">
                <span>생활 인프라 매칭하기</span>
              <img src="/images/icon/MATCHING.png" class="matching_icon"> <!-- 화살표 -->
              <!--<button class="searchButton">검색</button>-->
            </button>

            <hr class="styled-line2">

            <!-- 지역선택버튼들 -->
            <div class="box" id="box1" >
                <div class = "scrollable-box">

                    <!--<button class="icon-button" id="refreshButton1" onclick="resetSelection1()">
                                  <span class="icon icon-refresh">&#x21BB;</span>--> <!-- 새로 고침 아이콘 -->
                    </button>
                        <button class="scroll-button" onclick="setAddress('강남구')">강남구</button>
                        <button class="scroll-button" onclick="setAddress('강동구')">강동구</button>
                        <button class="scroll-button" onclick="setAddress('강북구')">강북구</button>
                        <button class="scroll-button" onclick="setAddress('강서구')">강서구</button>
                        <button class="scroll-button" onclick="setAddress('관악구')">관악구</button>
                        <button class="scroll-button" onclick="setAddress('광진구')">광진구</button>
                        <button class="scroll-button" onclick="setAddress('구로구')">구로구</button>
                        <button class="scroll-button" onclick="setAddress('금천구')">금천구</button>
                        <button class="scroll-button" onclick="setAddress('노원구')">노원구</button>
                        <button class="scroll-button" onclick="setAddress('도봉구')">도봉구</button>
                        <button class="scroll-button" onclick="setAddress('동대문구')">동대문구</button>
                        <button class="scroll-button" onclick="setAddress('동작구')">동작구</button>
                        <button class="scroll-button" onclick="setAddress('마포구')">마포구</button>
                        <button class="scroll-button" onclick="setAddress('서대문구')">서대문구</button>
                        <button class="scroll-button" onclick="setAddress('서초구')">서초구</button>
                        <button class="scroll-button" onclick="setAddress('성동구')">성동구</button>
                        <button class="scroll-button" onclick="setAddress('성북구')">성북구</button>
                        <button class="scroll-button" onclick="setAddress('송파구')">송파구</button>
                        <button class="scroll-button" onclick="setAddress('양천구')">양천구</button>
                        <button class="scroll-button" onclick="setAddress('영등포구')">영등포구</button>
                        <button class="scroll-button" onclick="setAddress('용산구')">용산구</button>
                        <button class="scroll-button" onclick="setAddress('은평구')">은평구</button>
                        <button class="scroll-button" onclick="setAddress('종로구')">종로구</button>
                        <button class="scroll-button" onclick="setAddress('중구')">중구</button>
                        <button class="scroll-button" onclick="setAddress('중랑구')">중랑구</button>

                </div>
            </div>

            <!-- 주택유형버튼들 -->
            <div class="box" id="box2"><div class = "scrollable-box">
                <button class="scroll-button" onclick="setHomeKind('전체')">전체</button>
                <button class="scroll-button" onclick="setHomeKind('아파트')">아파트</button>
                <button class="scroll-button" onclick="setHomeKind('연립주택')">연립주택</button>
                <button class="scroll-button" onclick="setHomeKind('다세대주택')">다세대주택</button>
                <button class="scroll-button" onclick="setHomeKind('단독주택')">단독주택</button>
                <button class="scroll-button" onclick="setHomeKind('다가구주택')">다가구주택</button>
                <button class="scroll-button" onclick="setHomeKind('오피스텔')">오피스텔</button>
            </div></div>

           <!-- 생활 인프라 슬라이더 -->
           <div class="box" id="box3">
               <button class="icon-button2" id="refreshButton2">
                   <span class="icon icon-refresh">&#x21BB;</span> <!-- 새로 고침 아이콘 -->
               </button>


               <h3 class="section-title">당신에게 얼마나 중요한지 알려주세요!</h3>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/subway.png" alt="지하철 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">지하철</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="1.00" class="slider" id="subwaySlider">
                             <!--<span class="slider-value" id="subwaySliderValue">1.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/bus.png" alt="버스 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">버스</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">

                            <input type="range" min="0" max="1" step="0.01" value="1.00" class="slider" id="busSlider">

                            <!-- <span class="slider-value" id="busSliderValue">1.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/element.png" alt="초등학교 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">초등학교</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="elementarySlider">
                             <!--<span class="slider-value" id="elementarySliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/middle.png" alt="중학교 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">중학교</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="middleSlider">
                             <!--<span class="slider-value" id="middleSliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/high.png" alt="고등학교 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">고등학교</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="highSlider">
                            <!--<span class="slider-value" id="highSliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/hospitalcount.png" alt="병원 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">병원</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="hospitalSlider">
                            <!--<span class="slider-value" id="hospitalSliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/parking.png" alt="주차장 아이콘" class="infrastructure-icon">
                        <p class="infrastructure-name">주차장</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="parkingSlider">
                            <!--<span class="slider-value" id="parkingSliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div class="infrastructure-item">
                    <div class="icon-container">
                        <img src="/images/icon/park.png" alt="공원 아이콘" class="infrastructure-icon">
                        <!--<img src="/images/icon/Park_text.png" alt="park_txt" class="infrastructure-text">-->
                        <p class="infrastructure-name">공원</p>
                    </div>
                    <div class="slider-container">
                        <div class="slider-labels">
                            <span>없어도 괜찮아요</span>
                            <span>있으면 좋아요</span>
                            <span>꼭 있어야 해요</span>
                        </div>
                        <div class="slider-wrapper">
                            <input type="range" min="0" max="1" step="0.01" value="0.00" class="slider" id="parkSlider">
                            <!--<span class="slider-value" id="parkSliderValue">0.00</span>-->
                        </div>
                    </div>
                </div>

                <div><p></p><br></div>
                <div></div>

               <!-- 하단 고정 버튼 -->
               <button class="fixed-bottom-button" id="submitButton">나에게 맞는 집 찾기!</button>

           </div>



            <div class="list-check-button"> <button id="checkButton">
            <img id="checkImage" src="/images/icon/CHECK.png" class="checkB" onclick="setRecruit">
            모집 중인 매물만 확인! </button></div>



            <div id="slideContentContainer" class="slide-content-container">
            </div>
            <div id="detailContainer"></div>


        </div>
    </div>

        <div id="infoCard" class="info-card hidden">
            <button id="closeInfoCard" class="close-info-card">×</button>
            <button id="prevSlide" class="slide-btn1">‹</button>
            <div class="card-content">
                <h4 class="info-card-title">
                    <img src="/images/icon/slideButton.png" alt="slide" class="slide-logo-title">
                    <span id="infoCardName"></span>
                </h4>
                <hr>
                <div class="pd" id="infoCardKind"></div>
                <div class="area">
                    <p class="pd10">
                        <span style="color: gray;">공급번호&nbsp;|</span>
                        <span id="infoCardNo" class="span1"></span>
                        <span class="info-card-txtc" style="color: gray;">임대사업자&nbsp;|</span>
                        <span id="infoCardCompany"></span></p>
                    <p class="pd10">
                        <span style="color: gray;">세대수&emsp;&nbsp;|</span>
                        <span id="infoCardCount" class="span2"></span>
                        <span class="info-card-txtc" style="color: gray;">주차대수&emsp;&nbsp;|</span>
                        <span id="infoCardParking" style="text-align:right;"></span></p>
                    <p class="pd10">
                        <span style="color: gray;">주소&emsp;&emsp;&nbsp;|</span>
                        <span id="infoCardAddress" class="addressSize"></span></p>
                    <hr>
                    <p class="pd10">
                        <img src="/images/icon/slideButton.png" alt="slide" class="slide-logo">
                        <span>임대 보증금 :</span> <span class="info-card-label" id="infoCardDeposit" style="position: absolute; right: 30px;"></span></p>
                    <p class="pd20">
                        <img src="/images/icon/slideButton.png" alt="slide" class="slide-logo">
                        <span>월 임대료 :</span>
                        <span class="info-card-label" id="infoCardRent" style="position: absolute; right: 30px;"></span></p><hr>
                    <p class="pd10">
                        <span>공급면적</span></p>
                    <p class="pd20">
                        <img src="/images/icon/slideButton.png" alt="slide" class="slide-logo">
                        <span style="color: dimgray;">전용 : </span> <span class="span3" id="infoCardMy"></span>
                        <img src="/images/icon/slideButton.png" alt="slide" class="slide-logo">
                        <span style="color: dimgray;">공용 : </span><span class="span4" id="infoCardWe"></span></p>
                    <p>
                </div>
                    <hr class="long-hr">
                    <p class="pd30">
                        <span>우리집에서 얼마?</span>
                    </p>
                    <div class="icon-grid">
                        <!-- 아이콘 리스트 -->
                        <div class="icon-grid-item">
                            <img src="/images/icon/subway.png" alt="지하철">
                            <span class="span30" id="infoCardSubway"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/bus.png" alt="버스">
                            <span class="span30" id="infoCardBus"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/element.png" alt="초등학교">
                            <span class="span30" id="infoCardLow"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/middle.png" alt="중학교">
                            <span class="span30" id="infoCardMid"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/high.png" alt="고등학교">
                            <span class="span30" id="infoCardHigh"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/hospitalcount.png" alt="병원">
                            <span class="span30" id="infoCardHos"></span>
                        </div>
                         <div class="icon-grid-item">
                            <img src="/images/icon/parking.png" alt="주차장">
                            <span class="span30" id="infoCardParking1"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/park.png" alt="공원">
                            <span class="span30" id="infoCardPark"></span>
                        </div>
                    </div>


                </p>
                    <span id="infoCardImg"></span>
                </p>
            </div>
            <button id="nextSlide" class="slide-btn2">›</button>
        </div>

        <!-- 차트 추가 -->
        <div class="chart-container-with-score" id="chartContainer">
            <div class="chart-container">
                <canvas id="myChart"></canvas>
            </div>
            <div class="score-container">
                <div class="score-content">
                    <img src="/images/icon/logo.png" alt="점수 아이콘" class="score-image">
                    <div class="score-text">
                        <span class="score-number">96</span><span>점</span>
                    </div>
                </div>
            </div>
        </div>

        <div id="categoryBar">
            <button class="map-buttons" onclick="toggleSubMarkers(this)">지하철</button>
            <button class="map-buttons" onclick="toggleBusMarkers(this)">버스</button>
            <button class="map-buttons" onclick="toggleElemMarkers(this)">초등학교</button>
            <button class="map-buttons" onclick="toggleMidMarkers(this)">중학교</button>
            <button class="map-buttons" onclick="toggleHighMarkers(this)">고등학교</button>
            <button class="map-buttons" onclick="toggleHospMarkers(this)">병원</button>
            <button class="map-buttons" onclick="toggleParkingMarkers(this)">주차장</button>
            <button class="map-buttons" onclick="toggleParkMarkers(this)">공원</button>
        </div>


    <script src = "/js/slider.js"></script>


    <script>
    // 기본 지도 그리기
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.4833939381, 127.01698271446), // 초기 위치
            level: 5 // 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    let subwayVisible = false; // 마커 초기 상태: 안 보이는 상태 true
    let subwayMarkers = [];
    let busVisible = false;
    let busMarkers = [];
    let parkVisible = false;
    let parkMarkers = [];
    let elemVisible = false;
    let elemMarkers = [];
    let midVisible = false;
    let midMarkers = [];
    let highVisible = false;
    let highMarkers = [];
    let hospVisible = false;
    let hospMarkers = [];
    let parkingVisible = false;
    let parkingMarkers = [];
    let currentMarker = null;



    // 버튼 클릭 시 마커 토글 함수
     function toggleSubMarkers(button) {
        if (subwayVisible) {
            // 보이는 상태에서 클릭하면 마커 숨기기
            subwayMarkers.forEach((marker) => marker.setMap(null));
        } else {
            // 보이지 않는 상태에서 클릭하면 마커 보이기
            subwayMarkers.forEach((marker) => marker.setMap(map));
        }

        // 마커 상태 업데이트
        subwayVisible = !subwayVisible;

        // 클릭된 버튼의 'active' 클래스 토글
        button.classList.toggle('active');
    }

    function toggleBusMarkers(button) {
        if (busVisible) {
            // 보이는 상태에서 클릭하면 마커 숨기기
            busMarkers.forEach((marker) => marker.setMap(null));
        } else {
            // 보이지 않는 상태에서 클릭하면 마커 보이기
            busMarkers.forEach((marker) => marker.setMap(map));
        }

        // 마커 상태 업데이트
        busVisible = !busVisible;

        // 클릭된 버튼의 'active' 클래스 토글
        button.classList.toggle('active');
   }

   function toggleParkMarkers(button) {
        if (parkVisible) {
           // 보이는 상태에서 클릭하면 마커 숨기기
           parkMarkers.forEach((marker) => marker.setMap(null));
        } else {
           // 보이지 않는 상태에서 클릭하면 마커 보이기
           parkMarkers.forEach((marker) => marker.setMap(map));
        }

        // 마커 상태 업데이트
        parkVisible = !parkVisible;

        // 클릭된 버튼의 'active' 클래스 토글
        button.classList.toggle('active');
  }

   function toggleElemMarkers(button) {
        if (elemVisible) {
          // 보이는 상태에서 클릭하면 마커 숨기기
          elemMarkers.forEach((marker) => marker.setMap(null));
        } else {
          // 보이지 않는 상태에서 클릭하면 마커 보이기
          elemMarkers.forEach((marker) => marker.setMap(map));
        }

        // 마커 상태 업데이트
        elemVisible = !elemVisible;

        // 클릭된 버튼의 'active' 클래스 토글
        button.classList.toggle('active');
   }

    function toggleMidMarkers(button) {
        if (midVisible) {
             // 보이는 상태에서 클릭하면 마커 숨기기
             midMarkers.forEach((marker) => marker.setMap(null));
        } else {
             // 보이지 않는 상태에서 클릭하면 마커 보이기
             midMarkers.forEach((marker) => marker.setMap(map));
        }

         // 마커 상태 업데이트
         midVisible = !midVisible;

         // 클릭된 버튼의 'active' 클래스 토글
         button.classList.toggle('active');
    }


    function toggleHighMarkers(button) {
         if (highVisible) {
             // 보이는 상태에서 클릭하면 마커 숨기기
             highMarkers.forEach((marker) => marker.setMap(null));
         } else {
             // 보이지 않는 상태에서 클릭하면 마커 보이기
             highMarkers.forEach((marker) => marker.setMap(map));
         }

         // 마커 상태 업데이트
         highVisible = !highVisible;

         // 클릭된 버튼의 'active' 클래스 토글
         button.classList.toggle('active');
    }

    function toggleHospMarkers(button) {
         if (hospVisible) {
             // 보이는 상태에서 클릭하면 마커 숨기기
             hospMarkers.forEach((marker) => marker.setMap(null));
         } else {
             // 보이지 않는 상태에서 클릭하면 마커 보이기
             hospMarkers.forEach((marker) => marker.setMap(map));
         }

         // 마커 상태 업데이트
         hospVisible = !hospVisible;

         // 클릭된 버튼의 'active' 클래스 토글
         button.classList.toggle('active');
    }
     function toggleParkingMarkers(button) {
         if (parkingVisible) {
             // 보이는 상태에서 클릭하면 마커 숨기기
             parkingMarkers.forEach((marker) => marker.setMap(null));
         } else {
             // 보이지 않는 상태에서 클릭하면 마커 보이기
             parkingMarkers.forEach((marker) => marker.setMap(map));
         }

         // 마커 상태 업데이트
         parkingVisible = !parkingVisible;

         // 클릭된 버튼의 'active' 클래스 토글
         button.classList.toggle('active');
    }

document.addEventListener("DOMContentLoaded", function () {
    // 초기 값 설정 (기본값)
    const defaultValues = {
        busSlider: 1.00,
        subwaySlider: 1.00,
        elementarySlider: 0.00,
        middleSlider: 0.00,
        highSlider: 0.00,
        hospitalSlider: 0.00,
        parkingSlider: 0.00,
        parkSlider: 0.00
    };

        // 슬라이더와 값 표시 엘리먼트 매핑
        const sliders = [
            { id: "busSlider", valueId: "busSliderValue" },
            { id: "subwaySlider", valueId: "subwaySliderValue" },
            { id: "elementarySlider", valueId: "elementarySliderValue" },
            { id: "middleSlider", valueId: "middleSliderValue" },
            { id: "highSlider", valueId: "highSliderValue" },
            { id: "hospitalSlider", valueId: "hospitalSliderValue" },
            { id: "parkingSlider", valueId: "parkingSliderValue" },
            { id: "parkSlider", valueId: "parkSliderValue" }
        ];

        // 모든 슬라이더에 이벤트 리스너 추가
        sliders.forEach(({ id, valueId }) => {
            const slider = document.getElementById(id);
            const valueDisplay = document.getElementById(valueId);

            if (slider && valueDisplay) {
                slider.addEventListener("input", function () {
                    valueDisplay.textContent = parseFloat(slider.value).toFixed(2); // 실시간 값 반영
                });
            }
        });

        // 새로 고침 버튼 클릭 시 초기 값으로 설정
        document.getElementById("refreshButton2").addEventListener("click", function () {
            sliders.forEach(({ id, valueId }) => {
                const slider = document.getElementById(id);
                const valueDisplay = document.getElementById(valueId);

                if (slider && valueDisplay) {
                    slider.value = defaultValues[id]; // 슬라이더 값을 초기값으로 복원
                    valueDisplay.textContent = defaultValues[id].toFixed(2); // 값 표시 업데이트
                }
            });
        });
    });

    document.getElementById('refreshButton2').addEventListener('click', function () {
        const defaultValues = {
            busSlider: 1.00,
            subwaySlider: 1.00,
            elementarySlider: 0.00,
            middleSlider: 0.00,
            highSlider: 0.00,
            hospitalSlider: 0.00,
            parkingSlider: 0.00,
            parkSlider: 0.00
        };

        Object.keys(defaultValues).forEach(sliderId => {
            const slider = document.getElementById(sliderId);
            if (slider) {
                slider.value = defaultValues[sliderId]; // 기본값으로 초기화
            }
        });
    });





    // 차트를 보이는 함수
    function showChart() {
        document.getElementById('chartContainer').style.display = 'flex'; // 차트 컨테이너 표시 block
    }

    // 차트를 숨기는 함수
    function hideChart() {
        document.getElementById('chartContainer').style.display = 'none'; // 차트 컨테이너 숨김
    }

    // 서버에서 전달된 JSON 데이터
    const slideData = JSON.parse('${filteredListJson}');
    const DataText = JSON.parse('${homeListJson}');
    const subwayCoords = JSON.parse('${subwayListJson}');
    const busCoords = JSON.parse('${busListJson}');
    const parkCoords = JSON.parse('${parkListJson}');
    const elemCoords = JSON.parse('${elemListJson}');
    const midCoords = JSON.parse('${midListJson}');
    const highCoords = JSON.parse('${highListJson}');
    const hospCoords = JSON.parse('${hospListJson}');
    const parkingCoords = JSON.parse('${parkingListJson}');


    // 템플릿과 컨테이너 참조
    const template = document.getElementById("slide-item-template");
    const slideContainer = document.getElementById("slideContentContainer");

    let currentPage = 1; // 현재 페이지
    let isLoading = false; // 데이터 로딩 상태
    const itemsPerPage = 10; // 한 번에 보여줄 아이템 수



    // 초기 데이터 렌더링 함수
    function populateSlideContent(data) {
        if (!data || data.length === 0) {
            slideContainer.innerHTML = "<p class='no-data-message'>데이터가 없습니다.</p>";
            return;
        }



        // 지하철 좌표를 기반으로 마커 생성
        subwayCoords.forEach((subway) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(subway.SUB_LAT, subway.SUB_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/subway.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            subwayMarkers.push(marker); // 배열에 마커 저장
        });

        // 버스 좌표를 기반으로 마커 생성
        busCoords.forEach((bus) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(bus.BUS_LAT, bus.BUS_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/bus.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            busMarkers.push(marker); // 배열에 마커 저장
        });

        // 공원 좌표를 기반으로 마커 생성
        parkCoords.forEach((park) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(park.PARK_LAT, park.PARK_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/park.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            parkMarkers.push(marker); // 배열에 마커 저장
        });


        // 초등 좌표를 기반으로 마커 생성
        elemCoords.forEach((elem) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(elem.LOW_LAT, elem.LOW_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/element.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            elemMarkers.push(marker); // 배열에 마커 저장
        });


        // 중등 좌표를 기반으로 마커 생성
        midCoords.forEach((mid) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(mid.MID_LAT, mid.MID_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/middle.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            midMarkers.push(marker); // 배열에 마커 저장
        });



        // 고등 좌표를 기반으로 마커 생성
        highCoords.forEach((high) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(high.HI_LAT, high.HI_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/high.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            highMarkers.push(marker); // 배열에 마커 저장
        });

        // 병원 좌표를 기반으로 마커 생성
               hospCoords.forEach((hosp) => {
                    const marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(hosp.HOS_LAT, hosp.HOS_LON),
                        image: new kakao.maps.MarkerImage(
                            '/images/icon/hospitalcount.png',
                            new kakao.maps.Size(30, 30) // 마커 이미지 크기
                        )
                    });

                    // 마커 클릭 이벤트
                    //kakao.maps.event.addListener(marker, 'click', function () {
                       // alert(`${subway.SUB_NAME} 지하철역입니다.`);
                    //});

                    // 마커 초기 상태: 지도에 표시되지 않도록 숨김
                    marker.setMap(null);

                    hospMarkers.push(marker); // 배열에 마커 저장
                });

    // 병원 좌표를 기반으로 마커 생성
       parkingCoords.forEach((parking) => {
            const marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(parking.PARKING_LAT, parking.PARKING_LON),
                image: new kakao.maps.MarkerImage(
                    '/images/icon/parking.png',
                    new kakao.maps.Size(30, 30) // 마커 이미지 크기
                )
            });

            // 마커 클릭 이벤트
            //kakao.maps.event.addListener(marker, 'click', function () {
               // alert(`${subway.SUB_NAME} 지하철역입니다.`);
            //});

            // 마커 초기 상태: 지도에 표시되지 않도록 숨김
            marker.setMap(null);

            parkingMarkers.push(marker); // 배열에 마커 저장
        });





        data.forEach((item) => {
            const clone = template.content.cloneNode(true);
            clone.querySelector(".list-title").textContent = item.HOME_NAME || "제목 없음";
            clone.querySelector(".list-type").textContent = item.HOME_KIND || "정보 없음";
            clone.querySelector(".deposit").textContent = item.HOME_DEP || "정보 없음";
            clone.querySelector(".monthly-rent").textContent = item.HOME_MOTH_PAI || "정보 없음";
            clone.querySelector(".company").textContent = item.HOME_CO || "정보 없음";
            const listItem = clone.querySelector(".list-item");

            listItem.addEventListener("click", () => {

            // 슬라이더 값을 동적으로 가져오는 함수
            function getSliderValues() {
                const sliders = [
                    { id: "subwaySlider", name: "subway" },
                    { id: "busSlider", name: "bus" },
                    { id: "elementarySlider", name: "element" },
                    { id: "middleSlider", name: "middle" },
                    { id: "highSlider", name: "high" },
                    { id: "hospitalSlider", name: "hospitalcount" },
                    { id: "parkingSlider", name: "parking" },
                    { id: "parkSlider", name: "park" }
                ];

                // 슬라이더 값 가져오기 및 필터링 (0.00 값 제거)
                const values = sliders
                    .map(slider => ({
                        column: slider.name,
                        value: parseFloat(document.getElementById(slider.id).value)
                    }))
                    .filter(slider => slider.value !== 0.00); // 값이 0.00인 항목 제거

                return values;
            }

            const sliderData = getSliderValues();


             // 선택한 리스트의 주소를 이용해서 차트 그리기
            const address = item.HOME_ADDRESS.trim();
            const homeKind = item.HOME_KIND.trim();
            // 컬럼 이름과 값 배열로 변환
            const columns = sliderData.map(s => s.column).join(',');
            const values = sliderData.map(s => s.value).join(',');


            fetch(`/home/chart?address=\${encodeURIComponent(address)}&homeKind=\${encodeURIComponent(homeKind)}&columns=\${encodeURIComponent(columns)}&values=\${encodeURIComponent(values)}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json(); // 서버에서 JSON 결과를 받음
                })
                .then(jdata => {
                    // 받은 데이터를 화면에 렌더링
                    const jsonData = jdata;
                    const parsedData = jsonData;

                    // 📌 1. 키 배열 가져오기 (첫 번째와 두 번째 키 제외)
                    const keys = Object.keys(parsedData[0]);
                    const relevantKeys = keys.slice(3); // 첫 번째(0)와 두 번째(1) 키 제외

                    // 📌 2. 8개 인프라 요소의 기본값을 0으로 초기화
                    const defaultValues = {
                        subway: 0,
                        bus: 0,
                        element: 0,
                        middle: 0,
                        high: 0,
                        hospitalcount: 0,
                        parking: 0,
                        park: 0,
                    };

                    // 📌 3. 서버에서 받은 데이터로 값 업데이트
                    relevantKeys.forEach(key => {
                        if (defaultValues.hasOwnProperty(key)) {
                            defaultValues[key] = parsedData[0][key] * 100; // 서버 값 적용
                        }
                    });

                    // 📌 4. 점수 계산 및 UI 업데이트
                    const score = Math.floor(parsedData[0].similar * 100);
                    document.querySelector(".score-number").textContent = score;

                    // 3. 키 매핑 테이블 정의 (영어 -> 한국어)
                    const keyMapping = {
                        subway: "지하철",
                        bus: "버스",
                        element: "초등학교",
                        middle: "중학교",
                        high: "고등학교",
                        hospitalcount: "병원",
                        parking: "주차장",
                        park: "공원"
                    };

                    // 🎨 4. 키별 색상 매핑
                    const colorMapping = {
                        subway: 'rgba(255, 111, 60, 1)',
                        bus: 'rgba(134, 205, 255, 1)',
                        element: 'rgba(126, 212, 33, 1)',
                        middle: 'rgba(155, 136, 255, 1)',
                        high: 'rgba(175, 136, 101, 1)',
                        hospitalcount: 'rgba(255, 107, 107, 1)',
                        parking: 'rgba(101, 247, 245, 1)',
                        park: 'rgba(111, 140, 93, 1)'
                    };

                    // 라벨별 이미지 매핑
                    const labelImagesMapping = {
                        subway: "/images/icon/subway.png",
                        bus: "/images/icon/bus.png",
                        element: "/images/icon/element.png",
                        middle: "/images/icon/middle.png",
                        high: "/images/icon/high.png",
                        hospitalcount: "/images/icon/hospitalcount.png",
                        parking: "/images/icon/parking.png",
                        park: "/images/icon/park.png"
                    };

                    // 🎯 5. 라벨, 데이터, 색상, 이미지 추출
                    const labels = Object.keys(defaultValues).map(key => keyMapping[key] || key);
                    const data = Object.values(defaultValues);
                    const backgroundColors = Object.keys(defaultValues).map(key => colorMapping[key]);
                    const labelImages = Object.keys(defaultValues).map(key => labelImagesMapping[key]);

                    // 6. Chart.js로 차트 생성
                    try {
                        const ctx = document.getElementById('myChart').getContext('2d');

                        // 기존 차트 제거하기 전에 Chart 객체인지 확인
                        if (window.myChart instanceof Chart) {
                            window.myChart.destroy();
                        }

                        // 새 차트 생성
                        window.myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels, // X축 라벨
                                datasets: [{
                                    label: "생활 인프라 매칭 점수",
                                    data: data, // Y축 데이터
                                    backgroundColor: backgroundColors,
                                    borderWidth: 1,
                                    maxBarThickness: 15, // 막대 최대 두께
                                    borderSkipped: false,
                                    borderRadius: [
                                        { topLeft: 10, topRight: 10 },
                                    ]
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        grid: { display: false },
                                        ticks: {
                                            color: 'white', // 라벨 글자 색상
                                            font: { family: 'Spoqa Han Sans Neo', size: 14 } // 글자 크기
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        grid: { display: false },
                                    }
                                },
                                plugins: {
                                    title: {
                                        display: true,
                                        text: '생활 인프라 매칭 점수',
                                        font: { family: 'Spoqa Han Sans Neo', size: 16 },
                                        margin: {left: 14},
                                        padding: { left: 15, top: 10, bottom: 20 },
                                        align: 'start',
                                        color: '#333'
                                    },
                                    legend: {
                                        display: false,
                                        labels:{
                                            font:{family: 'Spoqa Han Sans Neo', size: 16 },
                                            margin:{left:14}

                                        }
                                    },
                                    tooltip: {
                                        enabled: true
                                    }
                                }
                            },
                            plugins: [
                                {
                                    id: 'custom-label-images',
                                    afterDraw(chart) {
                                        const ctx = chart.ctx;
                                        const xAxis = chart.scales.x;
                                        const yAxis = chart.scales.y;

                                        xAxis.ticks.forEach((tick, index) => {
                                            const x = xAxis.getPixelForTick(index);
                                            const imageY = yAxis.bottom + 10;
                                            const textY = imageY + 45;

                                            // 이미지를 라벨에 맞게 가져오기
                                            const image = new Image();
                                            image.src = labelImages[index];

                                            // 이미지를 그리기
                                            image.onload = () => {
                                                ctx.drawImage(image, x - 17, imageY, 30, 30); // 이미지 위치와 크기 조정
                                            };

                                            // 텍스트를 이미지 아래에 추가
                                            ctx.font = '10px Arial';
                                            ctx.textAlign = 'center';
                                            ctx.fillStyle = 'black';
                                            ctx.fillText(labels[index], x, textY);
                                        });
                                    }
                                }
                            ]
                        });
                    } catch (error) {
                        console.error("Chart.js 렌더링 중 오류 발생:", error);
                    }

                })
                .catch(error => {
                    console.error("데이터 처리 중 오류 발생:", error);
                });



















                // HOME_ADDRESS 필드를 사용하여 데이터 필터링
                const filteredData = DataText.filter(
                    (home) => home.HOME_ADDRESS.trim().toLowerCase() === item.HOME_ADDRESS.trim().toLowerCase()
                );
                // 주소-좌표 변환 객체를 생성합니다
                const geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(item.HOME_ADDRESS, function(result, status) {

                    // 정상적으로 검색이 완료됐으면
                     if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 기존 마커 제거
                        if (currentMarker) {
                            currentMarker.setMap(null);
                        }
                        var imageSrc = '/images/icon/MARKER.png', // 마커이미지의 주소입니다
                            imageSize = new kakao.maps.Size(44, 56), // 마커이미지의 크기입니다
                            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        currentMarker = new kakao.maps.Marker({
                            map: map,
                            position: coords,
                            isClicked: false,
                            image: markerImage

                        });

                         // 지도 컨테이너의 크기
                         const mapWidth = mapContainer.offsetWidth;
                         const mapHeight = mapContainer.offsetHeight;

                         // 현재 지도 범위
                         const bounds = map.getBounds();
                         const sw = bounds.getSouthWest(); // 남서쪽 좌표
                         const ne = bounds.getNorthEast(); // 북동쪽 좌표

                         // 지도 범위에서 1px이 차지하는 경도값
                         const lngPerPx = (ne.getLng() - sw.getLng()) / mapWidth;

                         // 200px에 해당하는 경도값
                         const offsetLng = -400 * lngPerPx;

                         // 이동할 새 X 좌표 계산 (오른쪽으로 200px 이동)
                         const moveX = coords.getLng() + offsetLng;

                         // Y 좌표는 그대로 중앙
                         const moveY = coords.getLat();

                         // 새 중심 좌표 생성
                         const newCenter = new kakao.maps.LatLng(moveY, moveX);

                         // 지도 이동
                         map.panTo(newCenter);

                    }

                    let isClicked = false;

                    // 마커에 마우스 오버 이벤트 추가
                    kakao.maps.event.removeListener(currentMarker, 'mouseover');
                    kakao.maps.event.addListener(currentMarker, 'mouseover', function() {
                        if (!currentMarker.isClicked) {
                                showChart(); // 마우스를 올리면 차트를 표시
                            }
                    });

                    // 마커에 마우스 아웃 이벤트 추가

                    kakao.maps.event.addListener(currentMarker, 'mouseout',  function() {
                       if (!currentMarker.isClicked) {
                               hideChart(); // 마우스를 내리면 차트를 숨김
                           }
                    });

                    kakao.maps.event.addListener(currentMarker, 'click', function() {
                          const chartContainer1 = document.getElementById('chartContainer');
                          // 차트가 이미 보이고 있으면 다시 숨기지 않도록 처리
                          if(!currentMarker.isClicked){
                          chartContainer1.style.display = 'flex';  // 차트 컨테이너 고정 표시
                          currentMarker.isClicked = true;} else {
                          chartContainer1.style.display = 'none';  // 차트 컨테이너 고정 표시
                          currentMarker.isClicked = false;
                          }
                           // 클릭 상태로 설정


                    });
                });





                // 슬라이드 데이터 준비
                const slides = document.getElementById("infoCard");
                const prevButton = document.getElementById("prevSlide");
                const nextButton = document.getElementById("nextSlide");
                const closeButton = document.getElementById("closeInfoCard");

                let currentIndex = 0; // 현재 슬라이드 인덱스

                // 슬라이드 데이터 렌더링 함수
                function renderSlide(index) {
                    const slideData = filteredData[index];

                    document.getElementById("infoCardName").textContent = slideData.HOME_NAME || "N/A";
                    document.getElementById("infoCardKind").textContent = slideData.HOME_KIND || "N/A";
                    document.getElementById("infoCardNo").textContent = slideData.HOME_NO || "N/A";
                    document.getElementById("infoCardCompany").textContent = slideData.HOME_CO || "N/A";
                    document.getElementById("infoCardCount").textContent = slideData.HOME_COUNT || "N/A";
                    document.getElementById("infoCardParking").textContent = slideData.HOME_PARKING || "N/A";
                    document.getElementById("infoCardAddress").textContent = slideData.HOME_ADDRESS || "정보 없음";
                    document.getElementById("infoCardDeposit").textContent = slideData.HOME_DEP || "정보 없음";
                    document.getElementById("infoCardRent").textContent = slideData.HOME_MOTH_PAI || "정보 없음";
                    document.getElementById("infoCardMy").textContent = slideData.HOME_MYAREA || "정보 없음";
                    document.getElementById("infoCardWe").textContent = slideData.HOME_WEAREA || "정보 없음";
                    document.getElementById("infoCardBus").textContent = slideData.BUS_DIST ? `\${slideData.BUS_DIST}m` : "정보 없음";
                    document.getElementById("infoCardSubway").textContent = slideData.SUB_DIST ? `\${slideData.SUB_DIST}m` : "정보 없음";
                    document.getElementById("infoCardLow").textContent = slideData.LOW_DIST ? `\${slideData.LOW_DIST}m` : "정보 없음";
                    document.getElementById("infoCardMid").textContent = slideData.MID_DIST ? `\${slideData.MID_DIST}m` : "정보 없음";
                    document.getElementById("infoCardHigh").textContent = slideData.HI_DIST ? `\${slideData.HI_DIST}m` : "정보 없음";
                    document.getElementById("infoCardHos").textContent = slideData.HOS_DIST ? `\${slideData.HOS_DIST}m` : "정보 없음";
                    document.getElementById("infoCardPark").textContent = slideData.PARK_DIST ? `\${slideData.PARK_DIST}m` : "정보 없음";
                   document.getElementById("infoCardParking1").textContent = slideData.PARKING_DIST ? `\${slideData.PARKING_DIST}m` : "정보 없음";


                }


                // 이전 버튼 클릭 이벤트
                prevButton.addEventListener("click", () => {
                    currentIndex = (currentIndex - 1 + filteredData.length) % filteredData.length;
                    renderSlide(currentIndex);
                });

                // 다음 버튼 클릭 이벤트
                nextButton.addEventListener("click", () => {
                    currentIndex = (currentIndex + 1) % filteredData.length;
                    renderSlide(currentIndex);
                });

                // 첫 슬라이드 렌더링
                renderSlide(currentIndex);

                // 슬라이드 표시
                slides.classList.add("visible");
            });

            slideContainer.appendChild(clone);
        });

        // 닫기 버튼 이벤트 처리
        document.getElementById("closeInfoCard").addEventListener("click", () => {
            document.getElementById("infoCard").classList.remove("visible");
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



        // 이벤트 등록 및 초기화
        document.addEventListener("DOMContentLoaded", () => {
            init();
            slideContainer.addEventListener("scroll", handleScroll);
        });

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
        });

        document.addEventListener('DOMContentLoaded', () => {
            // 생활 인프라 버튼 클릭 이벤트 연결
            const infrastructureButton = document.getElementById('infrastructureButton');
            infrastructureButton.addEventListener('click', () => {
                toggleBox('box3'); // 박스3을 토글
            });
        });

        // 박스 토글 함수
        function toggleBox(boxId) {
            const box = document.getElementById(boxId);
            const isVisible = box.classList.contains('active');

            // 모든 박스를 숨김
            document.querySelectorAll('.box').forEach(b => b.classList.remove('active'));

            // 클릭된 박스만 보이도록 설정
            if (!isVisible) {
                box.classList.add('active');
            }
        }

        // "나에게 맞는 집 찾기!" 버튼 클릭 시 box3 닫기
        document.getElementById('submitButton').addEventListener('click', function () {
            document.getElementById('box3').classList.remove('active'); // box3 닫기
        });

        // 지역선택, 주택유형 버튼 인터랙션
        document.querySelectorAll('.scroll-button').forEach(button => {
            button.addEventListener('click', () => {
                // 클릭된 버튼이 이미 선택되어 있는지 확인
                if (button.classList.contains('selected')) {
                    // 이미 선택된 버튼이면 선택 해제
                    button.classList.remove('selected');
                } else {
                    // 선택되지 않은 버튼이면 선택 상태로 변경
                    button.classList.add('selected');
                }
            });
        });

        document.getElementById('submitButton').addEventListener('click', function () {
            // 슬라이더 값을 동적으로 가져오는 함수
            function getSliderValues() {
                const sliders = [
                    { id: "subwaySlider", name: "subway" },
                    { id: "busSlider", name: "bus" },
                    { id: "elementarySlider", name: "element" },
                    { id: "middleSlider", name: "middle" },
                    { id: "highSlider", name: "high" },
                    { id: "hospitalSlider", name: "hospitalcount" },
                    { id: "parkingSlider", name: "parking" },
                    { id: "parkSlider", name: "park" }
                ];

                // 슬라이더 값 가져오기 및 필터링 (0.00 값 제거)
                const values = sliders
                    .map(slider => ({
                        column: slider.name,
                        value: parseFloat(document.getElementById(slider.id).value)
                    }))
                    .filter(slider => slider.value !== 0.00); // 값이 0.00인 항목 제거

                return values;
            }

            function getParamsFromUrl() {
                const params = new URLSearchParams(window.location.search); // URL의 쿼리 파라미터 파싱
                const address = params.get('address') || 'No'; // address 값이 없으면 빈 문자열
                const homeKind = params.get('homeKind') || 'No'; // homeKind 값이 없으면 빈 문자열
                return { address, homeKind };
            }

            const sliderData = getSliderValues();
            const { address, homeKind } = getParamsFromUrl();
            const columns = sliderData.map(s => s.column).join(',');
            const values = sliderData.map(s => s.value).join(',');
            const timestamp = Date.now(); // 캐싱 방지


            // Ajax 요청으로 데이터 전송
            fetch(`/home/five?address=\${encodeURIComponent(address)}&homeKind=\${encodeURIComponent(homeKind)}&columns=\${encodeURIComponent(columns)}&values=\${encodeURIComponent(values)}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json(); // 서버에서 JSON 결과를 받음
            })
            .then(jdata => {
                // 받은 데이터를 서버에 다시 전송
                fetch('/home/recom', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(jdata), // jdata를 JSON 형식으로 변환하여 전송
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json(); // JSON 형식으로 응답 처리
                })
                .then(processedData => {
                    updateList(processedData.filteredList); // 새로운 데이터로 리스트 업데이트

                })
                .catch(error => {
                    console.error("서버 데이터 처리 중 오류 발생:", error);
                });



            })
            .catch(error => {
                console.error("데이터 처리 중 오류 발생:", error);
            });


             });

         function stopInfiniteScroll() {
             const slideContainer = document.getElementById("slideContentContainer");
             slideContainer.removeEventListener("scroll", handleScroll); // 스크롤 이벤트 제거
         }

        function updateList(filteredList) {
            const slideContainer = document.getElementById("slideContentContainer"); // 리스트 컨테이너
            const template = document.getElementById("slide-item-template"); // 리스트 템플릿

            // 기존 리스트 초기화
            slideContainer.innerHTML = "";

            // 새로운 데이터를 기반으로 리스트 생성
            filteredList.forEach((item) => {
                const clone = template.content.cloneNode(true);
                clone.querySelector(".list-title").textContent = item.HOME_NAME || "제목 없음";
                clone.querySelector(".list-type").textContent = item.HOME_KIND || "정보 없음";
                clone.querySelector(".deposit").textContent = item.HOME_DEP || "정보 없음";
                clone.querySelector(".monthly-rent").textContent = item.HOME_MOTH_PAI || "정보 없음";
                clone.querySelector(".company").textContent = item.HOME_CO || "정보 없음";

                // 클릭 이벤트 추가 (선택된 데이터를 처리하거나 다른 작업 수행 가능)
                const listItem = clone.querySelector(".list-item");
                listItem.addEventListener("click", () => {
                    // 추가 작업 수행
                    // 슬라이더 값을 동적으로 가져오는 함수
                    function getSliderValues() {
                        const sliders = [
                            { id: "subwaySlider", name: "subway" },
                            { id: "busSlider", name: "bus" },
                            { id: "elementarySlider", name: "element" },
                            { id: "middleSlider", name: "middle" },
                            { id: "highSlider", name: "high" },
                            { id: "hospitalSlider", name: "hospitalcount" },
                            { id: "parkingSlider", name: "parking" },
                            { id: "parkSlider", name: "park" }
                        ];

                        // 슬라이더 값 가져오기 및 필터링 (0.00 값 제거)
                        const values = sliders
                            .map(slider => ({
                                column: slider.name,
                                value: parseFloat(document.getElementById(slider.id).value)
                            }))
                            .filter(slider => slider.value !== 0.00); // 값이 0.00인 항목 제거

                        return values;
                    }

                    const sliderData = getSliderValues();
                    // 선택한 리스트의 주소를 이용해서 차트 그리기
                    const address = item.HOME_ADDRESS.trim();
                    const homeKind = item.HOME_KIND.trim();
                    // 컬럼 이름과 값 배열로 변환
                    const columns = sliderData.map(s => s.column).join(',');
                    const values = sliderData.map(s => s.value).join(',');

                    // Ajax 요청으로 데이터 전송
                    fetch(`/home/chart?address=\${encodeURIComponent(address)}&homeKind=\${encodeURIComponent(homeKind)}&columns=\${encodeURIComponent(columns)}&values=\${encodeURIComponent(values)}`)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(`HTTP error! status: ${response.status}`);
                            }
                            return response.json(); // 서버에서 JSON 결과를 받음
                        })
                        .then(jdata => {
                            // 받은 데이터를 화면에 렌더링
                            const jsonData = jdata;
                            const parsedData = jsonData;

                            // 📌 1. 키 배열 가져오기 (첫 번째와 두 번째 키 제외)
                            const keys = Object.keys(parsedData[0]);
                            const relevantKeys = keys.slice(3); // 첫 번째(0)와 두 번째(1) 키 제외

                            // 📌 2. 8개 인프라 요소의 기본값을 0으로 초기화
                            const defaultValues = {
                                subway: 0,
                                bus: 0,
                                element: 0,
                                middle: 0,
                                high: 0,
                                hospitalcount: 0,
                                parking: 0,
                                park: 0,
                            };

                            // 📌 3. 서버에서 받은 데이터로 값 업데이트
                            relevantKeys.forEach(key => {
                                if (defaultValues.hasOwnProperty(key)) {
                                    defaultValues[key] = parsedData[0][key] * 100; // 서버 값 적용
                                }
                            });

                            // 📌 4. 점수 계산 및 UI 업데이트
                            const score = Math.floor(parsedData[0].similar * 100);
                            document.querySelector(".score-number").textContent = score;

                            // 3. 키 매핑 테이블 정의 (영어 -> 한국어)
                            const keyMapping = {
                                subway: "지하철",
                                bus: "버스",
                                element: "초등학교",
                                middle: "중학교",
                                high: "고등학교",
                                hospitalcount: "병원",
                                parking: "주차장",
                                park: "공원"
                            };

                            // 🎨 4. 키별 색상 매핑
                            const colorMapping = {
                                subway: 'rgba(255, 111, 60, 1)',
                                bus: 'rgba(134, 205, 255, 1)',
                                element: 'rgba(126, 212, 33, 1)',
                                middle: 'rgba(155, 136, 255, 1)',
                                high: 'rgba(175, 136, 101, 1)',
                                hospitalcount: 'rgba(255, 107, 107, 1)',
                                parking: 'rgba(101, 247, 245, 1)',
                                park: 'rgba(111, 140, 93, 1)'
                            };

                            // 라벨별 이미지 매핑
                            const labelImagesMapping = {
                                subway: "/images/icon/subway.png",
                                bus: "/images/icon/bus.png",
                                element: "/images/icon/element.png",
                                middle: "/images/icon/middle.png",
                                high: "/images/icon/high.png",
                                hospitalcount: "/images/icon/hospitalcount.png",
                                parking: "/images/icon/parking.png",
                                park: "/images/icon/park.png"
                            };

                            // 🎯 5. 라벨, 데이터, 색상, 이미지 추출
                            const labels = Object.keys(defaultValues).map(key => keyMapping[key] || key);
                            const data = Object.values(defaultValues);
                            const backgroundColors = Object.keys(defaultValues).map(key => colorMapping[key]);
                            const labelImages = Object.keys(defaultValues).map(key => labelImagesMapping[key]);

                            // 6. Chart.js로 차트 생성
                            try {
                                const ctx = document.getElementById('myChart').getContext('2d');

                                // 기존 차트 제거하기 전에 Chart 객체인지 확인
                                if (window.myChart instanceof Chart) {
                                    window.myChart.destroy();
                                }

                                // 새 차트 생성
                                window.myChart = new Chart(ctx, {
                                    type: 'bar',
                                    data: {
                                        labels: labels, // X축 라벨
                                        datasets: [{
                                            label: "생활 인프라 매칭 점수",
                                            data: data, // Y축 데이터
                                            backgroundColor: backgroundColors,
                                            borderWidth: 1,
                                            maxBarThickness: 15, // 막대 최대 두께
                                            borderSkipped: false,
                                            borderRadius: [
                                                { topLeft: 10, topRight: 10 },
                                            ]
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        scales: {
                                            x: {
                                                beginAtZero: true,
                                                grid: { display: false },
                                                ticks: {
                                                    color: 'white', // 라벨 글자 색상
                                                    font: { family: 'Spoqa Han Sans Neo', size: 14 } // 글자 크기
                                                }
                                            },
                                            y: {
                                                beginAtZero: true,
                                                grid: { display: false },
                                            }
                                        },
                                        plugins: {
                                            title: {
                                                display: true,
                                                text: '생활 인프라 매칭 점수',
                                                font: { family: 'Spoqa Han Sans Neo', size: 16 },
                                                padding: { left: 15, top: 10, bottom: 20 },
                                                align: 'start',
                                                color: '#333'
                                            },
                                            legend: {
                                                display: false,
                                            },
                                            tooltip: {
                                                enabled: true
                                            }
                                        }
                                    },
                                    plugins: [
                                        {
                                            id: 'custom-label-images',
                                            afterDraw(chart) {
                                                const ctx = chart.ctx;
                                                const xAxis = chart.scales.x;
                                                const yAxis = chart.scales.y;

                                                xAxis.ticks.forEach((tick, index) => {
                                                    const x = xAxis.getPixelForTick(index);
                                                    const imageY = yAxis.bottom + 10;
                                                    const textY = imageY + 45;

                                                    // 이미지를 라벨에 맞게 가져오기
                                                    const image = new Image();
                                                    image.src = labelImages[index];

                                                    // 이미지를 그리기
                                                    image.onload = () => {
                                                        ctx.drawImage(image, x - 17, imageY, 30, 30); // 이미지 위치와 크기 조정
                                                    };

                                                    // 텍스트를 이미지 아래에 추가
                                                    ctx.font = '10px Arial';
                                                    ctx.textAlign = 'center';
                                                    ctx.fillStyle = 'black';
                                                    ctx.fillText(labels[index], x, textY);
                                                });
                                            }
                                        }
                                    ]
                                });
                            } catch (error) {
                                console.error("Chart.js 렌더링 중 오류 발생:", error);
                            }

                        })
                        .catch(error => {
                            console.error("데이터 처리 중 오류 발생:", error);
                        });


                        // HOME_ADDRESS 필드를 사용하여 데이터 필터링
                         const filteredData = DataText.filter(
                             (home) => home.HOME_ADDRESS.trim().toLowerCase() === item.HOME_ADDRESS.trim().toLowerCase()
                         );
                         // 주소-좌표 변환 객체를 생성합니다
                         const geocoder = new kakao.maps.services.Geocoder();

                         // 주소로 좌표를 검색합니다
                         geocoder.addressSearch(item.HOME_ADDRESS, function(result, status) {

                             // 정상적으로 검색이 완료됐으면
                              if (status === kakao.maps.services.Status.OK) {

                                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                 // 기존 마커 제거
                                 if (currentMarker) {
                                     currentMarker.setMap(null);
                                 }
                                 var imageSrc = '/images/icon/MARKER.png', // 마커이미지의 주소입니다
                                     imageSize = new kakao.maps.Size(44, 56), // 마커이미지의 크기입니다
                                     imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                                 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);


                                 // 결과값으로 받은 위치를 마커로 표시합니다
                                 currentMarker = new kakao.maps.Marker({
                                     map: map,
                                     position: coords,
                                     isClicked: false,
                                     image: markerImage

                                 });

                                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                 //map.setCenter(coords);
                                 // 지도 중심 이동: 화면 오른쪽 절반으로 이동
                                 // 지도 중심 이동: 선택된 좌표가 화면의 200px 왼쪽에 오도록 이동
                                 const mapWidth = mapContainer.offsetWidth;
                                 const mapHeight = mapContainer.offsetHeight;

                                 // 현재 지도 범위
                                  const bounds = map.getBounds();
                                  const sw = bounds.getSouthWest(); // 남서쪽 좌표
                                  const ne = bounds.getNorthEast(); // 북동쪽 좌표

                                  // 지도 범위에서 1px이 차지하는 경도값
                                  const lngPerPx = (ne.getLng() - sw.getLng()) / mapWidth;

                                  // 200px에 해당하는 경도값
                                  const offsetLng = -400 * lngPerPx;

                                  // 이동할 새 X 좌표 계산 (오른쪽으로 200px 이동)
                                  const moveX = coords.getLng() + offsetLng;

                                  // Y 좌표는 그대로 중앙
                                  const moveY = coords.getLat();

                                  // 새 중심 좌표 생성
                                  const newCenter = new kakao.maps.LatLng(moveY, moveX);

                                  // 지도 이동
                                  map.panTo(newCenter);


                             }

                             let isClicked = false;

                             // 마커에 마우스 오버 이벤트 추가
                             kakao.maps.event.removeListener(currentMarker, 'mouseover');
                             kakao.maps.event.addListener(currentMarker, 'mouseover', function() {
                                 if (!currentMarker.isClicked) {
                                         showChart(); // 마우스를 올리면 차트를 표시
                                     }
                             });

                             // 마커에 마우스 아웃 이벤트 추가

                             kakao.maps.event.addListener(currentMarker, 'mouseout',  function() {
                                if (!currentMarker.isClicked) {
                                        hideChart(); // 마우스를 내리면 차트를 숨김
                                    }
                             });

                             kakao.maps.event.addListener(currentMarker, 'click', function() {
                                   const chartContainer1 = document.getElementById('chartContainer');
                                   // 차트가 이미 보이고 있으면 다시 숨기지 않도록 처리
                                   if(!currentMarker.isClicked){
                                   chartContainer1.style.display = 'flex';  // 차트 컨테이너 고정 표시
                                   currentMarker.isClicked = true;} else {
                                   chartContainer1.style.display = 'none';  // 차트 컨테이너 고정 표시
                                   currentMarker.isClicked = false;
                                   }
                                    // 클릭 상태로 설정


                             });
                         });





                         // 슬라이드 데이터 준비
                         const slides = document.getElementById("infoCard");
                         const prevButton = document.getElementById("prevSlide");
                         const nextButton = document.getElementById("nextSlide");
                         const closeButton = document.getElementById("closeInfoCard");

                         let currentIndex = 0; // 현재 슬라이드 인덱스

                         // 슬라이드 데이터 렌더링 함수
                         function renderSlide(index) {
                             const slideData = filteredData[index];

                             document.getElementById("infoCardName").textContent = slideData.HOME_NAME || "N/A";
                             document.getElementById("infoCardKind").textContent = slideData.HOME_KIND || "N/A";
                             document.getElementById("infoCardNo").textContent = slideData.HOME_NO || "N/A";
                             document.getElementById("infoCardCompany").textContent = slideData.HOME_CO || "N/A";
                             document.getElementById("infoCardCount").textContent = slideData.HOME_COUNT || "N/A";
                             document.getElementById("infoCardParking").textContent = slideData.HOME_PARKING || "N/A";
                             document.getElementById("infoCardAddress").textContent = slideData.HOME_ADDRESS || "정보 없음";
                             document.getElementById("infoCardDeposit").textContent = slideData.HOME_DEP || "정보 없음";
                             document.getElementById("infoCardRent").textContent = slideData.HOME_MOTH_PAI || "정보 없음";
                             document.getElementById("infoCardMy").textContent = slideData.HOME_MYAREA || "정보 없음";
                             document.getElementById("infoCardWe").textContent = slideData.HOME_WEAREA || "정보 없음";
                             document.getElementById("infoCardBus").textContent = slideData.BUS_DIST ? `\${slideData.BUS_DIST}m` : "정보 없음";
                             document.getElementById("infoCardSubway").textContent = slideData.SUB_DIST ? `\${slideData.SUB_DIST}m` : "정보 없음";
                             document.getElementById("infoCardLow").textContent = slideData.LOW_DIST ? `\${slideData.LOW_DIST}m` : "정보 없음";
                             document.getElementById("infoCardMid").textContent = slideData.MID_DIST ? `\${slideData.MID_DIST}m` : "정보 없음";
                             document.getElementById("infoCardHigh").textContent = slideData.HI_DIST ? `\${slideData.HI_DIST}m` : "정보 없음";
                             document.getElementById("infoCardHos").textContent = slideData.HOS_DIST ? `\${slideData.HOS_DIST}m` : "정보 없음";
                             document.getElementById("infoCardPark").textContent = slideData.PARK_DIST ? `\${slideData.PARK_DIST}m` : "정보 없음";
                            document.getElementById("infoCardParking1").textContent = slideData.PARKING_DIST ? `\${slideData.PARKING_DIST}m` : "정보 없음";


                         }

                         // 이전 버튼 클릭 이벤트
                         prevButton.addEventListener("click", () => {
                             currentIndex = (currentIndex - 1 + filteredData.length) % filteredData.length;
                             renderSlide(currentIndex);
                         });

                         // 다음 버튼 클릭 이벤트
                         nextButton.addEventListener("click", () => {
                             currentIndex = (currentIndex + 1) % filteredData.length;
                             renderSlide(currentIndex);
                         });

                         // 첫 슬라이드 렌더링
                         renderSlide(currentIndex);

                         // 슬라이드 표시
                         slides.classList.add("visible");
                     });

                slideContainer.appendChild(clone); // 리스트에 추가
            });

            // 무한 스크롤 중지
            stopInfiniteScroll();

        }





    </script>





</body>
</html>