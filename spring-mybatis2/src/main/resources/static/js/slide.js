//동적 슬라이드를 위한 자바 스크립트
document.getElementById("slideToggleButton").addEventListener("click", function () {
    const panel = document.getElementById("slidingPanel");
    panel.classList.toggle("active");

    // 버튼 아이콘 변경 (❮ ↔ ❯)
    this.textContent = panel.classList.contains("active") ? "❮" : "❯";
});