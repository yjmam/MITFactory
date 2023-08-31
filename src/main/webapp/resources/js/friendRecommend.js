$(document).ready(function() {
	var userId = "${userId}"; // 모델에서 전달한 userId 값 사용
	$("#sendSMSButton").on("click", function() {
		var friendphone = $("#friendphone").val();
		var userId = $("#userId").val();
		console.log(friendphone);
		console.log(userId);
		var text = "[MIT]<IRP가입추천URL> http://3.36.254.129:8080/user/recommendRegister/" + userId;
		console.log(text);

		$.ajax({
			type: "POST",
			url: "/user/friendSMS",
			data: {
				friendphone: friendphone,
				text: text
			},
			success: function(response) {
				Swal.fire({
					icon: 'success',
					title: '전송 성공',
					text: '메시지를 성공적으로 전송했습니다.'
				}).then(function() {
					// 전송이 성공하면 입력한 휴대폰 번호를 삭제
					document.getElementById("friendphone").value = "";
				});
			},
			error: function(error) {
				Swal.fire({
					icon: 'error',
					title: '전송 실패',
					text: '메시지 전송에 실패했습니다.'
				});
			}
		});
	});
});