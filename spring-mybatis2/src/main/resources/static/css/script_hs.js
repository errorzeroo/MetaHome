document.getElementById("slideToggleButton").addEventListener("click", function () {
            const panel = document.getElementById("slidingPanel");
            panel.classList.toggle("active");

            // 버튼 아이콘 변경 (❮ ↔ ❯)
            this.textContent = panel.classList.contains("active") ? "❮" : "❯";
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
                                ${visibleListings.map((item, index) => `
                                    <li class="room" data-index="${index}">
                                        ${item.name}
                                    </li>`).join("")}
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