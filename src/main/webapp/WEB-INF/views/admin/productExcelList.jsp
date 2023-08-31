<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
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

	<div class="space-small"></div>

	<div class="container">
		<div class="col-lg-12">
			<div class="contact-form">
				<h1 class="contact-info-title">
					업로드 상품목록
					<ul class="navbar-nav">
						<!-- 햄버거 버튼 -->
						<li class="ham-btn"><a class="menu-trigger" href="#"> <span></span>
								<span></span> <span></span>
						</a></li>
					</ul>
				</h1>
			</div>
		</div>
	</div>

	<!-- <div class="space-small"></div> -->

	<div class="container">
		<header>
			<!-- 햄버거 메뉴 시작 -->
			<div class="ham-con">
				<div id="ham-menu-wrap">
					<div class="ham-menu mt-5">
						<ul class="ham-top-menu">
							<li><i class="bi bi-caret-down-fill"></i></a>
								<ul class="ham-sub-menu">
									<li><a href="/"><img
											src="/resources/images/adminMenuList.png"
											style="max-width: 35px; height: auto;"> HOME </a></li>
									<li><a href="/admin/product/1"><img
											src="/resources/images/product.png"
											style="max-width: 35px; height: auto;"> 상품목록/수정</a></li>
									<li><a href="/admin/productInsert"><img
											src="/resources/images/productInsert.png"
											style="max-width: 35px; height: auto;"> 상품추가</a></li>
									<li><a href="/admin/cancellation/1"><img
											src="/resources/images/contractCancel.png"
											style="max-width: 35px; height: auto;"> IRP해지승인</a></li>
						<!-- 			<li><a href="/admin/dailyContractCount/"><img
											src="/resources/images/graph2.png"
											style="max-width: 35px; height: auto;"> 일별 가입현황</a></li> -->
							<!-- 		<li><a href="/admin/pickProductCount/"><img
											src="/resources/images/graph1.png"
											style="max-width: 35px; height: auto;"> 상품별 가입현황</a></li> -->
									<li><a href="/admin/contractStatus/1"><img
											src="/resources/images/adminContract.png"
											style="max-width: 35px; height: auto;"> 고객 계약현황</a></li>

								</ul></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 햄버거 메뉴 끝 -->
		</header>
<div class="container">
			<div class="col-10">
				<form method="post" action="/product/excelUpdateInsert">
					<table class="responsive-table">
						<thead>
							<tr>
								<th class="col-1">상품명</th>
								<th class="col-1">위험등급</th>
								<th class="col-1">판매상태</th>
								<th class="col-1">운용사</th>
								<th class="col-1">수수료</th>
								<th class="col-1">이율보증형 금리</th>
								<th class="col">상품 주요내용</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="item" varStatus="status">
								<tr>
									<td><input
										name="productWrapperList[${status.index }].productName"
										value="${item.productName }" type="text" style="max-width: 120px; height: auto; text-align: center; border: none;"></td>
									<td><input
										name="productWrapperList[${status.index }].riskLevel"
										value="${item.riskLevel }" type="text" style="max-width: 120px; height: auto; text-align: center; border: none;" ></td>
									<td><input
										name="productWrapperList[${status.index }].productStatus"
										value="${item.productStatus}" style="max-width: 120px; height: auto; text-align: center; border: none;"></td>
									<td><input
										name="productWrapperList[${status.index }].manageCompany"
										value="${item.manageCompany}" style="max-width: 120px; height: auto; text-align: center; border: none;"></td>
									<td><input
										name="productWrapperList[${status.index }].fee" value="${item.fee}" style="max-width: 120px; height: auto; text-align: center; border: none;"></td>
									<td><input
										name="productWrapperList[${status.index }].rate" value="${item.rate}" style="max-width: 120px; height: auto; text-align: center; border: none;"></td>
									<td><input
										name="productWrapperList[${status.index }].content"
										value="${item.content}" style=" border: none;"></td>
								</tr>

							</c:forEach>
							<tr>
								<td colspan="7" style="text-align: center;">
									<button type="submit" class="btn btn-primary">저장하기</button>&nbsp;&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

</div>
	<div class="space-small"></div>

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
 <script type= "text/javascript"  src="/resources/javascript/admin.js" charset="utf-8"></script>   
 <script type= "text/javascript"  src="/resources/js/admin.js" charset="utf-8"></script>   
</body>
</html>