// JSP���� JSON �����͸� �����ϰ� ��������
            const jsonData = ${jsonData}; // JSP���� ���޵� JSON ������ (���ڿ��� ����)
            console.log("JSON Data:", jsonData);
            const parsedData = jsonData;

            // ������ ó��
            const labels = parsedData.map(item => item.adress); // �ּҸ� �󺧷� ���
            const similarities = parsedData.map(item => item.similarity); // ���絵 ����

            console.log("Parsed Data: ", parsedData);
            console.log("Labels: ", labels);
            console.log("Similarities: ", similarities);

            // Chart.js�� ��Ʈ ����
            try {
                const ctx = document.getElementById('myChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels, // X�� ��
                        datasets: [{
                            label: '���絵 ����',
                            data: similarities, // Y�� ������
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true, // Y�� 0���� ����
                                max: 1.1 // �ִ밪 1.1�� ����
                            }
                        }
                    }
                });
            } catch (error) {
                console.error("Chart.js ������ �� ���� �߻�:", error);
            }