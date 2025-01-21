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
        left: 10px;
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

    .searchButton{
        position: absolute;
        left: 380px;
        top:15px;
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


    .map {
        position: absolute; /* 절대 위치 */
        top: 66px; /* 위에서 10px 아래 */
        width:100%;
        height:100%;
        z-index: 1;
    }

    .chart-container-with-score {
        display: flex; /* Flexbox로 수평 배치 */
        position: absolute; /* 절대 위치 */
        top: 150px; /* 차트를 맵 위에 적절히 배치 */
        left: 850px; /* 원하는 위치 지정 */
        width: 450px; /* 여기에 if문으로 차트 크기 조절 */
        height: 300px;
        background-color: #fff; /* 배경 색상 */
        border: 1px solid lightgray; /* 경계선 */
        border-radius: 12px; /* 모서리 둥글게 */
        padding: 20px; /* 내부 여백 */
        height: 300px;
        z-index: 10; /* 맵보다 높은 계층 */
    }


    .chart-container {
        flex: 3; /* 차트 컨테이너가 더 넓게 차지하도록 설정 */
        height: 300px; /* 차트 컨테이너 높이 */
        position: relative;
    }
    .chart-container canvas {
        width: 100% !important; /* 캔버스를 컨테이너 너비에 맞춤 */
        height: 300px !important;
    }
    .chart-title {
        font-size: 18px; /* 글자 크기 */
        font-weight: bold; /* 글자 두께 */
        color: #333; /* 글자 색상 */
        margin-bottom: 10px; /* 아래 여백 */
        text-align: left; /* 텍스트 정렬 */
        padding-left: 10px; /* 왼쪽 패딩 */
    }


    .score-container {
        flex: 1; /* 점수 컨테이너가 차트보다 좁게 설정 */
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
    }

    .score-content {
        text-align: center;
    }

    .score-image {
        width: 80px; /* 이미지 크기 */
        height: 80px;
        margin-bottom: 10px; /* 텍스트와 간격 */
    }

    .score-text {
        font-size: 40px;
        font-weight: bold;
        color: #333;
    }

    .score-number {
        font-size: 48px; /* 점수 숫자 크기 */
        font-weight: bold;
        color: black; /* 숫자 색상 */
    }



    .list-item {
        padding: 0; /* 내부 여백 제거 */
        border: none; /* 테두리 제거 */
        background-color: #f9f9f9; /* 배경 투명 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 박스 섀도우 제거 */
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

    /* 정보 카드 기본 스타일 */
    .info-card {
      position: fixed;
      bottom: 20px; /* 화면 아래쪽에서 띄움 */
      right: 20px; /* 화면 오른쪽에 고정 */
      width: 300px; /* 카드 너비 */
      background-color: #fff; /* 흰색 배경 */
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
      border-radius: 10px; /* 둥근 모서리 */
      padding: 20px; /* 내부 여백 */
      z-index: 1000; /* 다른 요소 위로 */
      display: none; /* 기본적으로 숨김 */
    }

    /* 카드 표시 시 */
    .info-card.visible {
      display: block; /* 카드가 보이도록 */
    }

    /* 닫기 버튼 스타일 */
    .close-info-card {
      position: absolute;
      top: 10px;
      right: 10px;
      background: none;
      border: none;
      font-size: 18px;
      color: #aaa;
      cursor: pointer;
    }

    .close-info-card:hover {
      color: #000;
    }

    /* 카드 내부 텍스트 스타일 */
    .info-card-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .info-card-label {
      font-weight: bold;
    }
    .slider-wrapper {
        position: relative;
        width: 100%;
        max-width: 800px;
        margin: auto;
        overflow: hidden;
    }

    .slider-container {
        display: flex;
        transition: transform 0.5s ease-in-out;
        width: 100%;
    }

    .slide {
        flex: 0 0 100%;
        box-sizing: border-box;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        margin: 0 10px;
        text-align: left;
    }

    .slider-button {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: #333;
        color: white;
        border: none;
        padding: 10px;
        cursor: pointer;
        z-index: 10;
    }

    #prevSlide {
        left: 10px;
    }

    #nextSlide {
        right: 10px;
    }




</style>
<body>

    <!-- 선위에 요소들 style에 .클래스 이름으로 스타일 정의해 놓음 -->
    <h3 class = "title">메타홈</h3>
    <button class = "white-button1">맞춤 지도</button>
    <button class = "white-button2">우리 동네 이사와 생활 서비스</button>
    <button class = "white-button3">로그인</button>
    <button class = "white-button4">멤버쉽  가입</button>

    <!-- 위쪽 선 -->
    <hr class="styled-line1">

    <!-- 템플릿 -->
     <template id="slide-item-template">
         <div class="list-item" data-address="{{address}}">
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
            <button id="slideToggleButton" class="slide-toggle-button">❮</button>
            <button class="dropdown-button1" onclick="toggleBox('box1')">
              지역 선택
              <span class="dropdown-icon"></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button2" onclick="toggleBox('box2')">
              주택 유형
              <span class="dropdown-icon" ></span> <!-- 화살표 -->
            </button>
            <button class="dropdown-button3" onclick="toggleBox('box3')">
              생활 인프라 매칭하기
              <span class="dropdown-icon"></span> <!-- 화살표 -->
              <button class="searchButton">검색</button>
            </button>

            <hr class="styled-line2">

            <!-- 지역선택버튼들 -->
            <div class="box" id="box1" >
                <div class = "scrollable-box">

                    <button class="icon-button" id="refreshButton1" onclick="resetSelection1()">
                                  <span class="icon icon-refresh">&#x21BB;</span> <!-- 새로 고침 아이콘 -->
                    </button>

                    <button class="scroll-button" onclick="selectButton(this)">강남구</button>
                    <button class="scroll-button" onclick="selectButton(this)">강동구</button>
                    <button class="scroll-button" onclick="selectButton(this)">강북구</button>
                    <button class="scroll-button" onclick="selectButton(this)">강서구</button>
                    <button class="scroll-button" onclick="selectButton(this)">관악구</button>
                    <button class="scroll-button" onclick="selectButton(this)">광진구</button>
                    <button class="scroll-button" onclick="selectButton(this)">구로구</button>
                    <button class="scroll-button" onclick="selectButton(this)">금천구</button>
                    <button class="scroll-button" onclick="selectButton(this)">노원구</button>
                    <button class="scroll-button" onclick="selectButton(this)">도봉구</button>
                    <button class="scroll-button" onclick="selectButton(this)">동대문구</button>
                    <button class="scroll-button" onclick="selectButton(this)">동작구</button>
                    <button class="scroll-button" onclick="selectButton(this)">마포구</button>
                    <button class="scroll-button" onclick="selectButton(this)">서대문구</button>
                    <button class="scroll-button" onclick="selectButton(this)">서초구</button>
                    <button class="scroll-button" onclick="selectButton(this)">성동구</button>
                    <button class="scroll-button" onclick="selectButton(this)">성북구</button>
                    <button class="scroll-button" onclick="selectButton(this)">송파구</button>
                    <button class="scroll-button" onclick="selectButton(this)">양천구</button>
                    <button class="scroll-button" onclick="selectButton(this)">영등포구</button>
                    <button class="scroll-button" onclick="selectButton(this)">용산구</button>
                    <button class="scroll-button" onclick="selectButton(this)">은평구</button>
                    <button class="scroll-button" onclick="selectButton(this)">종로구</button>
                    <button class="scroll-button" onclick="selectButton(this)">중구</button>
                    <button class="scroll-button" onclick="selectButton(this)">중랑구</button>

                </div>
            </div>

            <!-- 주택유형버튼들 -->
            <div class="box" id="box2"><div class = "scrollable-box">
                <button class="scroll-button" onclick="selectButton(this)">아파트</button>
                <button class="scroll-button" onclick="selectButton(this)">연립/다세대</button>
                <button class="scroll-button" onclick="selectButton(this)">단독/다가구</button>
                <button class="scroll-button" onclick="selectButton(this)">오피스텔</button>
            </div></div>

            <!-- 생활인프라슬라이더 -->
            <div class="box" id="box3">
                <button class="icon-button" id="refreshButton2" onclick="resetSelection2()">
                    <span class="icon icon-refresh">&#x21BB;</span> <!-- 새로 고침 아이콘 -->
                </button>
                <div>
                <input type="range" id="slider1" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider2" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider3" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider4" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider5" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider6" min="0" max="100" value="50" class="slider">
                </div>
                <div>
                <input type="range" id="slider7" min="0" max="100" value="50" class="slider">
                </div>
                <button id="submitButton">제출</button>
            </div>



            <div id="slideContentContainer" class="slide-content-container"></div>
            <div id="detailContainer"></div>


            <!-- 버튼이 아니라 백에서 코드로 실행 좌표도 그때 넣어줘야함 -->
            <!-- <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> -->
        </div>
    </div>

    <div id="infoCard" class="info-card hidden">
          <button id="closeInfoCard" class="close-info-card">×</button>
          <h4 class="info-card-title"><span id="infoCardName"></span></h4>
          <hr>
          <p><span class="info-card-label">공급번호 |</span> <span id="infoCardNo"></span>
          <span class="info-card-label">임대사업자 |</span> <span id="infoCardCompany"></span></p>
          <p><span class="info-card-label">세대수  |</span> <span id="infoCardCount"></span>
          <span class="info-card-label">주차대수 |</span> <span id="infoCardParking"></span></p>
          <p><span class="info-card-label">주소   |</span> <span id="infoCardAddress"></span></p>
          <hr>
          <p><span class="info-card-label">임대 보증금 :</span> <span id="infoCardDeposit"></span></p>
          <p><span class="info-card-label">월 임대료 :</span> <span id="infoCardRent"></span></p>
          <hr>
          <p><span class="info-card-label">공급면적</span>
          <span class="info-card-label">전용 : </span> <span id="infoCardMy"></span>
          <span class="info-card-label">공용 : </span><span id="infoCardWe"></span></p>
          <hr>
          <p><span class="info-card-label">우리집에서 얼마?</span>
          </p>
          <hr>
          <p><span class="info-card-label">이미지</span>
          </p>
    </div>

        <!-- 차트 추가 -->
        <div class="chart-container-with-score">
            <!-- 그래프 컨테이너 -->
            <div class="chart-container">
                <canvas id="myChart"></canvas>
            </div>
            <!-- 오른쪽 이미지와 점수 -->
            <div class="score-container">
                <div class="score-content">
                    <img src="path-to-your-image.png" alt="점수 아이콘" class="score-image">
                    <div class="score-text">
                        <span class="score-number">96</span><span>점</span>
                    </div>
                </div>
            </div>
        </div>

        <!--<script src="/js/kakao.js"></script>-->
        <script>
            // JSP에서 JSON 데이터를 안전하게 가져오기
            const jsonData = ${jsonData}; // JSP에서 전달된 JSON 데이터 (문자열로 전달)
            console.log("JSON Data:", jsonData);
            const parsedData = jsonData;

            // 1. 키 배열 가져오기
            const keys = Object.keys(parsedData[0]);
            console.log("All Keys:", keys); // 모든 키 확인

            // similar 값을 가져와 100을 곱한 점수를 계산
            const score = Math.floor(parsedData[0].similar * 100); // 첫 번째 데이터의 similar 값 사용
            console.log("Score:", score); // 콘솔로 점수 확인

            // 점수를 HTML에 표시
            document.querySelector(".score-number").textContent = score;

            // 2. 첫 번째와 두 번째 키를 제외
            const relevantKeys = keys.slice(2); // 첫 번째(0)와 두 번째(1) 키 제외
            console.log("Relevant Keys:", relevantKeys); // 예: ["park", "bus", "subway", ...]

            // 3. 키 매핑 테이블 정의 (영어 -> 한국어)
            const keyMapping = {
                park: "공원",
                bus: "버스",
                subway: "지하철",
                hospitalcount: "병원",
                element: "초등학교",
                middle: "중학교",
                high: "고등학교",
                parking: "주차장"
            };

            // 라벨별 이미지를 정의
            const labelImages = [
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png",
                "/images/Elephant.png"
            ];

            // 4. 라벨과 데이터 추출
            const labels = relevantKeys.map((key) => keyMapping[key] || key); // 매핑된 한국어 키 사용
            const data = relevantKeys.map((key) => parsedData[0][key] * 100); // 퍼센트 변환
            console.log("Labels (한국어):", labels); // ["공원", "버스", ...]
            console.log("Data:", data); // [숫자 배열]

            // 5. backgroundColor 동적 생성
            const backgroundColors = relevantKeys.map((_, index) => {
                const colors = [
                    'rgba(111, 140, 93, 1)',
                    'rgba(255, 107, 107, 1)',
                    'rgba(255, 111, 60, 1)',
                    'rgba(134, 205, 255, 1)',
                    'rgba(255, 255, 86, 1)',
                    'rgba(155, 136, 255, 1)',
                    'rgba(175, 136, 101, 1)',
                    'rgba(255, 107, 107, 1)',
                ];
                return colors[index % colors.length]; // 순환하여 색상 선택
            });
            console.log("Background Colors:", backgroundColors);

            // 4. Chart.js로 차트 생성
            try {
                const ctx = document.getElementById('myChart').getContext('2d');
                new Chart(ctx, {
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
                                ticks: {
                                    font: {
                                        size: 14 // 라벨 글자 크기 조절
                                    }
                                }
                            },
                            y: {
                                beginAtZero: true,
                            }
                        },
                        plugins: {
                        title: {
                                display: true, // 제목 표시
                                text: '생활 인프라 매칭 점수', // 제목 텍스트
                                font: {
                                    size: 18, // 제목 글자 크기
                                    weight: 'bold'
                                },
                                padding: {
                                    top: 10,
                                    bottom: 20
                                },
                                align: 'start', // 제목 정렬 (start, center, end 중 선택)
                                color: '#333' // 제목 색상
                            },
                            legend: {
                                 display: false, // 범례 숨기기
                                position: 'top',
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
                                    const x = xAxis.getPixelForTick(index); // x축 위치 계산
                                    const imageY = yAxis.bottom + 10; // 이미지를 축 아래로 약간 이동
                                    const textY = imageY + 40; // 텍스트는 이미지 아래로 배치
                                    const image = new Image();
                                    image.src = labelImages[index]; // 아이콘 이미지 경로

                                    // 이미지를 그리기
                                    image.onload = () => {
                                        ctx.drawImage(image, x - 17, imageY, 30, 30); // 이미지 크기 및 위치 조정
                                    };
                                    image.onerror = () => {
                                        console.error(`이미지를 불러오는 데 실패했습니다. 인덱스: ${index}, 경로: ${image.src}`);
                                    };

                                    // 텍스트를 이미지 아래에 그리기
                                    ctx.font = '10px Arial'; // 글꼴 크기 및 스타일
                                    ctx.textAlign = 'center';
                                    ctx.fillStyle = 'black'; // 텍스트 색상
                                    ctx.fillText(labels[index], x, textY); // 텍스트를 이미지 아래로 배치
                                });
                            }
                        }
                    ]

                });
            } catch (error) {
                console.error("Chart.js 렌더링 중 오류 발생:", error);
            }

        </script>


    <script>
        // 서버에서 전달된 JSON 데이터
        const slideData = JSON.parse('${filteredListJson}');
        const DataText = JSON.parse('${homeListJson}');
        //console.log("Slide Data: ", slideData);
        //console.log("All Data: ", DataText);

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

            // 데이터 리스트 렌더링
            data.forEach((item) => {
              const clone = template.content.cloneNode(true);
              clone.querySelector(".list-title").textContent = item.HOME_NAME || "제목 없음";
              clone.querySelector(".list-type").textContent = item.HOME_KIND || "정보 없음";
              clone.querySelector(".deposit").textContent = item.HOME_DEP || "정보 없음";
              clone.querySelector(".monthly-rent").textContent = item.HOME_MOTH_PAI || "정보 없음";
              clone.querySelector(".company").textContent = item.HOME_CO || "정보 없음";

              const listItem = clone.querySelector(".list-item");

              // 리스트 클릭 시 이벤트 처리
              listItem.addEventListener("click", () => {
                // 카드에 데이터 삽입
                document.getElementById("infoCardName").textContent = item.HOME_NAME || "정보 없음";
                //document.getElementById("infoCardKind").textContent = item.HOME_KIND || "정보 없음";
                document.getElementById("infoCardNo").textContent = item.HOME_NO || "정보 없음";
                document.getElementById("infoCardCompany").textContent = item.HOME_CO || "정보 없음";
                document.getElementById("infoCardCount").textContent = item.HOME_COUNT || "정보 없음";
                document.getElementById("infoCardParking").textContent = item.HOME_PARKING || "정보 없음";
                document.getElementById("infoCardAddress").textContent = item.HOME_ADDRESS || "정보 없음";
                document.getElementById("infoCardDeposit").textContent = item.HOME_DEP || "정보 없음";
                document.getElementById("infoCardRent").textContent = item.HOME_MOTH_PAI || "정보 없음";
                document.getElementById("infoCardMy").textContent = item.HOME_MYAREA || "정보 없음";
                document.getElementById("infoCardWe").textContent = item.HOME_WEAREA || "정보 없음";

                // 카드 표시
                document.getElementById("infoCard").classList.add("visible");
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
    </script>

<!-- 카카오맵 -->
<div id="map" class = "map"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>


<!--<script src="/js/map.js"></script>
    <script src="/js/slide.js"></script>-->
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
        });

        function toggleBox(boxId) {
            const targetBox = document.getElementById(boxId);
            const activeBox = document.querySelector('.box.active'); // 현재 활성화된 박스를 찾기

            // 현재 활성화된 박스가 있을 경우 비활성화
            if (activeBox && activeBox !== targetBox) {
                activeBox.classList.remove('active');
            }

            // 클릭된 박스를 활성화 또는 비활성화
            if (targetBox) {
                targetBox.classList.toggle('active');
            }
        }

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
            // 슬라이더 값 가져오기
            const slider1Value = document.getElementById('slider1').value;
            const slider2Value = document.getElementById('slider2').value;
            const slider3Value = document.getElementById('slider3').value;
            const slider4Value = document.getElementById('slider4').value;
            const slider5Value = document.getElementById('slider5').value;
            const slider6Value = document.getElementById('slider6').value;
            const slider7Value = document.getElementById('slider7').value;

            // 값 확인 (콘솔에 출력)
            console.log("Slider 1 Value: " + slider1Value);
            console.log("Slider 2 Value: " + slider2Value);
            console.log("Slider 3 Value: " + slider3Value);
            console.log("Slider 4 Value: " + slider4Value);
            console.log("Slider 5 Value: " + slider5Value);
            console.log("Slider 6 Value: " + slider6Value);
            console.log("Slider 7 Value: " + slider7Value);
        });

        // 새로고침
        function resetSelection1() {
            // box1의 모든 버튼 선택 해제
            const buttons1 = document.querySelectorAll('#box1 .scroll-button');
            buttons1.forEach(button => button.classList.remove('selected'));
        }

        function resetSelection2() {
            // 슬라이더 값 초기화 (50)
            const sliders = document.querySelectorAll('.slider');
            sliders.forEach(slider => {
                slider.value = 50; // 각 슬라이더의 값을 50으로 설정
                slider.dispatchEvent(new Event('input')); // 슬라이더 값 변경 이벤트 발생시켜 UI에 반영
            });
        }

        document.getElementById("refreshButton1").addEventListener("click", resetSelection1);
        document.getElementById("refreshButton2").addEventListener("click", resetSelection2);

        // 매물 클릭 시 팝업 기능 구현
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

        // 기본 지도 그리기
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.4833939381, 127.01698271446), // 초기 위치
                level: 5 // 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder(); // 주소 -> 좌표 변환 객체 생성

        // 매물 클릭 시 팝업 토글
        document.querySelectorAll(".list-item").forEach((room) => {
            room.addEventListener("click", (event) => {
                const roomData = event.currentTarget;
                const roomAddress = roomData.getAttribute("data-address"); // 클릭한 매물의 주소를 가져옵니다.
                console.log("주소:", roomAddress); // 주소 확인용

                // 해당 매물에 대한 상세 정보를 팝업으로 띄우기
                const content = `
                    <h3>${roomData.querySelector(".list-title").textContent}</h3>
                    <p>주소: ${roomAddress}</p>
                    <p>보증금: ${roomData.querySelector(".deposit").textContent}</p>
                    <p>월세: ${roomData.querySelector(".monthly-rent").textContent}</p>
                    <p>임대사업자: ${roomData.querySelector(".company").textContent}</p>
                `;
                showPopup(content); // 팝업을 표시

                // 주소를 좌표로 변환
                geocoder.addressSearch(roomAddress, function(result, status) {
                    console.log("status:", status); // status 값 확인
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        console.log("좌표:", coords); // 좌표 출력

                        // 마커 생성
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 지도 중심을 해당 위치로 이동
                        map.setCenter(coords);
                    } else {
                        console.error("주소 변환 실패:", roomAddress);
                    }
                });
            });
        });

    </script>





</body>
</html>