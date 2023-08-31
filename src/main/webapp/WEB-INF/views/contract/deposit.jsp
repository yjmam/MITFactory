<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
<meta name="keywords"
	content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
<title>M.IT IRP Factory</title>
<!-- Bootstrap -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="/resources/css/style2.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<!-- FontAwesome CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/fontello.css">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/css/owl.theme.default.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/deposit.js"></script>
</head>
<style>
.white-text {
	color: white;
	font-size: 16px;
}
/* Placeholder 글자색 변경 */
#amount::placeholder {
	color: white;
}

.image-container img {
	max-width: 100%; /* 이미지가 컨테이너 내에 가득 차도록 설정 */
	max-height: 100%; /* 이미지가 컨테이너 내에 가득 차도록 설정 */
	align-items: center;
	justify-content: center;
	display: flex;
	margin-left: 700px;
}

.content-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.centered-column {
	text-align: center; /* 가로 가운데 정렬을 위한 텍스트 정렬 설정 */
}
</style>
<body>

	<!-- header-start -->
	<%@include file="../header.jsp"%>
	<!-- header-close -->
	<!-- <div class="space-base"></div> -->


	<!-- form-start -->


	<c:if test="${empty contractDTO}">
		<script>
      Swal.fire({
         title: 'IRP 계약이 없으시군요!',
         text: '지금 IRP를 가입해보세요.',
         icon: 'warning',
         confirmButtonText: '가입하러 가기',
      }).then((result) => {
         if (result.isConfirmed) {
            window.location.href = "/contract/join";
         }
      });
   </script>
	</c:if>

	<div class="image-container text-center">
		<img src="/resources/images/deposit.jpg" alt="Deposit Image">
	</div>
	<div
		class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-1 col-sm-12 col-xs-12 text-center"
		style="margin: -50px auto; margin-left: 400px; max-width: 60%;">
		<div class="contact-form text-center"
			style="background-color: #0dab9e;">
			<div class="row centered-column">
				<div class="col-lg-3 col-md-6 col-sm-3">
					<div class="form-group">
						<label class="control-label sr-only " for="name"></label>
						<h4 class="white-text">
							<b>고객명: ${logInName}</b>
						</h4>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-3  text-center">
					<div class="form-group">
						<label class="control-label sr-only " for="policyNumber"></label>
						<h4 class="white-text">
							<b>증권번호: ${policyNumber}
						</h4>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-3  text-center">
					<div class="form-group">
						<label class="control-label sr-only " for="contractStatus"></label>
						<h4 class="white-text">
							<b>계약상태: ${contractStatus}
						</h4>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 text-center">
					<div class="form-group">
						<label class="control-label sr-only" for="setAmount"></label>
						<h4 class="white-text">
							<b>당사 가입한도: <span id="setAmount"
								data-setAmount=" ${setAmount}"><fmt:formatNumber
										value="${setAmount}" pattern="#,###원" /></span>
						</h4>
						<br> <br>
					</div>
				</div>

				<div class="col-lg-7 col-md-12 col-sm-12 col-xs-12">
					<div class="form-group"
						style="margin: 1px auto; margin-left: 90px;">
						<label class="control-label" for="amount" style="width: 30%;"></label>
						<div class="input-group"
							style="display: flex; align-items: center;">
							<input type="text" id="amount" class="form-control"
								placeholder="입금 금액을 입력하세요 (단위:원)">
							<button class="btn btn-primary btn-lg" onclick="checkAmount()">확인</button>
							<br />
						</div>
					</div>
				</div>

				<!--   <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12"> -->
				<!--  <button class="btn btn-primary btn-lg mt30"
                           onclick="checkAmount()">확인</button>
                     </div> -->
				<div class="col-lg-5 col-md-12 col-sm-5 col-xs-12">
					<button class="btn btn-primary btn-lg mt10"
						style="margin-right: 100px;" onclick="requestPay()">카카오
						결제하기</button>
				</div>
			</div>
		</div>
	</div>


	<script>
      function numberWithCommas(x) {
         return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }

      var amountInput = document.getElementById("amount");

      amountInput.addEventListener("input", function(event) {
         var value = event.target.value.replace(/,/g, ""); // Remove existing commas
         var formattedValue = numberWithCommas(value);
         event.target.value = formattedValue;
      });
   </script>
	<!-- form-close -->

	<div class="space-large"></div>
<!-- 8월31일 수정  -->
	<!-- footer start -->
	<%@include file="../footer.jsp"%>
	<!-- footer close -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>

</body>
</html>