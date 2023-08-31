//alert("connect")
const agreeCheckboxes = document.querySelectorAll('.agree-checkbox');
const modals = document.querySelectorAll('.modal');

/*정보동의 다 해야지만 next버튼 활성화*/


function handleNextPage() {

	if (!areAllCheckboxesChecked()) {
		Swal.fire({
			title: "경고",
			text: "고객님 동의사항을 확인하세요.",
			icon: "warning",
			confirmButtonText: "확인"
		});
		return;
	}

	const userId = document.querySelector("input#userId").value
	const selectedValue = document.querySelector('input[name="step"]:checked').id;
	//alert(userId)
	if (selectedValue === 'generalStep') {
		window.location.href = `/contract/create/${userId}?step=generalStep`; // 일반운용지시
	} else if (selectedValue === 'simpleStep') {
		window.location.href = `/contract/create/${userId}?step=simpleStep`;   //간편운용지시 
	}
}

function areAllCheckboxesChecked() {
	return Array.from(agreeCheckboxes).every(checkbox => checkbox.checked);
}



// 동의하기 누르면 모달 닫힘
function agreeAndCloseModal(modalId) {

	const targetModal = document.getElementById(modalId);
	test = targetModal
	targetModal.style.display = 'none';

	/*	// Reset the checkbox state
		const checkbox = targetModal.querySelector('.form-check-input');
		test2 = checkbox
		checkbox.checked = false;*/
}

agreeCheckboxes.forEach((checkbox) => {
	checkbox.addEventListener('change', function() {
		const modalId = this.getAttribute('data-modal-target');
		const targetModal = document.getElementById(modalId);

		if (this.checked) {
			targetModal.style.display = 'block';
		} else {
			targetModal.style.display = 'none';
		}
	});
});




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

	speechUtterance.onend = function(event) {
		console.log('end');
		speaking = false; // 음성 재생 종료 후 변수를 false로 설정
	};

	speechUtterance.onerror = function(event) {
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

document.getElementById("speechButton").addEventListener("click", function() {
	if (speaking) {
		window.speechSynthesis.cancel();
		speaking = false;
	} else {

		const contentElement = document.querySelector(".highlight");
		const contentText = contentElement.innerText;
		speech(contentText);

	}
}); 
