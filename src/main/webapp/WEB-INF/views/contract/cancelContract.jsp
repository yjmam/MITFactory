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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>

</head>

<body>
<!-- 테스트야  -->
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
      <div class="col-lg-12 mb20">
         <div class="contact-form">
            <h1 class="contact-info-title">IRP 해지</h1>
         </div>
      </div>
   </div>

   <div class="space-base"></div>
   <div class="container">
      <div class="content">
         <div class="col-12">

            <c:if test="${not empty contractDTO}">
               <h3 class="sub-heading">계약사항</h3>
               <table class="responsive-table">
                  <thead>
                     <tr style="text-align: center;">
                        <th scope="col-2"></th>
                        <th scope="col-3">증권번호</th>
                        <th scope="col-3">고객명</th>
                        <th scope="col-2">계약상태</th>
                        <th scope="col-2">한도</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><input type="checkbox"></td>
                        <td>${contractDTO.policyNumber}</td>
                        <td>${contractDTO.name}</td>
                        <td>${contractDTO.contractStatus}</td>
                        <td><fmt:formatNumber value="${contractDTO.setAmount}"
                              type="number" pattern="#,###" />원</td>
                     </tr>
                  </tbody>
               </table>
         </div>
         <div class="space-base"></div>

         <c:if test="${not empty depositDTO}">
            <div class="col-12">

               <h3 class="sub-heading">계좌번호</h3>
               <table class="responsive-table">
                  <thead>
                     <tr style="text-align: center;">
                        <th scope="col-2">은행명</th>
                        <th scope="col">계좌번호</th>
                        <th scope="col-3">계좌확인</th>
                        <th scope="col-2">예금주</th>
                     </tr>
                  </thead>

                  <tbody>
                     <tr>
                        <td>${accountDTO.bank}</td>
                        <td>${accountDTO.bankAccount}</td>
                        <td>
                           <button class="ownerButton btn btn-primary">예금주조회</button>
                        </td>
                        <td style="text-align: center;" class="contractNameCell"></td>
                     </tr>
                  </tbody>

               </table>
            </div>
         </c:if>

         <div class="space-base"></div>
         <div class="col-12">
            <h3 class="sub-heading">상품 내역</h3>
            <table class="responsive-table">
               <thead>
                  <tr style="text-align: center;">
                     <th scope="col-8">상품명</th>
                     <th scope="col-2">비중(%)</th>
                     <th scope="col-2">잔액</th>
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

         <div class="space-small"></div>

         <div style="text-align: center;">
            <button data-toggle="modal" data-target="#noticeModal"
               class="btn btn-primary">해지신청</button>
         </div>

         <div class="modal" id="noticeModal">
            <div class="modal-dialog modal-dialog-center  modal-lg">
               <div class="modal-content">

                  <div class="modal-header">
                     <h4 class="modal-title">해지 주요안내사항</h4>
                  </div>
                  <!-- Modal body -->
                  <div class="modal-body">

                     <div align="left"
                        style="margin-left: 30px; overflow-y: scroll; overflow-x: hidden; width: 850px; height: 500px">
                        ◎ IRP해지 신청에 따른 일시금 지급 시 소득원천에 따라 세제가 달리 적용됩니다. </br>사용자부담금(퇴직금)에 대해서는
                        퇴직소득세가 부과되어 분류과세로 원천징수 되며, 가입자부담금(추가부담금)중 </br> <span
                           class="desc td01">세액공제를 받은 부담금과 운용수익에 대해서는 기타소득세(16.5%,
                           지방소득세포험, 분리과제)가 적용되며</span></br> 세액공제 한도를 초과하여 납입한 부담금에 대해서는 과세되지 않습니다.</br> </br>
                        ◎반면, IRP적립금을 "연금"으로 수령할 경우 사용자부담금(퇴직금)은 연금소득세가 적용되어 퇴직소득세의 </br>60~70%를
                        납부하게되고, 가입자부담금(추가부담금) 중 세액공제 받은 납입금 및 운용수익에 대해서는 수령 연령별</br>연금소득세
                        (70세미만 5.5%, 70세이상 80세미만 4.4%, 80세이상 3.3%)가 적용됩니다. </br> 단 세액공제 받은
                        근로자 납입금,연금저축 및 해당 운용수익을 통한 연금소득이 연간 1200만원을 초과할 경우</br> 종합소득으로 합산되어
                        과세되므로 세부담이 증가할 수 있습니다.</br> </br>◎ 다만, 연금소득세의 적용은 연금수령한도 내의 경우에 한합니다.</br>
                        (연금수령한도 : 연금계좌의 평가액÷(11-연금수령연차)X1.2)</br> </br> ◎ 지인(친구, 거래처등)이나
                        금융감독원/경찰청/국세청 등을 사칭하는 사람으로부터 메신저 또는 휴대전화로 송금을</br> 요구받은 경우 반드시 전화로
                        사실관계를 확인하시어 부당한 피해를 입지 않도록 유의하시기 바랍니다.</br> </br> ◎ 만기형상품의 경우 만기일에 만기상환되며,
                        만기일에는 청구가 불가하여 지급일정이 다소 지연될 수 있습니다.</br> </br> <span class="desc td02">
                           ◎ 금리연동형 상품은 매도 D+2일, 투자상품은 D+8일에 지급처리 됩니다.</span></br> </br>

                        <div>
                           가입자부담금(추가부담금)중 세액공제를 받은 부담금과 운용수익에 대해서는 <span class="desc td01"
                              style="color: red; font-weight: bold;">기타소득세(16.5%,
                              지방소득세포함)</span>가 적용됨을 확인하셨습니까?<br> <br>
                        </div>
                     </div>
                     <div class="row mt-1" align="center">
                        <input type="checkbox"><span class="desc td03">위의
                           내용을 이해하였으며 해지신청을 진행하겠습니다.</span>
                        <button type="submit" class="col btn btn-primary">해지하기</button>
                     </div>
                  </div>

               </div>
            </div>


            </c:if>
            <c:if test="${empty contractDTO}">

               <div class="col-lg-offset-2 col-lg-8">
                  <div class="col-lg-12 text-center">
                     <div class="contact-form2">
                        <h1 class="contact-info-title2 mb40">당사에 가입하신 IRP계약이 없습니다.</h1>
                        <div class="row justify-content-center">
                           <div class="col-lg-3"></div>
                           <div class="col-lg-6">
                              <br> <br>

                           </div>
                           <br>

                           <div class="col-lg-12 mt-3 text-center">
                              <br>
                              <h3 class="contact-info-title3">
                                 소득이 있는 누구나, <br> <br> IPR가입 시 세제혜택을 받으며 노후를 준비 할 수
                                 있습니다.하하하
                              </h3>
                              <br> <br>
                           </div>
                           <div class="col-lg-12 mt-3 text-center">
                              <a href="/contract/join" class="btn btn-primary btn-lg">
                              IRP 가입하기
                                 <!-- <button id="sendSMSButton" type="button"
                                    class="btn-primary2">IRP 가입하기</button> -->
                              </a>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>


            </c:if>

            <div class="row">
               <div>
                  <div class="about-section"></div>
               </div>
            </div>
         </div>

      </div>
   </div>

   <input type="hidden" id="ownerName" value="${contractDTO.name}">
   <input type="hidden" id="policyNumber"
      value="${contractDTO.policyNumber}">
    <input type="hidden" id="depositTf" value="${depositTf}">

   <div class="space-small"></div>

   <footer>
      <%@include file="/WEB-INF/views/footer.jsp"%>
   </footer>

   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="/resources/js/jquery.min.js" type="text/javascript"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="/resources/js/cancelContract.js"></script>
<script type="text/javascript">

      
   </script>

   
</body>
</html>