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
<link href="/resources/css/invest.css" rel="stylesheet">
<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
<script src="/resources/js/invest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

	<div class="container mt-10">
		<div class="grid">
			<h2>
				<b>[고객 투자성향 정보확인]</b>
			</h2>
			<div class="space-small"></div>

			<form id="quiz">
				<fieldset>
					<legend>문제 1 : 고객님의 연령대는 어떻게 되십니까?</legend>
					<div class="buttons">
						<label> <input type="radio" name="answer1" value="5" /> <span
							class="btn">29세 이하</span>
						</label> <label> <input type="radio" name="answer1" value="4" />
							<span class="btn">30세~40세</span>
						</label> <label> <input type="radio" name="answer1" value="3" />
							<span class="btn">41세~50세</span>
						</label> <label> <input type="radio" name="answer1" value="2" />
							<span class="btn">51세~60세</span>
						</label> <label> <input type="radio" name="answer1" value="1" />
							<span class="btn">61세 이상</span>
						</label>
					</div>
				</fieldset>
				<fieldset>
					<legend>문제 2 :고객님의 투자기간은 어떻게 되십니까? </legend>
					<div class="buttons">
						<label> <input type="radio" name="answer2" value="1" /> <span
							class="btn">12개월 미만</span>
						</label> <label> <input type="radio" name="answer2" value="2" />
							<span class="btn">12개월이상~3년미만</span>
						</label> <label> <input type="radio" name="answer2" value="3" />
							<span class="btn">3년이상~5년미만</span>
						</label> <label> <input type="radio" name="answer2" value="4" />
							<span class="btn">5년이상~10년미만</span>
						</label> <label> <input type="radio" name="answer2" value="5" />
							<span class="btn">10년 이상</span>
						</label>
					</div>
				</fieldset>

				<fieldset>
					<legend>문제 3 : 투자경험과 가장 가까운 금융 투자상품은 어느것입니까?</legend>

					<div class="buttons">
						<label> <input type="radio" name="answer3" value="1" /> <span
							class="btn">은행 예금/적금</span>
						</label> <label> <input type="radio" name="answer3" value="2" />
							<span class="btn">채권형 펀드/ 원금보장 파생결합증권</span>
						</label> <label> <input type="radio" name="answer3" value="3" />
							<span class="btn">혼합형 펀드/ 원금비보장 파생결합증권</span>
						</label> <label> <input type="radio" name="answer3" value="4" />
							<span class="btn">주식형 펀드</span>
						</label> <label> <input type="radio" name="answer3" value="5" />
							<span class="btn">파생상품투자 펀드, 해외펀드</span>
						</label>
					</div>
				</fieldset>

				<fieldset>
					<legend>문제 4 : 금융상품 투자에 대한 수준은 어느 정도 입니까? </legend>
					<div class="buttons">
						<label> <input type="radio" name="answer4" value="1" /> <span
							class="btn">투자해본 경험이 없다.</span>
						</label> <label> <input type="radio" name="answer4" value="2" />
							<span class="btn">채권혼합형 펀드에 투자 경험 있다</span>
						</label> <label> <input type="radio" name="answer4" value="3" />
							<span class="btn">금융투자상품의 구조 및 위험을 이해한다</span>
						</label> <label> <input type="radio" name="answer4" value="4" />
							<span class="btn">파생상품을 포함한 금융투자상품의 구조를 이해하고 있다.</span>
						</label>
					</div>
				</fieldset>

				<fieldset>
					<legend>문제 5 : 고객님의 보유자산 중 은퇴자산의 규모는 얼마입니까?</legend>
					<div class="buttons">
						<label> <input type="radio" name="answer5" value="5" /> <span
							class="btn">1천만원 미만</span>
						</label> <label> <input type="radio" name="answer5" value="4" />
							<span class="btn">1천만원 이상~5천만원 미만</span>
						</label> <label> <input type="radio" name="answer5" value="3" />
							<span class="btn">5천만원 이상~ 1억원 미만</span>
						</label> <label> <input type="radio" name="answer5" value="2" />
							<span class="btn">1억원 이상~ 5억원 미만</span>
						</label> <label> <input type="radio" name="answer5" value="1" />
							<span class="btn">5억원 이상</span>
						</label>
					</div>
				</fieldset>

				<fieldset>
					<legend>문제 6 : 고객님의 퇴직시까지의 수입원을 가장 잘 나타내는 것은?</legend>
					<div class="buttons">
						<label> <input type="radio" name="answer6" value="3" /> <span
							class="btn">현재 일정한 수입이 발생하고, 향후에도 현재수준을 유지하거나 증가할 것으로 예상</span>
						</label> <label> <input type="radio" name="answer6" value="2" />
							<span class="btn">현재 일정한 수입이 발생하고 있으나 향후 감소할 것으로 예상</span>
						</label> <label> <input type="radio" name="answer6" value="1" />
							<span class="btn">현재 일정한 수입이 발생하고 있으나 향후 매우 불안정할 것으로 예상</span>
						</label>
					</div>
				</fieldset>

				<fieldset>
					<legend>문제 7 : 투자원금에 손실이 발생하는 경우 감내할 수 있는 손실 수준은?</legend>
					<div class="buttons">
						<label> <input type="radio" name="answer7" value="0" /> <span
							class="btn">무슨일이 있어도 투자 원금 만큼은 보존되어야 함</span>
						</label> <label> <input type="radio" name="answer7" value="1" />
							<span class="btn">투자 수익율을 고려하나 원금 보존이 더 중요</span>
						</label> <label> <input type="radio" name="answer7" value="2" />
							<span class="btn">원금 보존을 고려하나 투자 수익이 더 중요</span>
						</label> <label> <input type="radio" name="answer7" value="4" />
							<span class="btn">손실위험이 있더라도 투자 수익이 더 중요</span>
						</label>
					</div>
				</fieldset>


				<div class="text-right">
					<button id="resultBtn" type="button"
						onclick="showResultPopup(quiz)" class="btn-primary">
						<b>결과 확인 
					</button>
					<button type="button" class="btn-primary"
						onclick="location.href='/product/selectInvest'">
						<b>Next Page</b>
					</button>
				</div>
			</form>
		</div>
	</div>
	<div class="space-small"></div>

	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<!-- 	<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="/resources/js/jquery.sticky.js"></script>
	<script type="text/javascript" src="/resources/js/sticky-header.js"></script>
	<script type="text/javascript" src="/resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/resources/js/slider.js"></script> -->
</body>
</html>