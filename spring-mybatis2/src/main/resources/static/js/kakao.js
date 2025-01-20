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