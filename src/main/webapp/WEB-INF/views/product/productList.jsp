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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script src="/resources/js/productList.js"></script>

<!-- Bootstrap JS -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body data-step="${param.step}">
   <!-- header-start -->
   <%@include file="/WEB-INF/views/header.jsp"%>
   <div class="space-small"></div>
   <!-- 움직이는 구름 -->
   <div class="movewrap">
      <div>
         <div class="moving"></div>
      </div>
   </div>
   <!-- 움직이는구름끝 -->
   <div class="container">
      <div class="col-lg-12 mb20">
         <div class="contact-form">
            <h1 class="contact-info-title">상품목록 조회</h1>
         </div>
      </div>
   </div>
   <!--    <div class="space-small"></div> -->
   <!-- 상품검색 기능 -->
   <div class="container mt-4">
      <div class="active">
         <c:choose>
            <c:when test="${param.step eq 'simpleStep'}">
               <form action="/product/selectInvest/simple" method="get"
                  class="form-inline">
                  <input type="hidden" name="step" value="${param.step}">
                  <table class="responsive-table2">
                     <tr>
                        <td class="label-text">상품명</td>
                        <td><input type="text" name="search" id="srch"
                           class="form-control form-control-lg mr-2 search-input"
                           placeholder="상품명 검색" value="${param.search}"
                           style="width: 60%;"> <input type="submit"
                           class="btn btn-primary2" value="검색"></td>
                     </tr>
                  </table>
               </form>
            </c:when>
            <c:otherwise>
               <form action="/product/selectInvest" method="get"
                  class="form-inline">
                  <table class="responsive-table2">
                     <tr>
                        <td class="label-text">상품명</td>
                        <td><input type="text" name="search" id="srch"
                           class="form-control-lg mr-2 search-input" placeholder="상품명 검색"
                           value="${param.search}" style="width: 60%;"> <input
                           type="submit" class="btn btn-primary2" value="검색"></td>
                     </tr>
                  </table>
               </form>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
   <!-- 상품검색 기능 끝.-->

   <div class="container">
      <ul class="nav nav-tabs">
         <li class="active"><a data-toggle="tab" href="#productList">상품리스트</a></li>

         <c:choose>
            <c:when test="${param.step ne 'simpleStep'}">
               <li><a data-toggle="tab" href="#recommendedProducts">추천상품</a></li>
               <li><a data-toggle="tab" href="#topForRiskProducts">인기상품</a></li>
            </c:when>
         </c:choose>
      </ul>
      <form action="/product/selectInvest" method="post">
         <input type="hidden" name="step" value="${param.step}">
         <div class="tab-content">
            <div id="productList" class="tab-pane fade in active">
            
            <h2 class="custom-heading" style="margin-top:40px;">
                 <img src="/resources/images/search.jpg" alt="" style="width: 4%; height: 30px;">
               전체 상품목록 </h2>
                           
               <div style='text-align: right;'>기준일자: ${today}</div>
               <table class="responsive-table">
                  <thead>
                     <tr>
                        <th scope="col">선택</th>
                        <th scope="col">상품명</th>
                        <th scope="col">운용사</th>
                        <th scope="col">수수료(%)</th>
                        <th scope="col">위험등급</th>
                        <th scope="col">적용이율(%)</th>
                        <th scope="col">수익률(%)</th>
                        <th scope="col">상품설명</th>
                     </tr>
                  </thead>
                  <tbody>

                     <c:if test="${empty productList}">
                        <div class="alert-info">- 검색결과가 없습니다. -</div>
                     </c:if>

                     <c:if test="${not empty productList}">
                        <c:forEach items="${productList}" var="product">
                           <tr>
                              <td class="productCheckbox"><c:choose>
                                    <c:when test="${param.step eq 'simple'}">
                                       <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                       <input type="checkbox" name="selectedProducts"
                                          onclick="handleCheckbox(this);" value="${product.id}">
                                    </c:when>
                                    <c:otherwise>
                                       <!-- 일반운용 시 -->
                                       <input type="checkbox" name="selectedProducts"
                                          value="${product.id}" onclick="handleCheckbox(this)">
                                    </c:otherwise>
                                 </c:choose></td>
                              <td>${product.productName}</td>
                              <td>${product.manageCompany}</td>
                              <td>${product.fee}</td>
                              <td>${product.riskLevel}</td>
                              <td>${product.rate}</td>
                              <td>${product.totalReturn}</td>
                              <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;text-overflow: ellipsis;">${product.content}</td>
                           </tr>
                        </c:forEach>
                     </c:if>
                  </tbody>
               </table>
            </div>

            <div id="recommendedProducts" class="tab-pane fade">

               <h2 class="custom-heading" style="margin-top:40px;">
                 <img src="/resources/images/listIcon.png" alt="" style="width: 5%; height: 30px;">
               수익률 상위 5개 상품</h2>
               <div>고객님의 위험등급에 맞는 수익률 Best5 상품을 추천드려요. </div>
               <div style='text-align: right;'>기준일자: ${today}</div>
               <table class="responsive-table">
                  <thead>
                     <tr>
                        <th scope="col">선택</th>
                        <th scope="col">상품명</th>
                        <th scope="col">운용사</th>
                        <th scope="col">수수료(%)</th>
                        <th scope="col">위험등급</th>
                        <th scope="col">적용이율(%)</th>
                        <th scope="col">수익률(%)</th>
                        <th scope="col">상품설명</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${topReturnProductList}" var="product">
                        <tr>
                           <td class="productCheckbox"><c:choose>
                                 <c:when test="${param.step eq 'simple'}">
                                    <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                    <input type="checkbox" name="selectedProducts"
                                       onclick="handleCheckbox(this);" value="${product.id}">

                                 </c:when>
                                 <c:otherwise>
                                    <!-- 일반운용 시 -->
                                    <input type="checkbox" name="selectedProducts"
                                       value="${product.id}" onclick="handleCheckbox(this)">
                                 </c:otherwise>
                              </c:choose></td>
                           <td>${product.productName}</td>
                           <td>${product.manageCompany}</td>
                           <td>${product.fee}</td>
                           <td>${product.riskLevel}</td>
                           <td>${product.rate}</td>
                           <td>${product.totalReturn}</td>
                           <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;height:auto'">${product.content}</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>

            <div id="topForRiskProducts" class="tab-pane fade">
            <h2 class="custom-heading" style="margin-top:40px;">      
             <img src="/resources/images/bestIcon.png" alt="" style="width: 5%; height: 30px;">
               위험등급별 BEST상품</h2>
               
               <c:if test="${not empty topHighRiskProducts}">
                  <h3 class="sub-heading" style="margin-top:20px;">고위험 Top3</h3>
                  <div style='text-align: right;'>기준일자: ${today}</div>
                  <table class="responsive-table">
                     <thead>
                        <tr>
                           <th scope="col">선택</th>
                           <th scope="col">상품명</th>
                           <th scope="col">운용사</th>
                           <th scope="col">수수료(%)</th>
                           <th scope="col">위험등급</th>
                           <th scope="col">적용이율(%)</th>
                           <th scope="col">수익률(%)</th>
                           <th scope="col">상품설명</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${topHighRiskProducts}" var="product">
                           <tr>
                              <td class="productCheckbox"><c:choose>
                                    <c:when test="${param.step eq 'simple'}">
                                       <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                       <input type="checkbox" name="selectedProducts"
                                          onclick="handleCheckbox(this);" value="${product.id}">

                                    </c:when>
                                    <c:otherwise>
                                       <!-- 일반운용 시 -->
                                       <input type="checkbox" name="selectedProducts"
                                          value="${product.id}" onclick="handleCheckbox(this)">
                                    </c:otherwise>
                                 </c:choose></td>
                              <td>${product.productName}</td>
                              <td>${product.manageCompany}</td>
                              <td>${product.fee}</td>
                              <td>${product.riskLevel}</td>
                              <td>${product.rate}</td>
                              <td>${product.totalReturn}</td>
                              <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;height:auto'">${product.content}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </c:if>

               <c:if test="${not empty topMediumRiskProducts}">
                  <h3 class="sub-heading" style="margin-top:20px;">중위험 Top3</h3>
                  <div style='text-align: right;'>기준일자: ${today}</div>
                  <table class="responsive-table">
                     <thead>
                        <tr>
                           <th scope="col">선택</th>
                           <th scope="col">상품명</th>
                           <th scope="col">운용사</th>
                           <th scope="col">수수료(%)</th>
                           <th scope="col">위험등급</th>
                           <th scope="col">적용이율(%)</th>
                           <th scope="col">수익률(%)</th>
                           <th scope="col">상품설명</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${topMediumRiskProducts}" var="product">
                           <tr>
                              <td class="productCheckbox"><c:choose>
                                    <c:when test="${param.step eq 'simple'}">
                                       <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                       <input type="checkbox" name="selectedProducts"
                                          onclick="handleCheckbox(this);" value="${product.id}">

                                    </c:when>
                                    <c:otherwise>
                                       <!-- 일반운용 시 -->
                                       <input type="checkbox" name="selectedProducts"
                                          value="${product.id}" onclick="handleCheckbox(this)">
                                    </c:otherwise>
                                 </c:choose></td>
                              <td>${product.productName}</td>
                              <td>${product.manageCompany}</td>
                              <td>${product.fee}</td>
                              <td>${product.riskLevel}</td>
                              <td>${product.rate}</td>
                              <td>${product.totalReturn}</td>
                              <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;height:auto'">${product.content}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </c:if>

               <c:if test="${not empty topLowRiskProducts}">
                  <h3 class="sub-heading" style="margin-top:20px;">저위험 Top3</h3>
                  <div style='text-align: right;'>기준일자: ${today}</div>
                  <table class="responsive-table">
                     <thead>
                        <tr>
                           <th scope="col">선택</th>
                           <th scope="col">상품명</th>
                           <th scope="col">운용사</th>
                           <th scope="col">수수료(%)</th>
                           <th scope="col">위험등급</th>
                           <th scope="col">적용이율(%)</th>
                           <th scope="col">수익률(%)</th>
                           <th scope="col">상품설명</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${topLowRiskProducts}" var="product">
                           <tr>
                              <td class="productCheckbox"><c:choose>
                                    <c:when test="${param.step eq 'simple'}">
                                       <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                       <input type="checkbox" name="selectedProducts"
                                          onclick="handleCheckbox(this);" value="${product.id}">

                                    </c:when>
                                    <c:otherwise>
                                       <!-- 일반운용 시 -->
                                       <input type="checkbox" name="selectedProducts"
                                          value="${product.id}" onclick="handleCheckbox(this)">
                                    </c:otherwise>
                                 </c:choose></td>
                              <td>${product.productName}</td>
                              <td>${product.manageCompany}</td>
                              <td>${product.fee}</td>
                              <td>${product.riskLevel}</td>
                              <td>${product.rate}</td>
                              <td>${product.totalReturn}</td>
                              <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;height:auto'">${product.content}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </c:if>
               
               <c:if test="${not empty topveryLowRiskProducts}">
                  <h3 class="sub-heading" style="margin-top:20px;">초저위험 Top3</h3>
                  <div style='text-align: right;'>기준일자: ${today}</div>
                  <table class="responsive-table">
                     <thead>
                        <tr>
                           <th scope="col">선택</th>
                           <th scope="col">상품명</th>
                           <th scope="col">운용사</th>
                           <th scope="col">수수료(%)</th>
                           <th scope="col">위험등급</th>
                           <th scope="col">적용이율(%)</th>
                           <th scope="col">수익률(%)</th>
                           <th scope="col">상품설명</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${topveryLowRiskProducts}" var="product">
                           <tr>
                              <td class="productCheckbox"><c:choose>
                                    <c:when test="${param.step eq 'simple'}">
                                       <!-- 간편운용 시 js 1개만선택되도록 반영 -->
                                       <input type="checkbox" name="selectedProducts"
                                          onclick="handleCheckbox(this);" value="${product.id}">

                                    </c:when>
                                    <c:otherwise>
                                       <!-- 일반운용 시 -->
                                       <input type="checkbox" name="selectedProducts"
                                          value="${product.id}" onclick="handleCheckbox(this)">
                                    </c:otherwise>
                                 </c:choose></td>
                              <td>${product.productName}</td>
                              <td>${product.manageCompany}</td>
                              <td>${product.fee}</td>
                              <td>${product.riskLevel}</td>
                              <td>${product.rate}</td>
                              <td>${product.totalReturn}</td>
                              <td style="text-align: left; table-layout:fixed; width:30%; word-break:break-all;height:auto'">${product.content}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </c:if>

            </div>
         </div>
         <div class="col-sm-10"></div>
         <div class="col-sm-2 mb30" style="text-align: right;">
            <input type="submit" id="submitBtn" class="btn btn-primary"
               value="상품선택">
         </div>
      </form>
   </div>
</body>

<div class="space-small"></div>

<%@include file="/WEB-INF/views/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>

</html>