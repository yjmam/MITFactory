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

<!-- ck에디터 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
<!-- ck에디터 -->

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
		<div class="col-lg-12 mb20">
			<div class="contact-form">
				<h1 class="contact-info-title">
					상품 수정
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
<!-- 	<div class="space-small"></div> -->
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
							<!-- 		<li><a href="/admin/dailyContractCount/"><img
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
	<div class="space-small"></div>
		<div class="content">
			<div class="col-12">
				<form action="/product/update/${productDTO.id}" method="post">
					<table class="table table-hover table-striped table-bordered">
						<tr>
							<td>상품명</td>
							<td><input type="text" name="productName" value="${productDTO.productName}" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td>위험등급</td>
							<td><select id="riskLevel" name="riskLevel" class="form-select">
									<option value="고위험">고위험</option>
									<option value="중위험">중위험</option>
									<option value="저위험">저위험</option>
									<option value="초저위험">초저위험</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>판매여부</td>
							<td><select id="productStatus" name="productStatus" class="form-select">
									<option value="판매중">판매중</option>
									<option value="판매중단">판매중단</option>
									</select>
							</td>
						</tr>
						<tr>
							<td>운용사</td>
							<td><input type="text" name="manageCompany" value="${productDTO.manageCompany}" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td>수수료</td>
							<td><input type="text" name="fee" value="${productDTO.fee}" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td>이율보증형 금리</td>
							<td><input type="text" name="rate"
								value="${productDTO.rate}" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td>상품 주요내용</td>
							<td><textarea id="editor" name='content'>${productDTO.content}</textarea>
						</tr>
							<input type="hidden" name="monthlyReturn" value="${productDTO.monthlyReturn}">
							<input type="hidden" name="querterlyReturn" value="${productDTO.querterlyReturn}">
							<input type="hidden" name="annualReturn" value="${productDTO.annualReturn}">
							<input type="hidden" name="totalReturn" value="${productDTO.totalReturn}">
						<tr>
							<td  style="text-align: center;" colspan="2"><button type="submit" class="btn btn-primary">저장하기</button></td>
							
						</tr>
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