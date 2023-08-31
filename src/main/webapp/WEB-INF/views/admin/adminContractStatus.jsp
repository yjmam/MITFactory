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
               IRP계약 현황
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
<!--    <div class="space-small"></div> -->
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
                        <!--    <li><a href="/admin/dailyContractCount/"><img
                                 src="/resources/images/graph2.png"
                                 style="max-width: 35px; height: auto;"> 일별 가입현황</a></li> -->
                        <!--    <li><a href="/admin/pickProductCount/"><img
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


            <div id="css_tabs">
         <input id="tab1" type="radio" name="tab" checked="checked" /> 
         <input id="tab2" type="radio" name="tab" />   
         <label for="tab1">IRP계약List</label> 
         <label for="tab2">IRP계약현황</label> 


          <div class="tab1_content">
         <br />
         <div class="pull-right">
            <form action="/admin/excel/download" method="get">
                  <button type="submit" class="btn btn-primary">Excel</button>
               </form>
                  
            </div>
         <div class="content">

         <div class="col-12">
            <table class="responsive-table">
               <thead>
                  <tr>
                     <th scope="col-3">증권번호</th>
                     <th scope="col-3">고객명</th>
                     <th scope="col-2">계약상태</th>

                  </tr>
               </thead>
               <tbody>

                  <c:forEach items="${contractList}" var="item">
                     <tr>
                        <td>${item.policyNumber}</td>
                        <td>${item.name}</td>
                        <td>${item.contractStatus}</td>

                     </tr>
                  </c:forEach>

               </tbody>
            </table>

            <div class="row mt-3 text-center">
               <a href="/admin/cancellation/1">&laquo;</a>
               <c:forEach begin="${startPage }" end="${endPage }" var="page">
                  <a href="/admin/contractStatus/${page }">${page }</a>
               </c:forEach>
               <a href="/admin/contractStatus/${maxPage}">&raquo;</a>
            </div>


         </div>
      </div>
         
         
         </div>
         
               <div class="tab2_content">
         <br />
                  <div class="pull-right">
                  <button class="btn btn-primary" onclick="contractDelete()">계약진행중 삭제</button>                  
            </div>
            <div class="col-12">
            <table class="responsive-table" id="contractTable">
               <thead>
                  <tr>
                     <th scope="col-3">정상</th>
                     <th scope="col-3">계약진행중</th>
                     <th scope="col-3">해지</th>
                     <th scope="col-3">해지접수중</th>
                     
                  </tr>
               </thead>
               <tbody>

               </tbody>
            </table>
            </div>
            <br />
            <div>
              <canvas id="dailyContract" style="width: 300px; height: 120px;"></canvas>
            </div>

         </div>

</div>

   </div>

   <div class="space-small"></div>

   <!-- footer start -->
   <%@include file="/WEB-INF/views/footer.jsp"%>
   <!-- footer close -->

   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="/resources/js/jquery.min.js" type="text/javascript"></script>
 <script type= "text/javascript"  src="/resources/js/admin.js" charset="utf-8"></script>   
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
<script src="/resources/js/adminContractStatus.js"></script>  

<!-- 배치팝업 -->
    <script>
        // 이미 팝업을 띄웠는지 확인하는 함수
        function hasShownPopup() {
            return sessionStorage.getItem("popupShown") === "true";
        }

        // Confirm 창을 띄우는 함수
        function showConfirmPopup(deletedContractCount) {
            if (!hasShownPopup()) {
                sessionStorage.setItem("popupShown", "true");
                Swal.fire({
                    title: '삭제된 건수: ' + deletedContractCount,
                    text: '일배치가 완료되었습니다.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '확인',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 확인 버튼을 클릭한 경우
                        // 여기에 추가 동작을 작성할 수 있습니다.
                    }
                });
            }
        }

        // 서버에서 전달한 결과를 가져오기 위해 ServletContext에서 값 가져오기
        var deletedContractCount = ${applicationScope.deletedContractCount};

        // 결과에 따라 Confirm 창을 띄우는 함수 호출
        if (deletedContractCount !== null) {
            showConfirmPopup(deletedContractCount);
        }
    </script>

</body>
</html>