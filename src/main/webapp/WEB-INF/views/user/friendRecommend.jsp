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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/resources/js/friendRecommend.js"></script>
</head>
<style>
   .white-text {
      color: black;
   }

   .video-container {
      position: relative;
      overflow: hidden;
      height: 600px; 
   }

   #video-background {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: auto; /* 가로 크기를 동영상 원본 크기에 맞게 조정 */
      height: 100%; /* 부모 요소의 높이에 맞춰 크기 조정 */
      object-fit: contain;
      z-index: -1;
   }

   .form-container {
      text-align: center;
      margin-top: 10px;
   }
</style>
<body>
   <!-- header-start -->
  <%@include file="/WEB-INF/views/header.jsp"%>
   <!-- header-close -->
    <div class="movewrap">
      <div>
         <div class="moving"></div>
      </div>
   </div>

   <div class="space-base"></div>
   
   <!-- 동영상 영역 -->
   <div>
   <div class="video-container">
      <video id="video-background" autoplay loop muted>
         <source src="/resources/video/sms.mp4" type="video/mp4">   
      </video>
   </div>

   <div class="container">   
      <div class="col-lg-offset-2 col-lg-8">
        <div class="col-lg-12 text-center">
               <!-- 입력 필드와 버튼 영역 -->
            <div class="form-container" style="padding-top: 20px;">
                  <input type="hidden" id="userId" value="${sessionScope.userId}">
                   <input type="text" class="form-control" id="friendphone" name="friendphone" placeholder="친구 휴대폰 번호 입력" required style="color: blue;text-align: center;">
                  <br>
                  <button id="sendSMSButton" type="button" class="btn btn-primary btn-lg">문자 발송</button>
               </div>
            </div>
         </div>
      </div>
      </div>
       
   <div class="space-small"></div>
   
   <!-- footer start -->
   <%@include file="/WEB-INF/views/footer.jsp"%>
   <!-- footer close -->


</body>
</html> 