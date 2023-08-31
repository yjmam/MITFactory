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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-close -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>

	<div class="space-small"></div>

	<div class="container">

		<!-- form-start -->

		<div class="col-lg-12 mb20">
			<div class="contact-form">
				<h1 class="contact-info-title">회원 정보</h1>
			</div>
		</div>
		<!-- 가입자 정보 섹션 -->
		<div class="col-lg-12 mb20 contract-form">
			<div class="contact-form2">
				<table class="table table-bordered">
				
					<tr>
						<th>구분</th>
						<th>입력 정보</th>
					</tr>
					
					<tr>
						<td class="col-lg-3">성명</td>
						<td>${userDTO.name}</td>
					</tr>
					<tr>
						<td class="col-lg-3">생년월일</td>
						<td>${userDTO.birthYear}.${userDTO.birthMonth}.${userDTO.birthDay}</td>
					</tr>
					<tr>
						<td class="col-lg-3">아이디</td>
						<td>${userDTO.username}</td>
					</tr>
					<tr>
						<td class="col-lg-3">e-mail</td>
						<td>${userDTO.email}</td>
					</tr>
					<tr>
						<td class="col-lg-3">연락처</td>
						<td>${userDTO.tel}</td>
					</tr>
				</table>

				<!-- <button class="btn btn-primary" onclick="" style="margin-left: 30px;">정보수정</button> -->
			</div>
		</div>
	</div>


	<div class="space-small"></div>

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->

</body>
</html>