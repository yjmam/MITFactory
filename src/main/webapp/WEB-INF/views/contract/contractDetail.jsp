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
<link rel="stylesheet" href="path_to_bootstrap_css">
<!-- <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/html2canvas.js"></script>
<script src="/resources/js/jspdf.min.js"></script>
<link href="/resources/css/signature.css" rel="stylesheet">

</head>
<body>
<!-- 서버에서 가져온 policyNumber 값을 hidden input 요소에 저장 -->
<input type="hidden" id="policyNumber" value="${contract.policyNumber}">
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

   <!-- form-start -->
   <div class="container">
      <div class="col-lg-12 mb20">
         <div class="contact-form">
            <h1 class="contact-info-title">가입사항 및 청약서 확인</h1>
         </div>
      </div>
      <!-- 가입자 정보 섹션 -->
      <div class="col-lg-12 mb20 contract-form">
         <div class="contact-form2">
            <h2 class="contact-info-title2 mb40" style="text-align:left;">                
             <img src="/resources/images/mark2.png" alt="" style="width: 4%; height: 35px;">
               가입자 정보</h2>
            <table class="table table-bordered">
               <tr>
                  <th class="col-lg-3">성명</th>
                  <td>${logInName}</td>
               </tr>
               <tr>
                  <th class="col-lg-3">생년월일</th>
                  <td>${logIn.birthYear}.${logIn.birthMonth}.${logIn.birthDay}</td>
               </tr>
            </table>
         </div>
      </div>

      <!-- 가입내역 섹션 -->
      <div class="col-lg-12 mb20 contract-form">
         <div class="contact-form2">
            <h2 class="contact-info-title2 mb40" style="text-align:left;">                
             <img src="/resources/images/mark2.png" alt="" style="width: 4%; height: 35px;">
               가입내역</h2>
            <table class="table table-bordered">
               <tr>
                  <th class="col-lg-3">증권번호</th>
                  <td colspan="2">${contract.policyNumber}</td>
               </tr>
               <tr>
                  <th class="col-lg-3">가입상품</th>
                  <td colspan="2">${contract.contractType}</td>
               </tr>
               <tr>
                  <th class="col-lg-3">가입금액</th>
                  <td colspan="2"><fmt:formatNumber value="${contract.setAmount}" pattern="#,###" />원</td>
               </tr>
               <tr>
                  <th colspan="3" class="col-lg-3">자동이체정보</th>
               </tr>
               <tr>
                  <th>은행명</th>
                  <th>자동이체금액</th>
                  <th>자동이체일자</th>
               </tr>
               <tr>
                  <td>${account.bank}</td>
                  <td><fmt:formatNumber value="${account.autoAmount}" pattern="#,###" />원</td>
                  <td>${account.autoDate}일</td>
               </tr>
            </table>

            <!-- 서명 start -->
            <table class="table table-bordered">
               <tr>                 
                     <th colspan="3" class="col-lg-3">자필서명</th>
                 
                  <td colspan="2">
                     <div class="canvas-draw-box">
                        <div class="canvas-draw-base" data-id="canvas_name1"></div>
                        <div class="canvas-draw-pad-box">
                           <canvas id="canvas_name1" class="canvas-draw-pad">1. 사용중인 브라우저에서 지원하지 못합니다.</canvas>
                           <div>
                              <!-- <button onClick="javascript:done('canvas_name1')">서명확인</button> -->
                              <button onClick="javascript:save('canvas_name1')"
                                 data-policy-number="${contract.policyNumber}" class="btn-primary2">서명확인</button>
                              <!-- <button onClick="javascript:down('canvas_name1')">download</button> -->
                              <button onClick="javascript:del('canvas_name1')"class="btn-primary2">재서명</button>

                           </div>
                        </div>
                     </div> <!-- 서명 end --> <br /> <br />
                  </td>
               </tr>
            </table>

         </div>
      </div>
     <div class="form-check">
         <h1 class="contact-title2 mb10">
            <input class="form-check-input" type="checkbox" required /> 청약서내용을
            확인하셨습니까?
         </h1>
         <div class="col-sm-10"></div>
                     <div class="col-sm-2 mb30" style="text-align:right;">          
            <button data-toggle="modal" data-target="#noticeModal"
               class="btn btn-primary"><b>Confirm</b></button>
         </div>

         <div class="modal" id="noticeModal">
            <div class="modal-dialog modal-dialog-center modal-lg">
               <div class="modal-content">

                  <div class="modal-header">
                  <h4 class="modal-title">IRP 가입 설명서, 계약내용 확인 </h4>
                  </div>
                  <div class="modal-body">
                  <div align="left" class="highlight"
                     style="margin-left: 30px; overflow-y: hidden; overflow-x: hidden; width: 800px; height: 650px;">
                     <br> 이 퇴직연금(IRP)은 예금보호대상 금융상품으로 운용되는 적립금에 한하여
                     예금자보호법에 따라 예금보험공사가
                     보호하되 보호 한도는 귀하의 다른 예금보호 대상 금융상품과는 별도로 1인당 “최고
                     5천만원”이며,5천만원을 초과하는 나머지 금액은 보호하지 않습니다. <br><br> 단, 2개 이상 퇴직연금에
                     가입한 경우 합하여 5천만원 까지 보호합니다.<br>투자자는 금융투자상품에 대하여 설명을
                     들을 권리가 있으며, 투자 전 상품설명서 및 약관, 집합투자규약을 반드시 읽어보시기 바랍니다.<br>
                     금융투자상품(집합투자증권)은 자산가격 변동, 환율 변동, 신용등급 하락 등에 따라 투자원금의
                     손실(0~100%)이 발생할 수 있으며, 그 손실은 투자자에게 귀속됩니다.<br><br>
                     금융투자상품(집합투자증권)은 예금자보호법에 따라 예금보험공사가 보호하지 않습니다. 과세기준 및 과세방법은
                     향후 세법개정 등에 따라 변동될 수 있습니다. <br> - IRP는
                     중도해지 시 자산매도 금액에서 이미 받는 세액공제 혜택이 차감되어 해지로 인한 손실이 클 수 있습니다. <br>
                     <br> · 세액공제를 받은 사실이 없다면 세액공제확인서를 제출하여 소명<br>
                     <span class="desc td01"><br>
                     <br>- IRP는 중도해지 시 세액공제 받았던 납입금과 운용수익에 대하여 기타소득세 16.5%가
                        부과됩니다.
                     <br> · 부득이한 중도인출 사유(6개월 이상 요양을 요하는 의료비, 개인회생 및 파산, 천재지변 등)를
                        소명할 경우
                     <br> 저율과세 적용 : 16.5% 대신 3.3~5.5% 적용
                     <br> </span>                  
                     <br><br>

                     <div class="row mt-2" style="color: red; text-align: center; font-weight: bold;">
                        본인은 상품설명서, 약관의 주요내용을 이해하였음을 확인합니다. 
                         <button type="submit" class="col btn btn-primary" style="margin-left: 10px;"> 가입완료</button>
                         
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   </div>

   <div class="space-small"></div>

   <footer>
      <%@include file="/WEB-INF/views/footer.jsp"%>
   </footer>

   <script src="/resources/js/signature.js"></script>
   <script src="/resources/js/contractDetail.js"></script>
   
    <script>   
      // CoolSMS를 통해 문자 발송
      function sendSMS(action) {     
         var logInName = '${logInName}';
         console.log(logInName)
        $.ajax({
            type : 'POST',
            url : '/contract/sendSms',
            data : {
               'from' : '01077699442', // 발신번호
               'text' : '[MIT]<IRP가입완료안내>\n' + logInName
                     + '님, IRP가입이 완료되었습니다.\n 당사와의 첫 거래 감사드립니다.' // 문자내용

            }, 
            success : function(smsResponse) {
               console.log('CoolSMS로 문자 발송 성공', smsResponse);
               // 문자 발송 성공시 추가 작업 수행
            },
            error : function(smsError) {
               console.error('CoolSMS로 문자 발송 실패', smsError);
               // 문자 발송 실패시 추가 작업 수행
            }
         });
      } 
   </script>
   
</body>
</html>