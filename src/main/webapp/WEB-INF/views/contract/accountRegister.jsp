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
<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="/resources/js/accountRegister.js"></script>

</head>
<body>
	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-end -->
	<!-- 움직이는 구름 -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
	<!-- 움직이는구름끝 -->

	<div class="space-small"></div>

	<div class="container mt-5">
		<div class="col-lg-12 mb20">
			<div class="contact-form">
				<h1 class="contact-info-title">계좌 등록</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<h2 class="custom-heading" style="margin-top:40px;">가입한도 확인</h2>

			<form id="myForm" action="/account/register" method="post"
				data-name="${name}" data-subtracted-value="${subtractedValue}">
				<input type="hidden" name="policyNumber" value="${policyNumber}" />
				<input type="hidden" name="subtractedValue" value="${subtractedValue}" />

				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">타사가입금액</th>
							<th scope="col">당사가입한도</th>
						</tr>
					</thead>
					<tbody>
                  <tr>
                     <td><c:choose>
                           <c:when test="${empty limitAmount}">0원 </c:when>
                           <c:otherwise>
                              <fmt:formatNumber value="${limitAmount}" type="number"
                                 currencySymbol="" />
                           </c:otherwise>
                        </c:choose></td>
                     <%-- <td><fmt:formatNumber value="${limitAmount}" type="currency" currencySymbol="" />원</td> --%>
                     <td><fmt:formatNumber value="${subtractedValue}"
                           type="number" currencySymbol="" />원</td>
                  </tr>
               </tbody>
				</table>
				<h2 class="custom-heading" style="margin-top:40px;">자동이체정보 등록</h2>

				<table class="responsive-table">
					<thead>
						<tr>
							<th scope="col">은행명</th>
							<th scope="col">계좌번호</th>
							<th scope="col">예금주확인</th>
							<th scope="col">예금주명</th>
							<th scope="col">자동이체일자</th>
							<th scope="col">자동이체금액</th>
							<th scope="col">총납입할금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><select name="bank" class="form-control4"
								style="width: 80px;">
									<option value="신한">신한</option>
									<option value="우리">우리</option>
									<option value="하나">하나</option>
									<option value="국민">국민</option>
									<option value="농협">농협</option>
							</select></td>
							<td><input type="text" name="bankAccount"
								class="form-control4"></td>
							<td class="center-align">
								<button type="button" class="ownerButton btn btn-primary1"
									onclick="ownerNameCheck(this)">예금주조회</button>
							</td>
							<td data-name-cell class="contractNameCell"
								data-owner-name="${name}"
								style="text-align: center; vertical-align: middle;"></td>
							<td><select name="autoDate" class="form-control4">
									<option value="5">5</option>
									<option value="15">15</option>
									<option value="25">25</option>
							</select></td>
							<td><input type="text" id="autoAmount" name="autoAmount"
								class="form-control4" placeholder="금액 입력"></td>
							<td><input type="text" id="setAmount" name="setAmount"
								class="form-control4" placeholder="금액 입력"
								data-subtracted-value="${subtractedValue}"></td>
						</tr>
					</tbody>
				</table>
				<div class="alert alert-info mt-3" style="margin-top: 5%;">※ 개인형 IRP납입한도는 전금융기관 합산하여
					연1,800만원 이내로, 잔여한도 내에서 한도설정이 가능합니다.</div>
				<div class="col-sm-10"></div>
				<div class="col-sm-2 mb30" style="text-align: right;">
					<button type="button" class="btn btn-primary mt-3"
						onclick="submitForm()" data-subtracted-value="${subtractedValue}">Next
						Page</button>
				</div>
			</form>
		</div>
	</div>
	<div class="space-small"></div>

	<!-- footer-start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer-end -->
	<script>
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		var autoInput = document.getElementById("autoAmount");
		var setInput = document.getElementById("setAmount");	

		autoInput.addEventListener("input", function(event) {
			var value = event.target.value.replace(/,/g, ""); 
			var formattedValue = numberWithCommas(value);
			event.target.value = formattedValue;
		});
		
		setInput.addEventListener("input", function(event) {
			var value = event.target.value.replace(/,/g, ""); 
			var formattedValue = numberWithCommas(value);
			event.target.value = formattedValue;
		});
		
		function submitForm() {
			var subtractedValue = parseInt($('[data-subtracted-value]').data('subtractedValue'));
			
	        let inputAutoAmount = parseInt(autoInput.value.replace(/,/g, ""), 10);
	        let inputSetAmount = parseInt(setInput.value.replace(/,/g, ""), 10);
	        console.log(subtractedValue);
	        
	        if (isNaN(inputSetAmount) || inputSetAmount < 0 || inputSetAmount > subtractedValue) {
			   Swal.fire({
					title: "가입한도 초과",
					text: "당사의 가입한도금액까지만 등록해주세요.",
					icon: "warning",
					confirmButtonText: "확인"
				});
				return;
		   }

	        document.getElementById("autoAmount").value = inputAutoAmount; // 서버로 전송할 값 설정
	        document.getElementById("setAmount").value = inputSetAmount;   // 서버로 전송할 값 설정
	        document.getElementById("myForm").submit();
		}
	</script>

	<script>
		//스택 추가
		history.pushState(null, null, location.href);

		// 뒤로라기 이벤트감지 -> 현재페이지로 이동
		window.onpopstate = function() {
			history.go(1);
		}
	</script>

</body>
</html>