window.onload = function() {

	var productReturnElement = document.getElementById('productReturn');

	new Chart(productReturnElement, {
		type: 'line',
		data: {
			labels: ['1개월', '3개월', '1년', '누적수익률'],
			datasets: [{
				label: '수익률(%)',
				data: [monthlyReturn, quarterlyReturn, annualReturn, totalReturn],
				fill: false,
				backgroundColor: 'rgba(255, 129, 25, 1)',
				borderColor: [
					'rgba(255, 129, 25, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
				],
				borderWidth: 2,
				tension: 0.1
			}]
		},
		options: {
			responsive: false,
			legend: {
				labels: {
					fontColor: "red",
					fontSize: 18
				}
			},
			scales: {
				y: [{
					ticks: {
						beginAtZero: false,
						min: -10,
						max: 50,
						stepSize: 5,
						fontColor: "rgba(251, 203, 9, 1)",
						fontSize: 18,
					},
					gridLines: {
						color: 'rgba(166, 201, 226, 1)',
						lineWidth: 3
					}
				}],
				xAxes: [{
					ticks: {
						fontColor: 'rgba(12, 13, 13, 1)',
						fontSize: 14
					},
					gridLines: {
						color: "rgba(87, 152, 23, 1)",
						lineWidth: 2
					}
				}]
			}
		}
	});
	}