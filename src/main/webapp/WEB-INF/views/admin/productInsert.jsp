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
					상품 등록					
					<ul class="navbar-nav">
						<!-- 햄버거 버튼 -->
						<li class="ham-btn"><a class="menu-trigger" href="#"> <span></span>
								<span></span> <span></span>
						</a></li>
					</ul>
				</h1>
			</div>
		</div>
		
 	<div class="space-small"></div>
 	
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
								<!-- 	<li><a href="/admin/dailyContractCount/"><img
											src="/resources/images/graph2.png"
											style="max-width: 35px; height: auto;"> 일별 가입현황</a></li> -->
								<!-- 	<li><a href="/admin/pickProductCount/"><img
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
			<div id="css_tabs">
			<input id="tab1" type="radio" name="tab" checked="checked" /> 
			<input id="tab2" type="radio" name="tab" />
			<label for="tab1">상품 다건 등록</label> 
			<label for="tab2">상품 단건 등록</label> 
			
			
			<div class="tab1_content">
			<br />
			<div class="pull-right">
            <p><button class="btn btn btn-primary btn-lg" onclick='downloadFile("productExcelForm")'>양식파일 다운로드</button></p>
            </div>
			
			
			   <form name="inputForm" method="post" onsubmit="excelUploadSubmit();" action="/product/productListExcelUpload"   enctype="multipart/form-data" class="form-horizontal">            
                <table id="datatable-scroller" class="table table-bordered tbl_Form">

                        <tbody>
                            <tr>
                                <th class="active" style="text-align:center">파일 업로드</th>
                                <td>
                                    <input type="file" name="file" id="file"  style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"/>

                            </tr>
                            <tr>
                            <td colspan="2" style="text-align: center;">
                          <button type="submit" class="btn btn btn-primary btn-lg">엑셀파일 업로드</button></td>
                            </tr>
                            
                        </tbody>
                    </table>


              </form>
			
			
			</div>
			
			<div class="tab2_content">
			<br /> 
            
			<form action="/product/register" method="post">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<th class="col-lg-4">구분</th>
						<th>상품 정보</th>
					</thead>
					<tbody>
						<tr>
							<td class="col-lg-4">상품명</td>
							<td><input type="text" name="productName" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td class="col-lg-4">위험등급</td>
							<td><select id="riskLevel" name="riskLevel"
								class="form-select">
									<option value="고위험">고위험</option>
									<option value="중위험">중위험</option>
									<option value="저위험">저위험</option>
									<option value="초저위험">초저위험</option>
							</select></td>
						</tr>
						<tr>
							<td class="col-lg-4">판매여부</td>
							<td><select id="productStatus" name="productStatus"
								class="form-select">
									<option value="판매중">판매중</option>
									<option value="판매중단">판매중단</option>
							</select></td>
						</tr>
						<tr>
							<td class="col-lg-4">운용사</td>
							<td><input type="text" name="manageCompany" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td class="col-lg-4">수수료</td>
							<td><input type="text" name="fee" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td class="col-lg-4">이율보증형 금리</td>
							<td><input type="text" name="rate" style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></td>
						</tr>
						<tr>
							<td class="col-lg-4">상품 주요내용</td>
							<td><textarea id="editor" name='content' style="display: block; width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="btn btn-primary">저장하기</button>&nbsp;&nbsp;
								<button type="reset" class="btn btn-primary">초기화하기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="space-small"></div>


			
			
			
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
	<!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type= "text/javascript"  src="/resources/javascript/admin.js" charset="utf-8"></script>   
	 <script type= "text/javascript"  src="/resources/js/admin.js" charset="utf-8"></script>   

<script type="text/javascript">		
<!-- 업로드 0816 -->

    
/*     $(document).ready(function() {
      var msg = "${resMap.msg}";
        if(msg != "") alert(msg);
    });
    
    function excelUploadSubmit(){
        
        if($("#file").val() == ""){
            alert("파일을 업로드해주세요.");
            $("#file").focus();
            return false;
        }
        
        if(!confirm(gTxt("confirm.save"))){
            return false;
        }
        
        return true;
    }  */
    
    <!--서버저장 파일 다운로드 -->
/*  function downloadFile(filename){
      
        $.ajax({
            method:"GET",
            url : `/admin/csvFormDownLoad`,
            success : function(data) {
                window.location =`/admin/csvFormDownLoad?FileName=productExcelForm`;
            },
            error:function(request,status){
                alert("오류가 발생했습니다.");
            }
        });
    }  */


</script>


</body>

</html>