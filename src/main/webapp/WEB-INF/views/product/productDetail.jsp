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
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<!-- 		<div class="col-lg-12 mb20"> -->
			<div class="contact-form">
				<h1 class="contact-info-title">상품 상세조회</h1>
			</div>
		</div>
	

	<div class="container">
		<div class="col-lg-12 mb30">
					<h2 class="custom-heading" style="margin-top:50px;" >					
					  <img src="/resources/images/bestIcon.png" alt="" style="width: 5%; height: 35px;">
					상품정보 </h2>
			<table class="responsive-table">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">상품명</th>
						<th scope="col" style="text-align: center;">운용사</th>
						<th scope="col" style="text-align: center;">수수료</th>
						<th scope="col" style="text-align: center;">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">${productDTO.productName}</td>
						<td style="text-align: center;">${productDTO.manageCompany}</td>
						<td style="text-align: center;">${productDTO.fee}</td>
						<td style="text-align: left; table-layout:fixed; width:50%; word-break:break-all;height:auto'">${productDTO.content}</td> 
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="col-lg-12 mb30">					
			<h2 class="custom-heading">
					  <img src="/resources/images/listIcon.png" alt="" style="width: 5%; height: 35px;">
					상품 수익률 </h2>
			<table class="responsive-table">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">1개월수익률</th>
						<th scope="col" style="text-align: center;">3개월수익률</th>
						<th scope="col" style="text-align: center;">1년수익률</th>
						<th scope="col" style="text-align: center;">누적수익률</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center;">${productDTO.monthlyReturn}%</td>
						<td style="text-align: center;">${productDTO.querterlyReturn}
							%</td>
						<td style="text-align: center;">${productDTO.annualReturn}%</td>
						<td style="text-align: center; color:red; font-weight: bold;">${productDTO.totalReturn}%</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div style="display: flex; justify-content: center;">
		<canvas id="productReturn" width="700" height="300"></canvas>
	</div>
	<script>
    var monthlyReturn = ${productDTO.monthlyReturn};
    var quarterlyReturn = ${productDTO.querterlyReturn};
    var annualReturn = ${productDTO.annualReturn};
    var totalReturn = ${productDTO.totalReturn};
    console.log("3개월수익률:", quarterlyReturn);
    console.log("연수익률:", annualReturn);
    console.log("누적수익률:", totalReturn);
</script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="/resources/js/productDetail.js"></script>


	<div class="space-small"></div>

	<footer>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</footer>
</body>
</html>