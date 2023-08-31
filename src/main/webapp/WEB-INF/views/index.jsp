<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<script src="sweetalert2.all.min.js"></script>
<script src="/resources/js/mainPopup.js"></script>
<!-- 아이콘사용 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<script
		src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

</head>

<body>

	<!-- header-start -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- header-close -->

	<input type="hidden" id="loggedInValue" value="${not empty logInRole}">
	<input type="hidden" id="hasContract" value="${hasContract}">
	<input type="hidden" id="isLoggedIn" value="${isLoggedIn}">

	<!-- slider-start -->
	<br>
	<div class="slider">
		<div class="owl-carousel owl-theme">
			<div class="containerIndex">
				<div class="item">
					<a href="/showIRP"> <img src="/resources/images/slider1.jpg"
						alt="" style="width: 100%; height: 500px;">
					</a>
				</div>
			</div>
			<div class="containerIndex">
				<div class="item">
					<a
						href="https://investpension.miraeasset.com/contents/keyView.do?idx=19966">
						<img src="/resources/images/slider2.jpg" alt=""
						style="width: 100%; height: 500px;">
					</a>
				</div>
			</div>

			<div class="containerIndex">
				<div class="item">
					<a href="/contract/join"> <img
						src="/resources/images/slider3.jpg" alt=""
						style="width: 100%; height: 500px;">
					</a>
				</div>
			</div>
			<div class="containerIndex">
				<div class="item">
					<a href="#" onclick="openPensionCalculatorPopup(event)"> <img
						src="/resources/images/slider4.jpg" alt=""
						style="width: 100%; height: 500px;">
					</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- slider-close -->
	<!-- quick Menu -start-->
	<div class="quick-menu"
		style="background-color: #FBEFEF; padding: 10px;">
		<div id="google_translate_element" style="display: none;"></div>
		<label style="text-align: center; display: block;">Language</label>
		<ul class="translation-links" style="text-align: center; padding: 0;">
			<li><a href="javascript:void(0)" class="trans_flag"
				data-lang="en"><img src="/resources/images/United_states.png"></a></li>
			<li><a href="javascript:void(0)" class="trans_flag"
				data-lang="ja"><img src="/resources/images/Japan1.png"></a></</li>
			<li><a href="javascript:void(0)" class="trans_flag"
				data-lang="zh-CN"><img src="/resources/images/China.png"></a></li>
			<li><a href="javascript:void(0)" class="trans_flag"
				data-lang="es"><img src="/resources/images/Spain.png"></a></li>
			<li><a href="javascript:void(0)" class="trans_flag"
				data-lang="fr"><img src="/resources/images/France.png"></a></li>
		</ul>
	</div>

	<c:if test="${logInRole eq 'ROLE_ADMIN'}">
		<div class="space-small bg-default">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/admin/product/1">
									<h1 class="counter-title">
										<i class="bi bi-folder2-open"></i>
									</h1> <span class="counter-text">상품목록</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/admin/productInsert">
									<h1 class="counter-title">
										<i class="bi bi-folder-plus"></i>
									</h1> <span class="counter-text">상품등록</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/admin/cancellation/1">
									<h1 class="counter-title">
										<i class="bi bi-check2-square"></i>
									</h1> <span class="counter-text">해지승인</span>
								</a>
							</div>
						</div>
					</div>
					<!--                <div class="col-lg-2 col-md-4 col-sm-6 col-xs-6">
                  <div class="counter-block">
                     <div class="counter-content">
                        <a href="/admin/pickProductCount/">
                           <h1 class="counter-title">
                              <i class="bi bi-graph-down"></i>
                           </h1> <span class="counter-text">상품통계 
                        </a></span>
                     </div>
                  </div>
               </div> -->
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/admin/contractStatus/1">
									<h1 class="counter-title">
										<i class="bi bi-people"></i>
									</h1> <span class="counter-text">계약현황</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${empty logInRole||logInRole eq 'ROLE_USER'}">
		<div class="space-small bg-default">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/user/myContract/${logInId}">
									<h1 class="counter-title">
										<i class="bi bi-briefcase"></i>
									</h1> <span class="counter-text">나의퇴직연금222</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/product/productStorage">
									<h1 class="counter-title">
										<i class="bi bi-clipboard-data"></i>
									</h1> <span class="counter-text">상품공시</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="counter-block">
							<div class="counter-content">


								<a href="/product/productChange" id="productLink">
									<h1 class="counter-title">
										<i class="bi bi-arrow-down-up"></i>
									</h1> <span class="counter-text">상품변경</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/deposit/showdeposit" id="depositLink">
									<h1 class="counter-title">
										<i class="bi bi-currency-dollar"> </i>
									</h1> <span class="counter-text">입금 
								</a></span>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/contract/join">
									<h1 class="counter-title">
										<i class="bi bi-pencil-square"></i>
									</h1> <span class="counter-text">IRP가입</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-4 col-sm-6 col-xs-6">
						<div class="counter-block">
							<div class="counter-content">
								<a href="/pension">
									<h1 class="counter-title">
										<i class="bi bi-calculator"></i>
									</h1> <span class="counter-text">연금간편계산기</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<!-- quick Menu-close-->
	<!-- youtube-start-->
	<div class="space-base">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-title">
						<div id="video-container">
							<!-- 기본적으로 첫 번째 동영상만 표시 -->
							<iframe id="video-1" width="560" height="415"
								src="https://www.youtube.com/embed/qFeB7bD6xIs?autoplay=1&mute=1"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>

							<!-- 동영상2 -->
							<iframe id="video-2" width="560" height="415"
								src="https://www.youtube.com/embed/Wkq7kTNZlTg?autoplay=1&mute=1"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen style="display: none;"></iframe>

							<!-- 동영상3 -->
							<iframe id="video-3" width="560" height="415"
								src="https://www.youtube.com/embed/GvlgKpqtPs8?autoplay=1&mute=1"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen style="display: none;"></iframe>

							<!-- 동영상4 -->
							<iframe id="video-4" width="560" height="415"
								src="https://www.youtube.com/embed/FN35cKFAptU?autoplay=1&mute=1"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen style="display: none;"></iframe>
						</div>
					</div>
				</div>
				<div class="col-lg-1"></div>
				<div class="col-lg-5">
					<div class="service-block">
						<div class="service-icon">
							<i class="bi bi-caret-right-square"></i>
						</div>
						<!-- 각 동영상 선택 버튼 -->
						<h3>
							<a href="#" onclick="showVideo(1)"><i class="bi bi-dice-1"></i>&nbsp;퇴직금
								irp로 만들어야하는 이유</a>
						</h3>
						<br />
						<h3>
							<a href="#" onclick="showVideo(2)"><i class="bi bi-dice-2"></i>&nbsp;연금고수들의
								연말정산 노하우 대방출</a>
						</h3>
						<br />
						<h3>
							<a href="#" onclick="showVideo(3)"><i class="bi bi-dice-3"></i>&nbsp;연금고수는
								IRP활용이 남다르다 </a>
						</h3>
						<br />
						<h3>
							<a href="#" onclick="showVideo(4)"><i class="bi bi-dice-4"></i>&nbsp;이벤트
								실버버튼</a>
						</h3>
						<br />
					</div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="row">
							<div class="col-lg-10">
								<img src="/resources/images/1csqN.jpg" alt=""
									style="width: 150%; height: 300px;">
							</div>
						</div>
					</div>
					<div class="col-lg-1"></div>
					<div class="service-content">
						<div class="col-lg-5">
							<div class="service-block">
								<div class="space-small">
									<h1>
										<b>IRP에 가입하려면<br /> 무엇을 준비해야 하나요?
										</b>
									</h1>
									<br>
									<h3>
										<i class="bi bi-dice-1"></i> &nbsp; 신분증(주민등록증 또는 운전면허증)<br>
										<br> <i class="bi bi-dice-2"></i> &nbsp;입금자명을 바로 확인할 수 있는
										계좌 인증서<br> <br /> <i class="bi bi-dice-3"></i> &nbsp;
										스마트폰에서 간편하게 나의 계약사항 확인<br>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- youtube-close-->


	<!-- footer start -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer close -->
	
<!-- 	<script>
        let currentVideoNumber = 1; // 현재 표시 중인 동영상 번호

        // 동영상 표시 함수
        function showVideo(videoNumber) {
            event.preventDefault(); // 기본 동작 차단

            // 기존에 표시되고 있는 동영상 정지 (영상과 소리 모두)
            let currentVideo = document.getElementById('video-' + currentVideoNumber);
            currentVideo.contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');

            // 모든 동영상 숨김 처리
            for (let i = 1; i <= 4; i++) {
                document.getElementById('video-' + i).style.display = 'none';
            }

            // 선택한 동영상 표시
            let selectedVideo = document.getElementById('video-' + videoNumber);
            selectedVideo.style.display = 'block';

            // 현재 동영상 번호 갱신
            currentVideoNumber = videoNumber;

            // 새로 선택한 동영상 재생
            selectedVideo.contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
        }
    </script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const pensionLink = document.querySelector('a[href="/pension"]'); // "연금계산기" 링크 선택
			pensionLink.addEventListener('click', openPensionCalculatorPopup);
		});

		function openPensionCalculatorPopup(event) {
			event.preventDefault(); // 기본 링크 동작 방지

			var popupWidth = 700;
			var popupHeight = 900;

			var screenWidth = window.innerWidth
					|| document.documentElement.clientWidth
					|| document.body.clientWidth;
			var screenHeight = window.innerHeight
					|| document.documentElement.clientHeight
					|| document.body.clientHeight;

			var screenWidth = window.innerWidth
					|| document.documentElement.clientWidth
					|| document.body.clientWidth;
			var screenHeight = window.innerHeight
					|| document.documentElement.clientHeight
					|| document.body.clientHeight;

			var popupLeft = (screenWidth - popupWidth) / 2;
			var popupTop = (screenHeight - popupHeight) / 2;

			var popupWindow = window.open('/pension', 'PensionCalculatorPopup',
					'width=' + popupWidth + ', height=' + popupHeight
							+ ', left=' + popupLeft + ', top=' + popupTop);
		}
	</script>
	<script
		src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<script type="text/javascript">
		/* 구글 번역 초기화 */
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({
				pageLanguage : 'ko',
				autoDisplay : true
			}, 'google_translate_element');
		}
	</script>
	<script type="text/javascript">
		document
				.querySelector('.translation-links')
				.addEventListener(
						'click',
						function(event) {
							let el = event.target;
							if (el != null) {
								while (el.nodeName == 'FONT') {
									el = el.parentElement;
								}//data-lang 속성이 있는 태그 찾기
								const tolang = el.dataset.lang; // 변경할 언어 코드 얻기
								const gtcombo = document
										.querySelector('.goog-te-combo');
								if (gtcombo == null) {
									alert("Error: Could not find Google translate Combolist.");
									return false;
								}
								gtcombo.value = tolang; // 변경할 언어 적용
								gtcombo.dispatchEvent(new Event('change')); // 변경 이벤트 트리거
							}
							return false;
						});
	</script> -->

	<script type="text/javascript" src="/resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/resources/js/slider.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- 	<script src="sweetalert2.all.min.js"></script> -->
	<script src="/resources/js/index.js"></script>

</body>
</html>