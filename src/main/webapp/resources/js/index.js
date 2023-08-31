document.addEventListener("DOMContentLoaded", function() {
	const loggedIn = $("#loggedInValue").val() === "true";
	const hasContract = document.getElementById("hasContract").value === "true";
	const depositLink = document.getElementById("depositLink");
	const productLink = document.getElementById("productLink");
	/*	const isLoggedInElement = document.getElementById("isLoggedIn").value === "true";;
		const isLoggedIn = isLoggedInElement.value === "true"; // 요소의 값을 가져와서 불리언으로 변환*/

	console.log(hasContract);

	depositLink.addEventListener("click", function(event) {
		event.preventDefault(); // 링크의 기본 동작을 중지

		if (!loggedIn) {
			Swal.fire({
				title: '로그인 정보가 필요합니다.',
				text: '',
				icon: 'info',
				confirmButtonText: '로그인하러 가기',
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = "/user/logIn";
				}
			});
		} else if (!hasContract) {
			showContractAlert();
		} else {
			// hasContract가 있는 경우에는 지정한 경로로 이동
			window.location.href = "/deposit/showdeposit";
		}
	});
	/*	isLoggedIn.addEventListener("click", function(event) {
			if (!isLoggedIn) {
				console.log(isLoggedIn);
				event.preventDefault(); // 링크의 기본 동작을 중지
				showLoginAlert();
			}
		});*/

	productLink.addEventListener("click", function(event) {
		event.preventDefault();

		if (!loggedIn) {
			Swal.fire({
				title: '로그인 정보가 필요합니다.',
				text: '',
				icon: 'info',
				confirmButtonText: '로그인하러 가기',
			}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = "/user/logIn";
				}
			});
		} else if (!hasContract) {
			showContractAlert();
		} else {
			window.location.href = "/product/productChange";
		}
	});



	function showContractAlert() {
		Swal.fire({
			title: 'IRP 계약이 없으시군요!',
			text: '지금 IRP를 가입해보세요.',
			icon: 'warning',
			confirmButtonText: '가입하러 가기',
		}).then((result) => {
			if (result.isConfirmed) {
				window.location.href = "/contract/join";
			}
		});
	}
});




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


/* 구글 번역 초기화 */
function googleTranslateElementInit() {
	new google.translate.TranslateElement({
		pageLanguage: 'ko',
		autoDisplay: true
	}, 'google_translate_element');
}


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
