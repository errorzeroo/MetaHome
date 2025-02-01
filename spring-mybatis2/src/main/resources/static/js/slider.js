// 초기값 설정
let selectedAddress = '${address}';
let selectedHomeKind = '${homeKind}';

let recruit = new URLSearchParams(window.location.search).get('recruit') || 'N'; // URL에서 recruit 값을 가져옴

function showAlert() {
    alert("서비스 준비 중입니다.");
}

// JavaScript 코드
const button = document.getElementById('checkButton');
const image = document.getElementById('checkImage');

// recruit 값에 따라 초기 이미지 설정
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
    image.src = recruit === 'N'
        ? '/images/icon/CHECK.png'
        : '/images/icon/CHECK.a.png';

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
            button.classList.toggle('selected', button.textContent.trim() === selectedAddress);
        });

        // 드롭다운 텍스트 업데이트
        const dropdownButton = document.getElementById('dropdownButton');
        dropdownButton.innerHTML = `${selectedAddress} <span class="dropdown-icon"></span>`;
    } else {
        // '전체'일 때 드롭다운에 '전체' 표시
        const dropdownButton = document.getElementById('dropdownButton');
        dropdownButton.innerHTML = `전체 <span class="dropdown-icon"></span>`;
    }

    // 선택된 주택 유형 버튼 활성화
    if (selectedHomeKind) {
        document.querySelectorAll('.box#box2 .scroll-button').forEach(button => {
            button.classList.toggle('selected', button.textContent.trim() === selectedHomeKind);
        });

        // 드롭다운 텍스트 업데이트
        const homeKindButton = document.getElementById('homeKindButton');
        homeKindButton.innerHTML = `${selectedHomeKind} <span class="dropdown-icon"></span>`;
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
    selectedAddress = address === '전체' ? '' : address.trim();

    // 버튼 스타일 업데이트
    document.querySelectorAll('.box#box1 .scroll-button').forEach(button => {
        button.classList.toggle('selected', button.textContent.trim() === address);
    });

    // 드롭다운 버튼 텍스트 업데이트
    const dropdownButton = document.getElementById('dropdownButton');
    dropdownButton.innerHTML = selectedAddress
        ? `${selectedAddress} <span class="dropdown-icon"></span>`
        : `전체 <span class="dropdown-icon"></span>`;

    updateURL();
}

// 주택 유형 업데이트
function setHomeKind(homeKind) {
    selectedHomeKind = homeKind === '전체' ? '' : homeKind.trim();

    // 버튼 스타일 업데이트
    document.querySelectorAll('.box#box2 .scroll-button').forEach(button => {
        button.classList.toggle('selected', button.textContent.trim() === homeKind);
    });

    // 드롭다운 버튼 텍스트 업데이트
    const homeKindButton = document.getElementById('homeKindButton');
    homeKindButton.innerHTML = selectedHomeKind
        ? `${selectedHomeKind} <span class="dropdown-icon"></span>`
        : `전체 <span class="dropdown-icon"></span>`;

    updateURL();
}

// URL 업데이트
function updateURL() {
    const encodedAddress = encodeURIComponent(selectedAddress || '');
    const encodedHomeKind = encodeURIComponent(selectedHomeKind || '');
    const encodedRecruit = encodeURIComponent(recruit || '');
    const timestamp = Date.now(); // 캐싱 방지

    // URL 생성
    const url = `/home?address=${encodedAddress}&homeKind=${encodedHomeKind}&recruit=${encodedRecruit}&t=${timestamp}`;

    // 페이지를 새 URL로 리디렉션
    window.location.href = url;
}
