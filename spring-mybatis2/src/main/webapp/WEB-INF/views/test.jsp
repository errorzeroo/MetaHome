<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Metahome</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- 카카오맵 -->
    <div id="map" class = "map"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6791b39948cf3012eba2b2a1c1264f5&libraries=services,clusterer,drawing"></script>
    <link rel="stylesheet" href="https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css">
     <link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

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
        top: 11px; /* 위에서 10px 아래 */
        left: 66px;
        font-size: 30px;
        font-family: 'Spoqa Han Sans Neo', sans-serif;
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
        border: 1px solid lightgray; /* 아주 얇은 그림자 효과로 선을 만들기 */
           margin: 0;
           padding: 0;
           position: absolute;
           top: 60px;
           left: 0;
           width: 440px;
}

    .white-button1 {
        border: 2px solid white;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 910px;
        font-size: 16px;
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .white-button2 {
        border: 2px solid white;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1030px;
        font-size: 16px;
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        transition: background-color 0.3s ease, color 0.3s ease;
        display: flex;
    }
    .white-button3 {
        border: 2px solid #FF6F3C;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1345px;
        font-size: 14px;
        font-family: 'Spoqa Han Sans Neo', sans-serif;

        transition: background-color 0.3s ease, color 0.3s ease;
        display: flex;
        padding: 5px 13px; /* 버튼 내부 여백 추가 */
        border-radius: 4px; /* 모서리 둥글게 */
    }
    .white-button4 {
        display: flex;
        border: 2px solid #6AC1FF;
        background-color: transparent;
        cursor: pointer;
        position: absolute; /* 절대 위치 */
        top: 20px; /* 위에서 10px 아래 */
        left: 1420px;
        font-size: 14px;
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        transition: background-color 0.3s ease, color 0.3s ease;
        padding: 5px 13px; /* 버튼 내부 여백 추가 */
            border-radius: 4px; /* 모서리 둥글게 */
    }
    .button:hove {
        background-color: #f0f0f0; /* 호버 시 연한 회색으로 변경 */
    }

    /* 버튼 스타일 */
    .dropdown-button1 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center; /* 텍스트와 아이콘 간격 유지 */
        padding: 7px 8px; /* 버튼 여백 */
        font-size: 14px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 100px; /* 버튼 너비 고정 */
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 12px; /* 위에서 10px 아래 */
        left: 20px;
    }
    .dropdown-button2 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center; /* 텍스트와 아이콘 간격 유지 */
        padding: 7px 8px; /* 버튼 여백 */
        font-size: 14px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 110px; /* 버튼 너비 고정 */
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 12px; /* 위에서 10px 아래 */
        left: 130px;
    }
    .dropdown-button3 {
        display: flex; /* 텍스트와 아이콘을 나란히 배치 */
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: space-between; /* 텍스트와 아이콘 간격 유지 center */
        padding: 7px 8px; /* 버튼 여백 */
        font-size: 14px; /* 글자 크기 */
        color: black; /* 글자 색상 */
        background-color: white; /* 배경색 */
        border: 1px solid #ccc; /* 얇은 테두리 */
        border-radius: 20px; /* 둥근 모서리 */
        position: relative;
        z-index: 10; /* 클릭 우선 순위 */
        cursor: pointer; /* 클릭 가능한 포인터 표시 */
        width: 170px; /* 버튼 너비 고정 */
        height: 35px;
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        position: absolute; /* 절대 위치 */
        top: 12px; /* 위에서 10px 아래 */
        left: 250px;
    }


.dropdown-button3 span {
    position: absolute; /* 텍스트 위치를 절대적으로 설정 */
    top: 6px;
    left: 15px; /* 텍스트를 왼쪽으로 조금 이동 */

}

  .matching_icon{
        position: absolute;
        left: 140px;
        top:8px;
         width:15px;
         height:16px;
        }

    /* 아래 화살표 스타일 */
    .dropdown-icon {
        margin-left: 13px; /* 텍스트와 아이콘 간격 */
        margin-bottom: 4px;
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

    .icon-button2 {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 25px; /* 버튼의 너비와 높이를 동일하게 설정 */
        height: 25px;
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 50%; /* 둥근 모서리 */
        background-color: white; /* 배경색 */
        cursor: pointer; /* 클릭 가능한 포인터 */
        transition: background-color 0.3s ease, transform 0.3s ease;
        position: absolute; /* 절대 위치 */
        top: 10px; /* 위에서 10px 아래 */
        left: 394px;
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
        width: 441px; /* 패널 너비 */
        display: flex;
        align-items: center;
        z-index: 1000;

    }

    .sliding-panel {
        position: absolute;
        top: 66px; /* 위쪽 공간을 10px로 줄임 */
        left: 0px; /* 처음에는 화면 밖에 위치 */
        height: 100%;
        width: 441px;
        background-color: white;
        border-right: 1px solid lightgray; /* 왼쪽에서 나오기 때문에 오른쪽 테두리 */
        transition: left 0.3s ease; /* 슬라이드 애니메이션 */
        padding: 0px;
    }

    .sliding-panel.collapsed {
        left: -442px;
    }

    .sliding-panel.active {
        left: 0; /* 화면 안으로 이동 */
    }

    .slide-toggle-button {
        position: absolute;
        top: 47%;
        right: -26px; /* 버튼이 패널에 붙어 위치 */
        transform: translateY(-50%);
        background-color: white;
        border: 1px solid lightgray;
        cursor: pointer;
        z-index: 1001;
        font-size: 16px;
        color: #808080;
        transition: transform 0.3s ease;
        width: 26px;
        height: 70px;
        border-radius: 0 12px 12px 0;
        padding-right: 14px;
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
        padding: 5px;
        background-color: rgb(255, 255, 255);
        border: 1px solid black;
        position : absolute;
        top: 40px;
        left: 20px;
        width: 100px; /* 박스 너비 */
        height: 300px; /* 박스 높이 */
        overflow-y: auto;            /* 세로 스크롤 활성화 */
        z-index: 1001; /* 패널보다 위로 */
        border-radius: 5px; /* 모서리 둥글게 */
    }

    #box2{
        margin-top: 10px;
        padding: 5px;
        background-color: rgb(255, 255, 255);
        border: 1px solid black;
        position : absolute;
        top: 40px;
        left: 120px;
        width: 100px; /* 박스 너비 */
        height: 210px; /* 박스 높이 */
        z-index: 1001; /* 패널보다 위로 */
        border-radius: 5px; /* 모서리 둥글게 */
    }

    #box3 {
        margin-top: 10px;
        padding: 10px;

        background-color: white; /* 배경색 흰색 */
        position: absolute;
        top: 52px;
        border: none; /* 테두리 제거 */
        width: 422px; /* 박스 너비 */
        height: calc(100% - 140px); /* 하단 버튼 공간 확보 */
        overflow-y: scroll; /* 세로 스크롤 활성화 */
        z-index: 1001; /* 패널보다 위로 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
        border-radius: 10px; /* 모서리 둥글게 */
    }
    #box3::-webkit-scrollbar {
        width: 6px;
        background: transparent;
    }

    #box3::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0.15);
        border-radius: 4px;
    }

    #box3::-webkit-scrollbar-thumb:hover {
        background-color: rgba(0, 0, 0, 0.2);
    }

    #box3:-webkit-scrollbar-track {
        background: transparent;
    }
    /* 섹션 제목 스타일 */
    h3.section-title {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: light;
        text-align: center;
        font-size: 15px;
        position: relative;
        margin-top: 33px;
        margin-bottom: 10px;
        color: #808080;
    }

    /* 항목 컨테이너 */
    .infrastructure-item {
        display: flex;
        align-items: center;
        margin: 5px;
        border-bottom: 1px solid #eee;
        padding-bottom: 12px;
    }

    /* 아이콘 및 명칭 컨테이너 */
    .icon-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-left: 3px;
        margin-top: 25px;
        width: 80px;
    }

    /* 아이콘 스타일 */
    .infrastructure-icon {
        width: 50px;
        height: 50px;
    }
    /*  명칭 스타일 */
    .infrastructure-text{
        width: 60px;
        height: 20px;
    }

    /* 명칭 스타일 */
    .infrastructure-name {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-size: 14px;

        margin-top: 5px;
        color: #444;
        text-align: center;
    }

    /* 슬라이더 컨테이너 */
    .slider-container {

        width: 400px;
        overflow-x: hidden;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        flex-wrap: nowrap;
        gap:0;
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        font-size: 13px;
        color: #666;
        display: flex;



    }

    /* 슬라이더 */
    .slider-wrapper {
        position: relative;
        display: flex;
        align-items: center;
        gap: 10px; /* 슬라이더와 값 간격 */
        width: 285px;
        height: 50px;
        left: 30px;

    }

    .slider {

       margin: 10px;
     width: 285px;
     height: 4px;
    -webkit-appearance: none; /* 기본 슬라이더 스타일 제거 */
    appearance: none;
    background: #ccc; /* 슬라이더 바 기본 색 */
     border-radius: 5px;
             }


    /* 슬라이더 버튼에 이미지 배경 적용 */
    .slider::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 23px; /* 버튼 크기 */
        height: 23px; /* 버튼 크기 */
        background-image: url('/images/icon/slideButton.png'); /* 버튼 이미지 */
        background-size: cover;
        cursor: pointer;
    }




    /* 슬라이더 값 * /
    /*.slider-value {
        font-size: 14px;
        font-weight: bold;
        color: #333;
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */

    }*/

    /* 라벨 스타일 */
    .slider-labels {

        display: flex;
        justify-content: space-between;

        color: #666;
        width: 420px;
        margin-bottom: 20px;
        position: relative;
        white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
        overflow: hidden; /* 넘치는 내용이 잘리도록 설정 */

    }
    .slider-labels span:first-child {
            margin-left: 10px; /* 마지막 span에는 마진 제거 */
        }
    .slider-labels span {
        margin-right: 38px; /* 각 span 요소에 좌우 20px의 마진 추가 */
    }
    .slider-labels span:last-child {
        margin-right: 0; /* 마지막 span에는 마진 제거 */
    }

    .fixed-bottom-button {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-size: 13px;
        position: fixed;
        bottom: 10px;
        left: 145px;
        width: 150px; /* 박스 안에 맞춤 */
        height: 35px; /* 버튼 높이 */
        background-color: #ff6b3c; /* 버튼 색상 */
        color: white;
        border: none;
        border-radius: 25px; /* 둥근 버튼 */
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 버튼에 그림자 추가 */
        z-index: 1002; /* 버튼을 최상위로 */
    }

    .fixed-bottom-button:hover {
        background-color: #ff4500; /* 버튼 호버 색상 */
    }


    .long-hr{
    position: relative;
    left: -20px;
    width: 335px;
    border: 1px solid #dcdcdc !important;
    margin-top: 40px !important;
    }


    .scroll-button{
        background-color: white; /* 기본 배경색 */
        border: 1px solid gray;
        padding: 3px;
        margin: 2px;
        width: 100%; /* 부모 요서 전체 너비 차지 */
        justify-content: center; /* 가로 가운데 정렬 */
        cursor: pointer;
        transition: background-color 0.3s ease;
        border-radius: 5px; /* 모서리 둥글게 */
    }

    .scroll-button.selected{
        background-color: #FF6F3C;
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
        display: none; /* Flexbox로 수평 배치 */
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
        width:370px;
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
        position: relative;
        width:70px;
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


    .list-check-button{

        position: relative;
        height: 35px;
        top: 70px;
        left: 265px;

        width: 170px;
    }

    #checkButton{
    font-family: 'Spoqa Han Sans Neo', sans-serif;
    font-weight: 400;
    border: none;
    background-color: #ffffff;
    }
    .checkB{
     width:17px;
     height:17px;
     position: relative; /* 부모 요소의 영향을 받지 않도록 설정 */
     top: 3px;

    }

    .list-item {
        position: relative;
        width: 443px;
        padding: 0; /* 내부 여백 제거 */
        margin: 0;
        left: 0px;
        border: none; /* 테두리 제거 */
         /* 배경 투명 */
        box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1); /* 박스 섀도우 제거 */
        height: 190px;
        display: flex;
        flex-direction: column;
        gap: 10px;
        border-bottom: 1px solid lightgray; /* 회색 선 추가 */
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
        width: 90%; /* 선의 너비 */
        height: 1px; /* 선의 두께 */
        background-color: #ccc; /* 회색 선 */
        position: relative; /* 기준 위치에서 이동 */
        left: 17px; /* 오른쪽으로 20px 이동 */
        top: 30px;
    }


    .list-subtitle {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 400;
        font-size: 15px;
        color: #666;
        position: relative; /* 기준 위치에서 이동 */
        left: 28px; /* 오른쪽으로 20px 이동 */
        top: 32px;
        width:190px;
    }

    .vertical-line2 {
        width: 2.5px; /* 선의 너비 */
        height: 55px; /* 선의 두께 */
        background-color: #ccc; /* 회색 선 */
        position: absolute; /* 기준 위치에서 이동 */
        left: 201px; /* 오른쪽으로 20px 이동 */
        top: 108px;
    }

    .co {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        font-size: 14px;
        color: #555;
        position: relative; /* 기준 위치에서 이동 */
        left: 28px; /* 오른쪽으로 20px 이동 */
        top: 7.5px;
    }
    .dep {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        font-size: 14px;
        display: flex;
        color: #555;
        position: relative; /* 기준 위치에서 이동 */
        left: 210px; /* 오른쪽으로 20px 이동 */
        top: 28px;
        width:199px;
    }
    .detail-label-deposit {
        flex: 1; /* 좌측에 배치될 레이블 */
    }
    .detail-value deposit
    {
        position: absolute;
        right:0px;
        text-align: right; /* 텍스트 오른쪽 정렬 */
        margin-left: 10px; /* 오른쪽 정렬하면서 왼쪽에 간격을 두기 */
    }

    .month {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 300;
        font-size: 14px;
        color: #555;
        display: flex;
        position: relative; /* 기준 위치에서 이동 */
        left: 210px; /* 오른쪽으로 20px 이동 */
        top: 37px;
        width:199px;
    }

    .detail-label-month {
        flex: 1; /* 좌측에 배치될 레이블 */
    }
    .detail-value monthly-rent
    {
        position: absolute;
        right:0px;
        text-align: right; /* 텍스트 오른쪽 정렬 */
        margin-left: 10px; /* 오른쪽 정렬하면서 왼쪽에 간격을 두기 */
    }


    .detail-value {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-weight: 500;
        color: #000000;
    }

    .slide-content-container {
        overflow-y: auto; /* 수직 스크롤 허용 */
        max-height: 610px; /* 스크롤 가능한 최대 높이 */
        margin-top: 70px; /* 상단에서 100px 떨어지게 설정 */
         /* 내부 여백 추가 */
        width: 441px;
        overflow-x: hidden;

    }

    .slide-content-container::-webkit-scrollbar {
        width: 6px;
        background: transparent;
    }

    .slide-content-container::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0.15);
        border-radius: 4px;
    }

    .slide-content-container::-webkit-scrollbar-thumb:hover {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .slide-content-container::-webkit-scrollbar-track {
        background: transparent;
    }



    /* 카드 표시 시 */
    .info-card.visible {
      display: block; /* 카드가 보이도록 */
    }

    /* 닫기 버튼 스타일 */


    .close-info-card:hover {
      color: #000;
    }

    /* 카드 내부 텍스트 스타일 */


    #infoCardName{
    font-family: 'NanumSquare', sans-serif;
    font-weight: 1000;
    position: relative;
    top: -4px;

    }

    .info-card-label {
      font-weight: bold;
      font-align: right;
    }
    .info-card-txtc{
        position: relative;
        left: 25px;
    }
    #infoCardCompany{
        position: relative;
        left: 25px;
    }
    #infoCardParking{
        position: relative;
        left: 25px;
    }

    #prevSlide {
        left: 10px;
    }

    #nextSlide {
        right: 10px;
    }
    .hidden {
        display: none;
    }

    #slideOverlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .slide-container {
        background: white;
        width: 80%;
        max-width: 800px;
        padding: 20px;
        border-radius: 10px;
        overflow: hidden;
        position: relative;

    }

    .slides {
        display: flex;
        overflow-x: auto;
        gap: 20px;
        padding: 10px 0;
    }

    .slide {
        flex: 0 0 100%;
        background: #f9f9f9;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .slider-button{
        align-content:center; /* 방향이 세로 기준 중앙정렬 */
    }
    #prevSlide{
        float: left;
    }
    #nextSlide{
        float: right;
    }
    #infoCardKind{
    font-family: 'Spoqa Han Sans Neo', sans-serif;
    font-weight: 400;
    font-size: 15px;
    color: ##3a3a3a;
    position: relative; /* 기준 위치에서 이동 */
    left: 4px; /* 오른쪽으로 20px 이동 */
    top: 12px;


    }
    #infoCardDeposit, #infoCardRent, #infoCardWe{
        right:0;
    }
    p{
        font-size:12px;
    }
    /* indicator */
    .indicators-container {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 8px;
        position: absolute; /* 카드 내부에 고정 */
        bottom: 20px;       /* 카드 하단에서 20px 위 */
        left: 50%;
        transform: translateX(-50%);
        z-index: 10;        /* 다른 요소 위로 배치 */
    }

    .indicator {
        width: 10px;
        height: 10px;
        background-color: #ddd;
        border-radius: 50%;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .indicator.active {
        background-color: #007bff;
    }

    .logo{
        width: 37px;
        height: 37px;
        position: absolute;
        left: 23px;
        top: 10px;
    }
    .slide-logo{
        width:15px;
        height:15px;
        position: relative;
        top:2.5px;
        left: 1px;
    }
    .slide-logo-title{
     width:20px;
     height:20px;
    }

    .title-icon{
         position: relative;
         top: 5px;
         width:20px;
         height:20px;
         margin-right: 0px;
         left: 3px;
        }
    .list-title{
        font-family: 'NanumSquare', sans-serif;
        font-weight: 1000;
        width: 200px;
        color: black;
    }



    .card-container {
        display: none;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        position: relative; /* 버튼을 카드 내부에 배치하기 위해 설정 */
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #fff;
        width: 400px; /* 카드의 가로 크기 */
        height: 300px; /* 카드의 세로 크기 */
    }

    .card-container.visible {
        display: flex;
    }

    .slide-btn {
        position: absolute; /* 부모 요소인 .card-container 내부에 고정 위치 */
        top: 50%; /* 세로 중앙 정렬 */
        transform: translateY(-50%); /* 정확한 중앙 정렬 */
        background: none;
        border: none;
        font-size: 24px;
        cursor: pointer;
        color: #333;
        z-index: 10; /* 버튼이 다른 요소 위에 표시되도록 설정 */
    }

    .slide-btn:hover {
        color: #000;
    }
    .slide-btn:hover {
        color: #000;
    }

    #prevSlide {
        left: 10px; /* 왼쪽 버튼 위치 */
    }

    #nextSlide {
        right: 10px; /* 오른쪽 버튼 위치 */
    }






  /*세부 창 디자인*/
    .info-card {
        position: relative; /* 기준 위치에서 이동 */
        left: 470px; /* 오른쪽으로 20px 이동 */
        top: 70px;
      width: 310px;
      height: calc(100% - 110px);
      overflow-y: auto; /* 세로 스크롤 활성화 */
      border: 1px solid #ccc;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      font-family: 'Spoqa Han Sans Neo', sans-serif;
      padding: 16px;
      background-color: #fff;
      z-index: 1000; /* 다른 요소 위로 */
      display: none; /* 기본적으로 숨김 */

    }

    .info-card::-webkit-scrollbar {
        width: 6px;
        background: transparent;
    }

    .info-card::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0.15);
        border-radius: 4px;
    }

    .info-card::-webkit-scrollbar-thumb:hover {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .info-card::-webkit-scrollbar-track {
        background: transparent;
        width: 6px;
    }




    .close-info-card {
      position: absolute;
      top: 4px;
      right: 0px;
      background: none;
      border: none;
      font-family: 'Spoqa Han Sans Neo', sans-serif;
      font-size: 20px;
      font-weight: 100;
      color: #d3d3d3;
      cursor: pointer;
    }


    .info-card-title {
      font-size: 17px;
      font-weight: bold;
      margin-top: 15px;
      margin-bottom: 20px;
      text-align: center;
    }

    .info-card hr {
      border: none;
      border-top: 1px solid #eee;
      margin: 12px 0;
    }
    .info-card p {
      margin: 6px 0;
      font-size: 14px;
      line-height: 1.4;
    }
    .info-card .info-card-label {
      font-weight: bold;
      color: #555;
    }
    .distance-icons {
      display: flex;
      justify-content: space-around;
      margin: 8px 0;
    }
    .distance-icons div {
      font-size: 12px;
      text-align: center;
    }
    .image-placeholder {
      width: 100%;
      height: 100px;
      background-color: #f0f0f0;
      border: 1px dashed #ccc;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
      color: #888;
    }
    .pd10 {
      margin: 25px 0 !important;
      font-family: 'Spoqa Han Sans Neo', sans-serif;


    }
    .pd20 {
      margin-top: 22px !important; /* 위쪽 여백만 40px */
      margin-bottom: 25px !important; /* 아래쪽 여백은 0으로 설정 */
    }
    .pd30 {
      margin-top: 28px !important; /* 위쪽 여백만 40px */
      margin-bottom: 20 !important; /* 아래쪽 여백은 0으로 설정 */
    }
    .span1 {
      margin-right: 45px; /* 각 span 태그 사이에 오른쪽 여백을 10px 추가 */
    }
    .span2 {
      margin-right: 52px; /* 각 span 태그 사이에 오른쪽 여백을 10px 추가 */
    }
    .span3 {
      margin-right: 15px; /* 각 span 태그 사이에 오른쪽 여백을 10px 추가 */
      margin-left: 35px; /* 각 span 태그 사이에 오른쪽 여백을 10px 추가 */
    }

    .span4 {
      width:50px;
      text-align: right;
      margin-left: 30px; /* 각 span 태그 사이에 오른쪽 여백을 10px 추가 */
    }

    .slide-btn1 {
        color: gray;
      position: absolute;
      top: 500px;
      left: 60px;
      font-size: 30px; /* 글자 크기를 줄여 얇아 보이게 설정 */
      font-weight: normal; /* 굵기를 조정 */
      border: none;
      background: none;
      cursor: pointer;
      z-index: 1000;        /* 다른 요소 위로 배치 */
    }

    .slide-btn2 {
    color: gray;
      position: absolute;
      top: 500px;
      left: 290px;
      font-size: 30px; /* 글자 크기를 줄여 얇아 보이게 설정 */
      font-weight: normal; /* 굵기를 조정 */
      border: none;
      background: none;
      cursor: pointer;
      z-index: 1000;        /* 다른 요소 위로 배치 */
    }
    .area {
        margin-top: 8px !important; /* 위쪽 여백만 40px */
         /* 배경 색상 */
         /* 모서리를 둥글게 */
        padding: 3px; /* 내부 값들과의 간격 */
    }

    .icon-grid {
        display: grid; /* 그리드 레이아웃 사용 */
        grid-template-columns: repeat(4, 1fr); /* 한 줄에 4개의 칸 생성 */
        gap: 10px; /* 아이템 간의 간격 */
        margin-top: 10px;
    }

    .icon-grid-item {
        display: flex;
        flex-direction: column; /* 세로 정렬 */
        align-items: center; /* 중앙 정렬 */
        padding: 3px;
        border-radius: 10px; /* 모서리를 둥글게 */
        text-align: center; /* 텍스트 중앙 정렬 */
    }

    .icon-grid-item img {
        width: 40px; /* 아이콘 크기 */
        height: 40px;
        margin-bottom: 10px; /* 아이콘과 텍스트 간격 */
    }

    .icon-grid-item span {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-size: 14px; /* 텍스트 크기 */
        color: dimgray;
        font-weight: 400;
       width: 60px;
    }
    .addressSize {
        font-family: 'Spoqa Han Sans Neo', sans-serif;
        font-size: 14px; /* 텍스트 크기 */
        font-weight: 300;
    }
    /* 지도에 인프라 마커들 css*/
    #categoryBar{
         position: absolute;
         bottom: 10px;
         right: 10px;
         z-index: 10;
         background-color: white;
         padding: 10px;
         border-radius: 5px;
         box-shadow: 0px 0px 5px rgba(0,0,0,0.5);
    }
    .map-buttons{
        background-color: #f0f0f0;
        border-radius: 10px;
        border: 1px solid #ccc;
        padding: 5px 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .map-buttons.active{
        background-color: #FF6F3C;
        color: white;
    }
    .no-data-message{
        padding: 20px;
    }








</style>
<body>

    <!-- 선위에 요소들 style에 .클래스 이름으로 스타일 정의해 놓음 -->
    <img src="/images/icon/logo.png" alt="아이콘" class="logo">
    <h3 class = "title">메타홈</h3>
    <div class="menu">
    <button class = "white-button1">맞춤 지도</button>
    <button class = "white-button2" onclick="showAlert()">우리 동네 이사와 생활 서비스</button>
    <button class = "white-button3" onclick="showAlert()">로그인</button>
    <button class = "white-button4" onclick="showAlert()">멤버쉽 가입</button>
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
                        <button class="scroll-button" onclick="setAddress('전체')">전체</button>
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
                            <img src="/images/icon/bus.png" alt="버스">
                            <span class="span30" id="infoCardBus"></span>
                        </div>
                        <div class="icon-grid-item">
                            <img src="/images/icon/subway.png" alt="지하철">
                            <span class="span30" id="infoCardSubway"></span>
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
                            <img src="/images/icon/park.png" alt="공원">
                            <span class="span30" id="infoCardPark"></span>
                        </div>
                         <div class="icon-grid-item">
                            <img src="/images/icon/parking.png" alt="주차장">
                            <span class="span30" id="infoCardParking1"></span>
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
            <button class="map-buttons" onclick="toggleParkMarkers(this)">공원</button>
            <button class="map-buttons" onclick="toggleElemMarkers(this)">초등학교</button>
            <button class="map-buttons" onclick="toggleMidMarkers(this)">중학교</button>
            <button class="map-buttons" onclick="toggleHighMarkers(this)">고등학교</button>
            <button class="map-buttons" onclick="toggleHospMarkers(this)">병원</button>
        </div>


<script>

    // 초기값 설정
    let selectedAddress = '${address}';
    let selectedHomeKind = '${homeKind}';

    let recruit =  new URLSearchParams(window.location.search).get('recruit') || 'N'; // URL에서 recruit 값을 가져옴

    function showAlert() {
          alert("서비스 준비 중입니다.");
        }

// JavaScript 코드
    const button = document.getElementById('checkButton');
    const image = document.getElementById('checkImage');
    if (recruit === 'N') {
              image.src = '/images/icon/CHECK.png'; // recruit가 'N'일 때는 CHECK.png
          } else {
              image.src = '/images/icon/CHECK.a.png'; // recruit가 'Y'일 때는 CHECK.a.png
          }


    // 클릭 이벤트 리스너 추가
    button.addEventListener('click', () => {

     // recruit 값을 토글
     recruit = recruit === 'N' ? 'Y' : 'N';

      // 이미지 소스를 변경
      if (recruit === 'N') {
          image.src = '/images/icon/CHECK.png'; // recruit가 'N'일 때는 CHECK.png
      } else {
          image.src = '/images/icon/CHECK.a.png'; // recruit가 'Y'일 때는 CHECK.a.png
      }

      // URL 업데이트 호출
      updateURL();
    });




    // 서버에서 값이 전달되지 않을 경우 기본값으로 설정
    if (!selectedAddress || selectedAddress === '${address}') {
        selectedAddress = ''; // 초기 기본값
    }
    if (!selectedHomeKind || selectedHomeKind === '${homeKind}') {
        selectedHomeKind = ''; // 초기 기본값
    }

    // 페이지 로드 후 초기화
    document.addEventListener('DOMContentLoaded', () => {
        // URL에서 값 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        selectedAddress = urlParams.get('address') || selectedAddress;
        selectedHomeKind = urlParams.get('homeKind') || selectedHomeKind;

        // 선택된 지역 버튼 활성화
        if (selectedAddress) {
            document.querySelectorAll('.box#box1 .scroll-button').forEach(button => {
                if (button.textContent.trim() === selectedAddress) {
                    button.classList.add('selected');
                } else {
                    button.classList.remove('selected');
                }
            });
            // 드롭다운 텍스트 업데이트
            const dropdownButton = document.getElementById('dropdownButton');
            dropdownButton.innerHTML = `\${selectedAddress} <span class="dropdown-icon"></span>`;
        } else {
            // '전체'일 때 드롭다운에 '전체' 표시
            const dropdownButton = document.getElementById('dropdownButton');
            dropdownButton.innerHTML = `전체 <span class="dropdown-icon"></span>`;
        }

        // 선택된 주택 유형 버튼 활성화
        if (selectedHomeKind) {
            document.querySelectorAll('.box#box2 .scroll-button').forEach(button => {
                if (button.textContent.trim() === selectedHomeKind) {
                    button.classList.add('selected');
                } else {
                    button.classList.remove('selected');
                }
            });
            // 드롭다운 텍스트 업데이트
            const homeKindButton = document.getElementById('homeKindButton');
            homeKindButton.innerHTML = `\${selectedHomeKind} <span class="dropdown-icon"></span>`;

        } else {
            // '전체'일 때 드롭다운에 '전체' 표시
            const homeKindButton = document.getElementById('homeKindButton');
            homeKindButton.innerHTML = `전체 <span class="dropdown-icon"></span>`;
        }
    });

    // 값이 모두 설정되었는지 확인하는 함수
    function isReadyToRefresh() {
        return selectedAddress && selectedHomeKind;
    }

    // 주소 업데이트
    function setAddress(address) {
        if (address === '전체') {
            selectedAddress = ''; // "전체"를 선택하면 서버로 빈 값 전달
        } else {
            selectedAddress = address.trim(); // 다른 값 처리
        }

        // 선택된 버튼 업데이트
        document.querySelectorAll('.box#box1 .scroll-button').forEach(button => {
            if (button.textContent.trim() === address) {
                button.classList.add('selected');
            } else {
                button.classList.remove('selected');
            }
        });

        // 드롭다운 버튼 텍스트 업데이트
        if (!selectedAddress) {
            const dropdownButton = document.getElementById('dropdownButton');
            dropdownButton.innerHTML = `전체 <span class="dropdown-icon"></span>`;
        }
        updateURL();
    }

    // 주택 유형 업데이트
    function setHomeKind(homeKind) {
        if (homeKind === '전체') {
            selectedHomeKind = ''; // "전체"를 선택하면 서버로 빈 값 전달
        } else {
            selectedHomeKind = homeKind.trim(); // 다른 값 처리
        }

        // 선택된 버튼 업데이트
        document.querySelectorAll('.box#box2 .scroll-button').forEach(button => {
            if (button.textContent.trim() === homeKind) {
                button.classList.add('selected');
            } else {
                button.classList.remove('selected');
            }
        });

        // 드롭다운 버튼 텍스트 업데이트
        if (!selectedHomeKind) {
            const homeKindButton = document.getElementById('homeKindButton');
            homeKindButton.innerHTML = `전체 <span class="dropdown-icon"></span>`;
        }
        updateURL();
    }


    // URL 업데이트
    function updateURL() {

        const encodedAddress = encodeURIComponent(selectedAddress || '');
        const encodedHomeKind = encodeURIComponent(selectedHomeKind || '');
        const encodedRecruit = encodeURIComponent(recruit || '');
        const timestamp = Date.now(); // 캐싱 방지


        const url = `/home?address=\${encodedAddress}&homeKind=\${encodedHomeKind}&recruit=\${encodedRecruit}`;

        // 페이지를 새 URL로 리디렉션 (새로 고침)
        window.location.href = url;

    }

</script>


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




    // 차트를 보이는 함수
    function showChart() {
        document.getElementById('chartContainer').style.display = 'flex'; // 차트 컨테이너 표시
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
                    const jsonData = jdata; // JSP에서 전달된 JSON 데이터 (문자열로 전달)
                    const parsedData = jsonData;

                    // 1. 키 배열 가져오기
                    const keys = Object.keys(parsedData[0]);

                    // similar 값을 가져와 100을 곱한 점수를 계산
                    const score = Math.floor(parsedData[0].similar * 100); // 첫 번째 데이터의 similar 값 사용

                    // 점수를 HTML에 표시
                    document.querySelector(".score-number").textContent = score;

                    // 2. 첫 번째와 두 번째 키를 제외
                    const relevantKeys = keys.slice(3); // 첫 번째(0)와 두 번째(1) 키 제외

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

                     // 라벨별 이미지를 매핑
                        const labelImagesMapping = {
                            park: "/images/icon/park.png",
                            bus: "/images/icon/bus.png",
                            subway: "/images/icon/subway.png",
                            hospitalcount: "/images/icon/hospitalcount.png",
                            element: "/images/icon/element.png",
                            middle: "/images/icon/middle.png",
                            high: "/images/icon/high.png",
                            parking: "/images/icon/parking.png"
                        };

                        // 4. 라벨과 데이터 추출
                        const labels = relevantKeys.map((key) => keyMapping[key] || key); // 매핑된 한국어 키 사용
                        const data = relevantKeys.map((key) => parsedData[0][key] * 100); // 퍼센트 변환
                        const labelImages = relevantKeys.map((key) => labelImagesMapping[key]); // 사용된 컬럼에 해당하는 이미지 경로 추출


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

                    // 4. Chart.js로 차트 생성
                    try {
                        const ctx = document.getElementById('myChart').getContext('2d');

                       // 기존 차트를 제거하기 전에 Chart 객체인지 확인
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
                                            font: { size: 14 } // 글자 크기
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
                                        font: { size: 18, weight: 'bold' },
                                        padding: { top: 10, bottom: 20 },
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

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        currentMarker = new kakao.maps.Marker({
                            map: map,
                            position: coords,
                            isClicked: false
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
                            const jsonData = jdata; // JSP에서 전달된 JSON 데이터 (문자열로 전달)
                            const parsedData = jsonData;

                            // 1. 키 배열 가져오기
                            const keys = Object.keys(parsedData[0]);

                            // similar 값을 가져와 100을 곱한 점수를 계산
                            const score = Math.floor(parsedData[0].similar * 100); // 첫 번째 데이터의 similar 값 사용

                            // 점수를 HTML에 표시
                            document.querySelector(".score-number").textContent = score;

                            // 2. 첫 번째와 두 번째 키를 제외
                            const relevantKeys = keys.slice(3); // 첫 번째(0)와 두 번째(1) 키 제외

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

                             // 라벨별 이미지를 매핑
                                const labelImagesMapping = {
                                    park: "/images/icon/park.png",
                                    bus: "/images/icon/bus.png",
                                    subway: "/images/icon/subway.png",
                                    hospitalcount: "/images/icon/hospitalcount.png",
                                    element: "/images/icon/element.png",
                                    middle: "/images/icon/middle.png",
                                    high: "/images/icon/high.png",
                                    parking: "/images/icon/parking.png"
                                };

                                // 4. 라벨과 데이터 추출
                                const labels = relevantKeys.map((key) => keyMapping[key] || key); // 매핑된 한국어 키 사용
                                const data = relevantKeys.map((key) => parsedData[0][key] * 100); // 퍼센트 변환
                                const labelImages = relevantKeys.map((key) => labelImagesMapping[key]); // 사용된 컬럼에 해당하는 이미지 경로 추출


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
                                                            grid: { display: false },
                                                            ticks: {
                                                                font: {
                                                                    size: 14 // 라벨 글자 크기 조절
                                                                }
                                                            }
                                                        },
                                                        y: {
                                                            beginAtZero: true,
                                                            grid: { display: false },
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

                                 // 결과값으로 받은 위치를 마커로 표시합니다
                                 currentMarker = new kakao.maps.Marker({
                                     map: map,
                                     position: coords,
                                     isClicked: false
                                 });

                                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                 //map.setCenter(coords);
                                 // 지도 중심 이동: 화면 오른쪽 절반으로 이동
                                 // 지도 중심 이동: 선택된 좌표가 화면의 200px 왼쪽에 오도록 이동
                                 const mapWidth = mapContainer.offsetWidth;
                                 const mapHeight = mapContainer.offsetHeight;

                                 // 화면에서 좌표가 위치해야 할 X축 위치 (200px 왼쪽)
                                 const moveX = coords.getLng() - (15 / mapWidth) * (map.getBounds().getNorthEast().getLng() - map.getBounds().getSouthWest().getLng());
                                 const moveY = coords.getLat();  // 세로는 그대로 중앙

                                 // 새로 이동할 지도 중심 좌표
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