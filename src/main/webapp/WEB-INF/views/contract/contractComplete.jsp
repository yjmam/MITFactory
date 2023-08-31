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
	content="M.IT IRP Factory that can help you boost your business courses website and its completely free.">
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
<!-- 폭죽 -->
<script
	src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
<script src="/resources/js/lotteryScratch.js"></script> 
<script src="/resources/js/contractComplete.js"></script>
  
</head>
<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-end -->
	<!-- 움직이는 구름 -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
	<!-- 움직이는구름끝 -->
	<div class="space-small"></div>

	<!-- form-start -->
	<div class="container">
		<div class="col-lg-12 mb20">
			<div class="contact-form">
				<h1 class="contact-info-title">가입사항 및 청약서 확인</h1>
			</div>
		</div>
		<div class="space-medium"></div>
		<!-- 가입자 정보 섹션 -->
		<div class="col-lg-12 mb20 contract-form">
			<div class="contact-form2">
				<h2 class="contact-info-title3 mb40">${logInName}님 가입을 축하합니다.</h2>

				<div>
					<button type="button" class="col btn btn-primary"
						onclick="location.href='/user/myContract/${logInId}'">계약정보/증명서발급</button>
					<button type="button" class="col btn btn-primary"
						onclick="location.href='/'">Main</button>
				</div>
			</div>
		</div>
	</div>

	<div class="space-large"></div>

	<!-- footer-start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer-end -->

</body>
</html>