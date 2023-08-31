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
<link href="/resources/css/style3.css" rel="stylesheet">
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
<!-- <script src="/resources/js/productChange.js"></script> -->

</head>

<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-close -->

	<!-- 움직이는 구름 -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
	<!-- 움직이는구름끝 -->

	<c:if test="${empty contractDTO}">
		<script>
    	var isContractDTOPresent = ${not empty contractDTO};
	</script>
	</c:if>

	<c:if test="${not empty contractDTO}">
		<div class="space-small"></div>
		<!-- form-start -->
		<div class="container">
			<div class="col-lg-12 mb20">
				<div class="contact-form">
					<h1 class="contact-info-title">펀드변경 기본정보 확인</h1>
				</div>
			</div>


			<div class="col-lg-6 mb20">
				<div class="contact-form2">
					<h1 class="contact-info-title2 mb40">가입자 정보</h1>
					<div class="row">
						<div class="col-lg-12">
							<h1 class="contact-title2"></h1>
						</div>
						<div class="col-lg-12">
							<h1 class="contact-title2">성명 :</h1>
							<div class="col-lg-12">
								<div class="box-table2">${contractDTO.name}</div>
							</div>
							<h1 class="contact-title2">증권번호 :</h1>
							<div class="col-lg-12 mb10">
								<div class="box-table2">${contractDTO.policyNumber}</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 mb20">
				<div class="contact-form2">
					<h1 class="contact-info-title2 mb30">펀드변경 선택</h1>
					<div class="row">
						<div class="form-group2">
							<div class="form-check">
								<div class="box-table3">
									<h1 class="contact-title2 mb17">
										<input class="form-check-input" type="radio" name="step"
											id="investStep" checked> 투자성향분석
									</h1>
									<p class="contact-sub2">새롭게 고객 투자성향정보를 등록합니다.</p>
								</div>
								<br />
								<div class="box-table3">
									<h1 class="contact-title2 mb17">
										<input class="form-check-input" type="radio" name="step"
											id="reuseStep"> 투자성향분석 재사용
									</h1>
									<p class="contact-sub2">기존에 작성하신 투자성향 결과를 사용합니다.</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-12">
				<div class="contact-form2">
					<div class="row">
						<div class="form-group2">
							<div class="form-check">
								<h3 class="contact-info-title2" style="margin-bottom:25px;">${contractDTO.name}&nbsp; 고객님의
									상품현황</h3>
								<table class="responsive-table">
									<thead>
										<tr class="responsive-table">
											<th scope="col-5">상품명</th>
											<th scope="col-2">비중(%)</th>
											<th scope="col-5">적립금</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${pickProdList}" var="item">
											<tr>
												<td>${item.productName}</td>
												<td>${item.investRatio}%</td>
												<td><fmt:formatNumber value="${item.reserves}"
														type="number" pattern="#,###" />원</td>

											</tr>
										</c:forEach>
									</tbody>

								</table>


							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-10"></div>
			<div class="col-sm-2 mb30" style="text-align: right;">
				<div class="space-small"></div>
				<button class="btn btn-primary" onclick="changeNextPage()">Next
					Page</button>
			</div>
			<!-- 변경0804 -->
		</div>

	</c:if>
	<input type="hidden" id="userId" value="${contractDTO.userId}">
	<!-- form-close -->

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- 	<script src="/resources/js/jquery.min.js" type="text/javascript"></script> -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<!-- 	<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/js/menumaker.js" type="text/javascript"></script> -->
	<script src="/resources/js/productChangeStep1.js"></script>

</body>
</html>