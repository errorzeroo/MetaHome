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