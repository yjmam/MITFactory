<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


</head>
<body>
	<style>
/* 8/23일 수정_다인*/
#friend1111 {
	font-size: 14px; /* Increase font size */
	padding: 14px 12px;
	border: none; /* Remove border */
	font-weight: bold;
	/* Make the text bold /* Increase padding for both vertical and horizontal spacing */
}
</style>

	<input type="hidden" id="loggedInValue" value="${not empty logInRole}">
	<input type="hidden" id="noContract" value="${noContract}">
<!-- 	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
 -->
	<!-- header-start -->
	<div class="header-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-4 col-md-2 col-xs-12">
					<div class="logo">
						<a href="/"><img src="/resources/images/logo.png"
							class="img-responsive" alt=""></a>

					</div>
				</div>
				<div class="col-lg-8 col-md-10 col-sm-8 col-xs-12">
					<div class="navigation-wrapper">
						<div id="navigation">
							<ul>
								<li class="active"><a href="/" title="">Main</a></li>
								<li><a href="#" title="">IRP</a>
									<ul>
										<li><a href="/contract/join" title="">IRP가입하기</a></li>
										<li><a href="/contract/cancelContract" title="">IRP해지하기</a></li>
										<li><a href="/deposit/showdeposit" title="">IRP입금하기</a></li>
									</ul></li>
								<li><a href="" title="">상품</a>
									<ul>
										<li><a href="/product/productStorage" title="">상품공시실</a></li>
										<c:if test="${not empty logInRole}">
											<li><a href="/product/productChange" title="">상품변경</a></li>
										</c:if>
									</ul></li>

								<!-- 로그인 여부에 따라 메뉴 적용 -->

								<c:if test="${not empty logInRole}">
									<c:if test="${logInRole eq 'ROLE_ADMIN'}">
										<li><a href="#" title="">관리자페이지</a>
											<ul>
												<li><a href="/admin/product/1" title="">상품목록</a></li>
												<li><a href="/admin/productInsert" title="">상품등록</a></li>
												<li><a href="/admin/cancellation/1" title="">IRP해지
														승인</a></li>
												<li><a href="/admin/contractStatus/1" title="">계약현황</a></li>
											</ul></li>
									</c:if>
									<c:if test="${logInRole eq 'ROLE_USER'}">
										<li><a href="#" title="">마이페이지</a>
											<ul>
												<li><a href="/user/myInfo/${logInId}" title="">개인정보</a></li>
												<li><a href="/user/myProduct/${logInId}" title="">가입내역</a></li>
												<li><a href="/user/myContract/${logInId}" title="">증명서발급</a></li>
											</ul></li>
									</c:if>
									<li><a href="/user/logOut" title="">로그아웃</a>
								</c:if>
								<c:if test="${empty logInRole}">
									<li><a href="/user/logIn">로그인</a></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-2">
					<button id="friend1111" class="btn-success">친구에게 추천하기</button>
				</div>
			</div>
		</div>
	</div>

	<script src="/resources/js/header.js"></script>
</body>
</html>