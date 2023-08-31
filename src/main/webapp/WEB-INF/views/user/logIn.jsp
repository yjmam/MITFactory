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
<link href="/resources/css/style4.css" rel="stylesheet">
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/simple-keyboard@latest/build/css/index.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>

<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-close -->

	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>

	<div class="space-small"></div>
	<div class="myform">
		<!-- <div class="col-lg-offset-2 col-lg-8"> -->
		<div class="logo2">
			PLEASE LOG IN!
			<div>
				<i class="fa fa-cloud-upload" aria-hidden="true"></i>
			</div>
		</div>
		<form action="/user/auth" method="post">
			<input type="text" class="input3" name="username" placeholder="&#xf003;  ID" />
				<input type="password" class="input2"
				id="password" name="password" placeholder=" &#xf023;  Password"/>
			<button type="button" class="btn btn-primary4"
				onclick="toggleVirtualKeyboard()">키보드</button>
			<!-- <div> -->
				<button type="submit" class="btn btn-primary5">LOG IN</button>
				<div>
					<a href="/user/register" style="font-weight: bold;">JOIN US</a>
					<div class="simple-keyboard" style="display: none;"></div>
				</div>
			</div>
		</form>
		</div>
		

	<div class="space-small2"></div>

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->

	<script
		src="https://cdn.jsdelivr.net/npm/simple-keyboard@latest/build/index.js"></script>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        var loginFailure = <%= session.getAttribute("loginFailure") %>;

        if (loginFailure === true) {
            Swal.fire({
                icon: 'warning',
                title: '로그인 정보 불일치',
                html: '아이디나 비밀번호가 일치하지 않습니다.<br> 다시 로그인해주세요.',
                confirmButtonText: '확인',
            });
            // 실패 여부 처리가 끝났으므로 세션에서 실패 여부 삭제
            <% session.removeAttribute("loginFailure"); %>
        }
    });
    </script>
	<script>
  const Keyboard = window.SimpleKeyboard.default;
  let myKeyboard = null;

  function toggleVirtualKeyboard() {
    const keyboardElement = document.querySelector(".simple-keyboard");
    
    if (!myKeyboard) {
      myKeyboard = new Keyboard({
        onChange: input2 => onChange(input2),
        onKeyPress: button => onKeyPress(button)
      });
    }
    
    if (keyboardElement.style.display === "none") {
      keyboardElement.style.display = "block"; // 키보드 보이기
    } else {
      keyboardElement.style.display = "none"; // 키보드 숨기기
    }
  }

  function onChange(input2) {
    document.querySelector(".input2").value = input2;
    console.log("Input2 changed", input2);
  }

  function onKeyPress(button) {
    console.log("Button pressed", button);
  }
  </script>
</body>
</html>