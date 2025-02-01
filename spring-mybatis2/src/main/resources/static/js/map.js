document.addEventListener("DOMContentLoaded", () => {
    // 🔹 지도 초기화
    const mapContainer = document.getElementById("map");
    const mapOption = {
        center: new kakao.maps.LatLng(37.4833939381, 127.01698271446),
        level: 5
    };
    const map = new kakao.maps.Map(mapContainer, mapOption);

    // 🔹 마커 데이터와 상태 초기화
    const markerData = {
        subway: { coords: subwayCoords, markers: [], visible: false, icon: "/images/icon/subway.png" },
        bus: { coords: busCoords, markers: [], visible: false, icon: "/images/icon/bus.png" },
        park: { coords: parkCoords, markers: [], visible: false, icon: "/images/icon/park.png" },
        elem: { coords: elemCoords, markers: [], visible: false, icon: "/images/icon/element.png" },
        mid: { coords: midCoords, markers: [], visible: false, icon: "/images/icon/middle.png" },
        high: { coords: highCoords, markers: [], visible: false, icon: "/images/icon/high.png" },
        hosp: { coords: hospCoords, markers: [], visible: false, icon: "/images/icon/hospitalcount.png" },
        parking: { coords: parkingCoords, markers: [], visible: false, icon: "/images/icon/parking.png" },
    };
    let currentMarker = null;

    // 🔹 마커 생성 함수
    function createMarkers(type) {
        const { coords, markers, icon } = markerData[type];
        coords.forEach(coord => {
            const marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(coord.lat, coord.lon),
                image: new kakao.maps.MarkerImage(icon, new kakao.maps.Size(30, 30))
            });
            marker.setMap(null); // 초기에는 숨김
            markers.push(marker);
        });
    }

    // 🔹 마커 토글 함수
    function toggleMarkers(type, button) {
        const markerInfo = markerData[type];
        const isVisible = markerInfo.visible;

        markerInfo.markers.forEach(marker => marker.setMap(isVisible ? null : map));
        markerInfo.visible = !isVisible;
        button.classList.toggle("active", markerInfo.visible);
    }

    // 🔹 초기 마커 생성
    Object.keys(markerData).forEach(type => createMarkers(type));

    // 🔹 버튼 이벤트 연결
    document.querySelectorAll(".toggle-marker-button").forEach(button => {
        const type = button.dataset.type;
        button.addEventListener("click", () => toggleMarkers(type, button));
    });

    // 🔹 차트 표시/숨기기 함수
    function toggleChart(visible) {
        const chartContainer = document.getElementById("chartContainer");
        chartContainer.style.display = visible ? "flex" : "none";
    }

    // 🔹 슬라이더 초기화
    const defaultSliderValues = {
        busSlider: 1.0,
        subwaySlider: 1.0,
        elementarySlider: 0.0,
        middleSlider: 0.0,
        highSlider: 0.0,
        hospitalSlider: 0.0,
        parkingSlider: 0.0,
        parkSlider: 0.0,
    };
    const sliders = [
        { id: "busSlider", valueId: "busSliderValue" },
        { id: "subwaySlider", valueId: "subwaySliderValue" },
        { id: "elementarySlider", valueId: "elementarySliderValue" },
        { id: "middleSlider", valueId: "middleSliderValue" },
        { id: "highSlider", valueId: "highSliderValue" },
        { id: "hospitalSlider", valueId: "hospitalSliderValue" },
        { id: "parkingSlider", valueId: "parkingSliderValue" },
        { id: "parkSlider", valueId: "parkSliderValue" },
    ];

    sliders.forEach(({ id, valueId }) => {
        const slider = document.getElementById(id);
        const valueDisplay = document.getElementById(valueId);

        if (slider && valueDisplay) {
            slider.addEventListener("input", () => {
                valueDisplay.textContent = parseFloat(slider.value).toFixed(2);
            });
        }
    });

    // 🔹 슬라이더 리셋 버튼
    document.getElementById("refreshButton2").addEventListener("click", () => {
        sliders.forEach(({ id, valueId }) => {
            const slider = document.getElementById(id);
            const valueDisplay = document.getElementById(valueId);

            if (slider && valueDisplay) {
                slider.value = defaultSliderValues[id];
                valueDisplay.textContent = defaultSliderValues[id].toFixed(2);
            }
        });
    });

    // 🔹 리스트 렌더링 함수
    const slideContainer = document.getElementById("slideContentContainer");
    const template = document.getElementById("slide-item-template");
    const itemsPerPage = 10;
    let currentPage = 1;
    let isLoading = false;

    function populateSlideContent(data) {
        if (!data || data.length === 0) {
            slideContainer.innerHTML = "<p class='no-data-message'>데이터가 없습니다.</p>";
            return;
        }

        data.forEach(item => {
            const clone = template.content.cloneNode(true);
            const listItem = clone.querySelector(".list-item");

            clone.querySelector(".list-title").textContent = item.HOME_NAME || "제목 없음";
            clone.querySelector(".list-type").textContent = item.HOME_KIND || "정보 없음";
            clone.querySelector(".deposit").textContent = item.HOME_DEP || "정보 없음";
            clone.querySelector(".monthly-rent").textContent = item.HOME_MOTH_PAI || "정보 없음";
            clone.querySelector(".company").textContent = item.HOME_CO || "정보 없음";

            listItem.addEventListener("click", () => handleListItemClick(item));
            slideContainer.appendChild(clone);
        });
    }

    // 🔹 리스트 아이템 클릭 이벤트
    function handleListItemClick(item) {
        const address = item.HOME_ADDRESS.trim();
        const homeKind = item.HOME_KIND.trim();
        const sliderValues = sliders.map(({ id }) => ({
            column: id.replace("Slider", "").toLowerCase(),
            value: parseFloat(document.getElementById(id).value),
        }));

        const query = new URLSearchParams({
            address: encodeURIComponent(address),
            homeKind: encodeURIComponent(homeKind),
            columns: sliderValues.map(s => s.column).join(","),
            values: sliderValues.map(s => s.value).join(","),
        }).toString();

        fetch(`/home/chart?${query}`)
            .then(response => response.json())
            .then(data => {
                console.log("차트 데이터:", data);
                toggleChart(true);
            })
            .catch(error => console.error("차트 데이터 요청 중 오류:", error));
    }

    // 🔹 초기 데이터 로드
    function init() {
        const initialData = slideData.slice(0, itemsPerPage);
        populateSlideContent(initialData);
    }

    // 🔹 스크롤 이벤트
    async function handleScroll() {
        const { scrollTop, scrollHeight, clientHeight } = slideContainer;

        if (scrollTop + clientHeight >= scrollHeight - 10 && !isLoading) {
            isLoading = true;
            currentPage++;

            const newData = slideData.slice(currentPage * itemsPerPage, (currentPage + 1) * itemsPerPage);
            if (newData.length > 0) {
                populateSlideContent(newData);
            } else {
                console.log("더 이상 데이터가 없습니다.");
            }

            isLoading = false;
        }
    }

    slideContainer.addEventListener("scroll", handleScroll);

    // 🔹 초기화 실행
    init();
});
