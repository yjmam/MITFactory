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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="/resources/js/jspdf.min.js"></script>
<script src="/resources/js/myProduct.js"></script>

</head>
<body data-no-contract="<%= Boolean.TRUE.equals((Boolean) request.getAttribute("noContract")) %>">
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

   <!-- form-start -->
   <div class="container">
      <div class="col-lg-12 mb20">
         <div class="contact-form">
            <h1 class="contact-info-title">IRP가입내역</h1>
         </div>
      </div>

      <!-- 가입내역 섹션 -->
      <div class="col-lg-12 mb20 contract-form">
         <div class="contact-form2">
            <div class="contact-info-title4 mb20">■ 계약사항</div>
            <table class="table table-bordered">
               <tr>
                  <th class="col-lg-6">증권번호</th>
                  <td colspan="2"><a href="/user/myContract/${logInId}">${contractDTO.policyNumber}</a></td>
               </tr>
               <tr>
                  <th class="col-lg-6">가입상품</th>
                  <td colspan="2">${contractDTO.contractType}</td>
               </tr>
               <tr>
                  <th class="col-lg-6">가입금액</th>                  
                  <td colspan="2"><fmt:formatNumber value="${contractDTO.setAmount}"
										type="number" pattern="#,###" />원</td>
               </tr>
            </table>
         </div>
      </div>

      <!-- 가입 상품 섹션 -->
      <div class="col-lg-12 mb20 contract-form">
         <div class="contact-form2">
            <div class="contact-info-title4 mb20">■ 가입상품</div>
            <table class="table table-bordered">
               <tr>
                  <th class="col-lg-3">선택상품</th>
                  <th class="col-lg-3">가입비중(%)</th>
               </tr>

               <c:forEach items="${pickProdList}" var="pickProd">
                  <tr>
                     <td>${pickProd.productName}</td>
                     <td>${pickProd.investRatio}</td>
                  </tr>
               </c:forEach>
            </table>
           <button type="button" onclick="location.href='/product/productChange';" class="btn btn-primary">상품변경하기</button> 
         </div>
      </div>


   </div>

   <div class="space-small"></div>

   <footer>
      <%@include file="/WEB-INF/views/footer.jsp"%>
   </footer>

</body>
</html>