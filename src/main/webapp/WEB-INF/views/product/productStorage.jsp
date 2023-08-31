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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-end -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>


	<div class="space-small"></div>

	<div class="container">
		<!-- <div class="col-lg-12 mb20"> -->
		<div class="contact-form">
			<h1 class="contact-info-title">상품 조회</h1>
		</div>
	</div>
	<!--    </div> -->

	<!-- 상품검색 기능 -->
	<div class="container mt-4">
		<div class="active">
			<form action="/product/productStorage" method="get"
				class="form-inline">
				<table class="responsive-table2">
					<tr>
						<td class="label-text">상품명</td>
						<td><input type="text" name="search" id="srch"
							class="form-control search-input" placeholder="상품명 검색"
							value="${param.search}" style="width: 60%;"> <input
							type="submit" class="btn btn-primary2" value="검색"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 상품검색 기능 끝.-->


	<div class="container">
		<div id="css_tabs">
			<input id="tab1" type="radio" name="tab" checked="checked" /> <input
				id="tab2" type="radio" name="tab" /> <input id="tab3" type="radio"
				name="tab" /> <input id="tab4" type="radio" name="tab" /> <input
				id="tab5" type="radio" name="tab" /> <label for="tab1">고위험</label>
			<label for="tab2">중위험</label> <label for="tab3">저위험</label> <label
				for="tab4">초저위험</label> <label for="tab5">Best Choice</label>

			<div class="tab1_content">
				<h3 class="sub-heading">고위험 상품</h3>
				<h4 class="sub-heading">- 고위험 자산은 주식,상품,파생상품 및 이와 유사한 수준의 위험을
					갖는 자산을 말합니다.</h4>
				<br>
				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">상품명</th>
							<th scope="col">운용사</th>
							<th scope="col">위험등급</th>
							<th scope="col">수수료(%)</th>
							<th scope="col">총 수익률(%)</th>
						</tr>
					</thead>

					<tbody>
						<!-- 검색결과가 있는 경우 -->
						<c:if test="${not empty productList}">
							<c:forEach items="${productList}" var="product">
								<tr>
									<td><a href="/product/productDetail/${product.id}">${product.productName}</a></td>
									<td>${product.manageCompany}</td>
									<td>${product.riskLevel}</td>
									<td>${product.fee}</td>
									<td>${product.totalReturn}</td>
								</tr>
							</c:forEach>
						</c:if>

						<c:if test="${empty productList}">
							<!-- 검색어는 있고, 결과가 없는 경우 -->
							<c:if test="${not empty param.search}">
								<tr>
									<td colspan="5" class="alert-info">검색 결과가 없습니다.</td>
								</tr>
							</c:if>

							<!-- 검색어가 없는 경우(기본리스트) -->
							<c:if test="${empty param.search && empty productList}">
								<c:forEach items="${highRiskProducts}" var="product">
									<tr>
										<td><a href="/product/productDetail/${product.id}">${product.productName}</a></td>
										<%-- <td>${product.productName}</td> --%>
										<td>${product.manageCompany}</td>
										<td>${product.riskLevel}</td>
										<td>${product.fee}</td>
										<td>${product.totalReturn}</td>
									</tr>
								</c:forEach>
							</c:if>
						</c:if>
					</tbody>
				</table>

			</div>
			<div class="tab2_content">
				<h3 class="sub-heading">중위험 상품</h3>
				<h4 class="sub-heading">- 중위험 자산은 채권,CP, 담보부 대출 및 대출채권 및 이와 유사한
					수준의 위험을 갖는 자산을 말합니다.</h4>
				<br>
				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">상품명</th>
							<th scope="col">운용사</th>
							<th scope="col">위험등급</th>
							<th scope="col">수수료(%)</th>
							<th scope="col">총 수익률(%)</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${mediumRiskProducts}" var="product">
							<tr>
								<td><a href="/product/productDetail/${product.id}">${product.productName}</a></td>
								<td>${product.manageCompany}</td>
								<td>${product.riskLevel}</td>
								<td>${product.fee}</td>
								<td>${product.totalReturn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab3_content">
				<h3 class="sub-heading">저위험 상품</h3>
				<h4 class="sub-heading">- 저위험 자산은 국공채,지방채,회사채,현금성 자산 및 이와 유사한 수준의 위험을 갖는 자산을 말합니다.</h4>
				<br>
				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">상품명</th>
							<th scope="col">운용사</th>
							<th scope="col">위험등급</th>
							<th scope="col">수수료(%)</th>
							<th scope="col">총 수익률(%)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lowRiskProducts}" var="product">
							<tr>
								<td><a href="/product/productDetail/${product.id}">${product.productName}</a></td>
								<td>${product.manageCompany}</td>
								<td>${product.riskLevel}</td>
								<td>${product.fee}</td>
								<td>${product.totalReturn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab4_content">
				<h3 class="sub-heading">초저위험 상품</h3>
				<h4 class="sub-heading">- 초저위험은 원리금 보장형 상품을 말합니다.</h4>
				<br>
				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">상품명</th>
							<th scope="col">운용사</th>
							<th scope="col">수수료(%)</th>
							<th scope="col">위험등급</th>
							<th scope="col">총 수익률(%)</th>
							<th scope="col">적용이율()</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${rateProducts}" var="product">
							<tr>
								<td>${product.productName}</td>
								<td>${product.manageCompany}</td>
								<td>${product.fee}</td>
								<td>${product.riskLevel}</td>
								<td>${product.totalReturn}</td>
								<td>${product.rate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="tab5_content">
				<br />			
				<h3 class="sub-heading">
					  <img src="/resources/images/bestIcon.png" alt="" style="width: 6%; height: 35px;">
					고객님의 BestChoice 상품</h3>
				<div>
					<canvas id="pickProd" style="width: 600px"></canvas>
				</div>

			</div>

		</div>
	</div>


	<div class="space-medium"></div>

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script src="/resources/js/pickcount.js"></script>

</body>
</html>