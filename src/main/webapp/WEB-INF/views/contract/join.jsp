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
	<!-- 움직이는 구름 -->
	<div class="movewrap">
		<div>
			<div class="moving"></div>
		</div>
	</div>
	<!-- 움직이는구름끝 -->

	<div class="space-small"></div>

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

	<input id="userId" type="hidden" value="${logIn.id}">
	<c:if test="${irpExistence eq 'false'}">
		<!-- form-start -->
		<div class="container">
			<div class="col-lg-12 mb20">
				<div class="contact-form">
					<h1 class="contact-info-title">기본정보 확인</h1>
				</div>
			</div>

			<div class="col-lg-6 mb20">
				<div class="contact-form2">
					<h1 class="contact-info-title2 mb40">가입자 정보</h1>
					<div class="row">
						<div class="col-lg-12">
							<h1 class="contact-title2">당사가입 여부 :</h1>
							<div class="select">

								<input type="radio" id="select" name="shop"
									${contractExistence eq 'true' ? 'checked' : ''}> <label
									for="select">YES</label> <input type="radio" id="select2"
									name="shop" ${contractExistence eq 'false' ? 'checked' : ''}>
								<label for="select2">NO</label>

							</div>
						</div>

						<div class="col-lg-12">
							<h1 class="contact-title2">성명 :</h1>
							<div class="col-lg-12">
								<div class="box-table2">${logIn.name}</div>
							</div>
							<h1 class="contact-title2">생년월일 :</h1>
							<div class="col-lg-12">
								<div class="box-table2">${logIn.birthYear}.${logIn.birthMonth}.${logIn.birthDay}</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 mb20">
				<div class="contact-form2">
					<h1 class="contact-info-title2 mb30">운용지시 선택</h1>
					<div class="row">
						<div class="form-group2">
							<div class="form-check">
								<div class="box-table3">
									<h1 class="contact-title2 mb40">
										<input class="form-check-input" type="radio" name="step"
											id="generalStep" checked> 일반운용지시
									</h1>
									<p class="contact-sub2">IRP 가입단계에서 직접 상품을 선택합니다.</p>
								</div>

								<div class="box-table3">
									<h1 class="contact-title2 mb40">
										<input class="form-check-input" type="radio" name="step"
											id="simpleStep"> 간편운용지시
									</h1>
									<p class="contact-sub2">원리금보장상품으로 매도일정이 짧은 금리연동형으로 매수상품을
										저장합니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-lg-12">
				<div class="contact-form2">
					<div class="row">
						<div class="form-group2">
							<div class="form-check">
								<h1 class="contact-title2 mb30">
									<label class="checkbox"> <input
										class="form-check-input agree-checkbox" type="checkbox"
										data-modal-target="noticeModal1" required> <span
										class="icon"></span> <span class="text">약관 동의</span>
									</label>
								</h1>
								<div class="modal" id="noticeModal1">
									<div class="modal-dialog modal-dialog-center  modal-lg">
										<div class="modal-content">

											<div class="modal-header">
												<h4 class="modal-title">이용약관에 동의</h4>
											</div>
											<!-- Modal body -->

											<br> <br> <br>
											<!-- <div class="modal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;"> -->


											<div align="left" class="highlight"
												style="margin-left: 30px; overflow-y: scroll; overflow-x: hidden; width: 850px; height: 500px">

												<B>이용약관에 대한 사항</B>
												<button id="speechButton" style="width: 50px; height: 20px">
													<i class="bi bi-volume-up"></i>
												</button>

												<br> <br> ■ 제1조 (약관의 목적)<br> <br> <br>
												이 약관의 목적은 근로자 퇴직급여보장법 제24조에 의하여 개인형퇴직연금제도를 설정한 가입자와<br>
												<br> <span style="color: #ea700c; font-weight: bold;">
													MIT보험회사</span>가 이 제도의 자산관리 업무 수행을 위하여 퇴직연금 자산관리 계약을 체결함에 있어 세부사항을
												정함에<br> <br> 있습니다. <br> <br> <br> ■
												제2조 (용어의 정의)<br> <br> <br> ① 이 계약에서 사용하는 용어의
												정의는 다음과 같습니다.<br> <br> <span class="desc td01">②
													'운용관리기관'</span>이라 함은 이 제도를 설정한 가입자와 운용관리 업무를 수행하는 운용관리계약을 체결한<br>
												<br> 퇴직연금사업자를 말합니다.<br> <br> ③ '자산관리기관'이라 함은
												이 제도를 설정한 <span class="desc td02">가입자와 자산관리 업무를 수행하는
													자산관리계약을 체결한<br> <br> 퇴직연금사업자를 말합니다.
												</span> <br> <br> <br> ■ 제3조 (계약의 성립)<br> <br>
												<br> ① 계약은 가입자의 청약과 회사의 승낙으로 이루어집니다.<br> <br>
												② 회사는 계약이 성립된 경우 지체없이 보험증권(보험가입증서)을 가입자에게 교부합니다.<br> <br>
												<br> ■ 제4조 (약관의 교부 및 설명의무 등)<br> <br> <br>
												회사는 가입자가 청약한 경우, 가입자에게 이 약관과 <span class="desc td03">청약서
													부본을 전달하고 이 약관의 주요한 내용을 설명합니다.</span><BR> <br> 다만, 통신판매
												계약은 가입자가 동의하는 경우 약관과 청약서등을 광기록 매체 및 전자우편 등 전자적 방법으로<br>
												<br> 송부하고 약관의 주요 내용에 대하여 가입자가 사이버몰에서 확인한 때에는 약관의 중요한
												내용을 설명한 것으로<br> <br> 봅니다.<br> <br> <br>
												<br>
											</div>
											<br> <br>
											<div class="row mt-1" align="center">
												위의 내용을 이해하였으며 동의합니다.&nbsp;&nbsp;
												<button type="submit" class="col btn btn-primary"
													onclick="agreeAndCloseModal('noticeModal1')">동의하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>


							<h1 class="contact-title2 mb30">
								<label class="checkbox"> <input
									class="form-check-input agree-checkbox" type="checkbox"
									data-modal-target="noticeModal2" required> <span
									class="icon"></span> <span class="text">계약 체결 및 이행등을 위한
										개인(신용)정보 처리 동의</span>
								</label>
							</h1>

							<div class="modal" id="noticeModal2">
								<div class="modal-dialog modal-dialog-center  modal-lg">
									<div class="modal-content">

										<div class="modal-header">
											<h4 class="modal-title">체결 및 이행등을 위한 개인(신용)정보 처리 동의</h4>
										</div>
										<!-- Modal body -->
										<br> <br> <br>
										<div align="left" class="highlight1"
											style="margin-left: 30px; overflow-y: scroll; overflow-x: hidden; width: 850px; height: 500px">
											<b><span class="desc td01"> 소비자 권익보호에 관란 사항 </span></b> <br>
											<br>본 동의를 거부하시는 경우에는 IRP계약 체결 및 이행등이 불가능 하며 본 동의서에 의한
											개인(신용)정보 조회는<br> <br> 귀하의 신용등급에 영향을 주지 않습니다.<br>
											<br> <br> 1.개인(신용)정보 수집 이용에 관한 동의사항<br> <br>
											<br> <span class="desc td02">당사 및 당사 업무수탁자는
												개인정보보호법및 신용정보의 이용 및 보호에 관란 법률에 따라 <br> <br> 본 계약과
												관련하여 귀하의 개인정보를 다음과 같이 수입 이용 하고자합니다. <br> <br>
											</span> <br> ■ 개인(신용)정보의 수집 이용목적<br> <br> IRP계약의 체결,
											유지, 상담, 조사, 기타 사무수행<br> <br> 금융거래 관련 업무, 이체계좌 관련
											신청, 해지, 변경 등<br> <br> <br> ■ 수집 이용할 개인(신용)정보의
											내용<br> <br> <span class="desc td03">개인식별정보 :
												성명, 주민등록번호, 외국인등록번호 등 고유 식별정보, 전화번호, 전자우편주소 등 연락처 등</span><br>
											<br> <br> <br> 2. 개인(신용)정보의 조회에 관한 사항<br>
											<br> <br> 당사 및 당사 업무수탁자는 신용정보의 이용 및 보호에 관란 법률에 따라
											귀하의 개인(신용)정보를 <br> <br> 다음과 같이 신용정보집중기관, 신용정보회사,
											금융결제원 등 으로부터 조회하고자 합니다<br> <br> <br> ■
											개인(신용)정보의 조회 목적<br> <br> IRP계약의 처리, 본계약 또는 본계약 이전에
											발생한 거래의 유지, 사후관리 및 내부분석용<br> <br> <br>
										</div>
										<br> <br>

										<div class="row mt-1" align="center">
											<span class="desc td02"> 위의 내용을 이해하였으며
												동의합니다.&nbsp;&nbsp; </span>
											<button type="submit" class="col btn btn-primary"
												onclick="agreeAndCloseModal('noticeModal2')">동의하기</button>
										</div>
									</div>
								</div>
							</div>


							<h1 class="contact-title2 mb30">
								<label class="checkbox"> <input
									class="form-check-input agree-checkbox" type="checkbox"
									data-modal-target="noticeModal3" required> <span
									class="icon"></span> <span class="text">고유식별정보 처리동의</span>
								</label>
							</h1>

							<div class="modal" id="noticeModal3">
								<div class="modal-dialog modal-dialog-center  modal-lg">
									<div class="modal-content">

										<div class="modal-header">
											<h4 class="modal-title">고유식별정보 처리동의</h4>

										</div>
										<!-- Modal body -->
										<br> <br> <br>
										<div align="left" class="highlight1"
											style="margin-left: 30px; overflow-y: scroll; overflow-x: hidden; width: 850px; height: 500px">
											<br> <b>고유식별정보 처리동의 </b><br> <br> <br> <br>본인은
											<span style="color: #ea700c; font-weight: bold;">MIT(주)(이하
												‘MIT’라 합니다)</span>가 제공하는 <span class="desc td01">본인확인서비스를
												이용하기 위해, <br> <br> 다음과 같이 본인의 개인정보를 회사가 아래 기재된
												제3자에게 제공하는 것에 동의합니다.<br> <br> <br> <br>
											</span> ■ 수집·이용 및 제공하는 고유식별정보 항목<br> <br> <br> <br>
											① 주민등록번호(내국인)<br> <br> ② 외국인등록번호(국내거주외국인)<br>
											<br> <br> ■ 고유식별정보 보유 및 이용기간<br> <br> <br>
											<br> 고유식별정보의 수집 · 이용 및 제공 목적이 달성된 후에는 해당 정보를 지체 없이
											파기합니다.<br> <br> 다만, 전자상거래 등에서의 소비자보호에 관한 법률 등 관련법령의
											규정에 의하여 <br> <br> 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간
											보유합니다.<br> <br> <br> <br> <span
												style="color: red;">- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
												<br> - 대금결제 및 재화등의 공급에 관한 기록 : 5년<br> <br> -
												소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br> <br> <br> <br>
												■ 동의거부 및 거부시 불이익<br> <br> <br> <br>
												고유식별정보 수집·이용 및 제공에 대한 동의는 거부할 수 있으며, 동의 후에도 철회 가능합니다.<br>
												<br> 다만, 동의 거부 및 철회 시에는 서비스 이용이 제한될 수 있습니다. 
										</div>
										<br> <br>
										<div class="row mt-1" align="center">
											위의 내용을 이해하였으며 동의합니다.
											<button type="submit" class="col btn btn-primary"
												onclick="agreeAndCloseModal('noticeModal3')">동의하기</button>
										</div>
									</div>

								</div>
							</div>

							<h1 class="contact-title2">
								<label class="checkbox"> <input
									class="form-check-input agree-checkbox" type="checkbox"
									data-modal-target="noticeModal4" required> <span
									class="icon"></span> <span class="text">소득/재직 서류제출
										자동화(스크래핑)서비스 이용동의</span>
								</label>
							</h1>

							<div class="modal" id="noticeModal4">
								<div class="modal-dialog modal-dialog-center  modal-lg">
									<div class="modal-content">

										<div class="modal-header">
											<h4 class="modal-title">소득/재직 서류제출 자동화(스크래핑)서비스 이용동의</h4>
										</div>
										<!-- Modal body -->
										<br> <br> <br>
										<div align="left" class="highlight1"
											style="margin-left: 30px; overflow-y: scroll; overflow-x: hidden; width: 850px; height: 500px">
											<br> <br> <B><span class="desc td01">스크래핑이란,</span></B><br>
											<br> IRP가입 신청 후 별도로 이용기관(건강보험공단, 국세청)에 소득 및 재직 관련 서류를
											제출해야하는 번거로움을<br> <br> <br> 없애고자 도입된 서비스입니다.<br>
											<br> <br> 고객님의 공인인증서를 통해 이용기관(건강보험공단, 국세청)에 자동으로
											접속하여 소득 및 재직 관련 서류를 전자적<br> <br> <br> 방식으로
											제출하는 방식입니다.<BR> <br> <br> 본인은 <span
												style="color: #ea700c; font-weight: bold;">MIT(주)(이하
												‘MIT’라 합니다)</span>가 제공하는 본인확인서비스를 이용하기 위해,<br> <br> <br>
											<span class="desc td02">다음과 같이 본인의 개인정보를 회사가 스크래핑하는것을
												동의합니다. </span> <br> <br> <br> <br> <br>
										</div>
										<br> <br>
										<div class="row mt-1" align="center">
											위의 내용을 이해하였으며 동의합니다.
											<button type="submit" class="col btn btn-primary"
												onclick="agreeAndCloseModal('noticeModal4')">동의하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-10"></div>
				<div class="col-sm-2 mb30" style="text-align: right;">
					<div class="space-small"></div>
					<button class="btn btn-primary" onclick="handleNextPage()">Next
						Page</button>
				</div>
				<!-- 변경0804 -->
			</div>
		</div>

		<div id="irpExistence" style="display: none;">${irpExistence}</div>
	</c:if>

	<c:if test="${irpExistence eq 'true'}">
		<script>
      		Swal.fire({
          		title: "당사에 IRP계좌가 있습니다.",
         		text: "1인 1계좌만 가입할 수 있습니다.",
         		icon: "warning",
         		confirmButtonText: "확인"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '/';
          }
      });
    </script>
	</c:if>

	<!-- footer start -->
	<c:if test="${irpExistence ne 'true'}">
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</c:if>


	<script src="/resources/js/join.js"></script>

	<!-- 	<script type="text/javascript">
		/* 구글 번역 초기화 */
		function googleTranslateElementInit() {
			new google.translate.TranslateElement({
				pageLanguage : 'ko',
				autoDisplay : true
			}, 'google_translate_element');
		}
	</script>
	<script type="text/javascript">
		/* 새 UI 선택 클릭 이벤트가 발생하면
		   감춤 처리한 구글 번역 콤보리스트에
		   선택한 언어를 적용해 변경 이벤트를 발생시키는 코드  */
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
	</script>

	<script>
var voices = [];
var speaking = false; // 음성 재생 중 여부를 나타내는 변수
var speechUtterance = null; // SpeechSynthesisUtterance 객체를 저장하는 변수

function setVoiceList() {
    voices = window.speechSynthesis.getVoices();
}

setVoiceList();

if (window.speechSynthesis.onvoiceschanged !== undefined) {
    window.speechSynthesis.onvoiceschanged = setVoiceList;
}

function speech(txt) {
    if (!window.speechSynthesis) {
        alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
        return;
    }

    var lang = 'ko-KR';
    speechUtterance = new SpeechSynthesisUtterance(txt);

    speechUtterance.onend = function (event) {
        console.log('end');
        speaking = false; // 음성 재생 종료 후 변수를 false로 설정
    };

    speechUtterance.onerror = function (event) {
        console.log('error', event);
    };

    var voiceFound = false;

    for (var i = 0; i < voices.length; i++) {
        if (voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
            speechUtterance.voice = voices[i];
            voiceFound = true;
        }
    }
    if (!voiceFound) {
        alert('voice not found');
        return;
    }

    speechUtterance.lang = lang;
    speechUtterance.pitch = 1;
    speechUtterance.rate = 1; //속도

    window.speechSynthesis.speak(speechUtterance);
    speaking = true; // 음성 재생 시작 시 변수를 true로 설정
}

function stopSpeech() {
    if (speeching) {
        window.speechSynthesis.cancel(); // 음성 재생 중이라면 재생을 중지
        speaking = false; // 변수를 false로 설정
    }
}

 document.getElementById("speechButton").addEventListener("click", function () {
    if (speaking) {
        window.speechSynthesis.cancel();
        speaking = false;
    } else {
       
       const contentElement = document.querySelector(".highlight");
        const contentText = contentElement.innerText;
        speech(contentText);
        
    }
}); 
</script> -->



</body>
</html>