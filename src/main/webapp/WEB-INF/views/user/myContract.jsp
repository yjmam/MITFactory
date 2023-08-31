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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/html2canvas.js"></script>
<script src="/resources/js/jspdf.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="/resources/js/savePdf.js"></script>

</head>

<body
	data-no-contract="<%=Boolean.TRUE.equals((Boolean) request.getAttribute("noContract"))%>">
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
		<button type="button" class="btn btn-primary" id="savePdf"
			data-policy-number="${contractDTO.policyNumber}"
			style="margin-left: 30px;">증명서출력</button>



		<!-- pdf저장구역 start-->

		<div id="pdfDiv">

			<!-- form-start -->
			<div class="container">
				<div class="col-lg-12 mb20">
					<div class="contact-form">
						<h1 class="contact-info-title">IRP가입증명서</h1>
					</div>
				</div>

				<div class="space-small"></div>

				<!-- 가입자 정보 섹션 -->
				<div class="col-lg-12 mb20 contract-form">
					<div class="contact-form2">
						<div class="contact-info-title4 mb20">■ 가입자 정보</div>

						<table class="table table-bordered">
							<tr>
								<th class="col-lg-3">성명</th>
								<td>${userDTO.name}</td>
							</tr>
							<tr>
								<th class="col-lg-3">생년월일</th>
								<td>${userDTO.birthYear}.${userDTO.birthMonth}.${userDTO.birthDay}</td>
							</tr>
						</table>

						<div class="contact-info-title4 mb20">■ IRP가입내역</div>
						<table class="table table-bordered">
							<tr>
								<th class="col-lg-3">증권번호</th>
								<td colspan="2">${contractDTO.policyNumber}</td>
							</tr>
							<tr>
								<th class="col-lg-3">가입상품</th>
								<td colspan="2">${contractDTO.contractType}</td>
							</tr>
							<tr>
								<th class="col-lg-3">가입금액</th>
								<td colspan="2"><fmt:formatNumber
										value="${contractDTO.setAmount}" type="number" pattern="#,###" />원</td>
							</tr>
							<tr>
								<th colspan="3" class="col-lg-3">자동이체정보</th>
							</tr>
							<tr>
								<th>은행명</th>
								<th>자동이체금액</th>
								<th>자동이체일자</th>
							</tr>
							<tr>
								<td>${accountDTO.bank}</td>

								<td><fmt:formatNumber value="${accountDTO.autoAmount}"
										type="number" pattern="#,###" />원</td>
								<td>${accountDTO.autoDate}일</td>
							</tr>
						</table>
						<br />
						<table class="table table-bordered">
							<tr>
								<th class="col-lg-3">자필서명</th>
								<td colspan="2"><img src=${contractDTO.confirm}></td>
							</tr>
						</table>

						<h2 class="contact-info-title3 mb20">
							<script>
								var currentDate = new Date();
								var year = currentDate.getFullYear();
								var month = currentDate.getMonth() + 1;
								var day = currentDate.getDate();
								document.write(year + "년 " + month + "월 " + day
										+ "일");
							</script>
						</h2>
						<div
							style="display: flex; justify-content: center; align-items: center; height: 150px;">
							<div style="display: flex; align-items: center;">
								<img src="/resources/images/mit2.png"
									style="width: 500px; height: 150px;">
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- pdf저장구역 end -->
	</div>

	<div class="space-small"></div>

	<footer>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</footer>
</body>
</html>