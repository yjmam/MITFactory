<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
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


</head>
<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- 움직이는 구름 -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
	<!-- 움직이는구름끝 -->
	<div class="space-small"></div>

	<div class="container">
		<div class="col-lg-12 mb20">
			<div class="contact-form">
				<h1 class="contact-info-title">상품 비율 선택</h1>
			</div>
		</div>
	</div>

	<div class="space-small"></div>
	<div class="container">
		<form id="updateForm">
		
		<h2 class="custom-heading">
					  <img src="/resources/images/rating.png" alt="" style="width: 40px; height: 35px;">
					선택상품의 투자비율을 입력해주세요.</h2>
			<table class="responsive-table">
				<thead>
					<tr>
						<th scope="col">증권번호</th>						
						<th scope="col">상품명</th>
						<th scope="col">운용사</th>
						<th scope="col">수수료(%)</th>
						<th scope="col">위험등급</th>
						<th scope="col">수익률(%)</th>
						<th scope="col">적용이율(%)</th>
						<th scope="col">투자비율(%)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pickProdList}" var="pickProd">
						<tr>
							<td><input type="hidden" name="policyNumber"
								value="${pickProd.policyNumber}">${pickProd.policyNumber}</td>							
							<td><input type="hidden" name="productName"
								value="${pickProd.productName}">${pickProd.productName}</td>

							<td>${pickProd.manageCompany}</td>
							<td>${pickProd.fee}</td>
							<td>${pickProd.riskLevel}</td>
							<td>${pickProd.totalReturn}</td>
							<td>${pickProd.rate}</td>
							<td><input type="number"
								id="investRatio_${pickProd.productId}" name="investRatio"
								 placeholder =0 min="0" max="100" required /></td>
							<input type="hidden" name="productId" value="${pickProd.productId}">
						</tr>
					</c:forEach>

					<tr>
						<td colspan="7" style="text-align: center; font-weight: bold;">비율합계(%)</td>
						<td id="sumDisplay" style="font-weight: bold;">0</td>
					</tr>

				</tbody>
			</table>
			<div class="col-sm-10"></div>
               <div class="col-sm-2 mb30" style="text-align:right;">                    
         <button type="button" id="submitBtn" class="btn btn-primary">상품비율선택</button>
            </div>
		</form>
	</div>

	<div class="space-large"></div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.all.min.js"></script>
	<script src="/resources/js/pickprodForm.js"></script>

</body>
</html>