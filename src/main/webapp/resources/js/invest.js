
// 문제 객체(생성자 함수)
function Question(text, choice, scores) {
   this.text = text; // 질문 텍스트
   this.choice = choice; // 선택할 답들(배열)
   this.scores = scores; // 선택지에 해당하는 점수들(배열)
}

// 퀴즈 정보 객체
function Quiz(questions) {
   this.score = 0; // 점수
   this.questions = questions; // 문제
}

// 정답 확인 메서드
Quiz.prototype.getScoreForAnswer = function(answer, questionIndex) {
   return this.questions[questionIndex].scores[answer];
};

// 선택한 답변들의 점수를 합산하는 메서드
Quiz.prototype.calculateTotalScore = function(answers) {
   let totalScore = 0;
   for (let i = 0; i < answers.length; i++) {
      totalScore += this.getScoreForAnswer(answers[i], i);
   }
   return totalScore;
};

function saveResult(totalScore) {   
//   var form = document.createElement('form');
//   let input = document.createElement("input");
//   form.action = "/invest/saveInvestResult";
//   form.method = "post";
//   input.value = totalScore;
//   input.type = "hidden";
//   input.name = "score";
//   form.append(input);
//
//   document.body.appendChild(form);
   ////////////   

   
      fetch('/invest/saveInvestResult?score='+totalScore, {
         method: 'GET',
   //      body:JSON.stringify({
   //         score:totalScore
   //      })
      })
      .then(function(response) {   
//         let json = JSON.parse(response)
//         alert(json)      
//         alert(json.result)
         if (response.ok) {
            window.close(); 
         }
      })
      .catch(function(error) {
         console.error('Error:', error);
         
      });

   ///////////
//      form.addEventListener("submit", function(event) {
//      event.preventDefault(); 
//   
//      fetch(form.action, {
//         method: form.method,
//         body: new FormData(form)
//      })
//      .then(function(response) {   
//         let json = JSON.parse(response)
//         alert(json)      
//         alert(json.result)      
//         if (response.ok) {
//            window.close(); 
//         } else {
//            console.error('Error:', response.status);
//            
//         }
//      })
//      .catch(function(error) {
//         console.error('Error:', error);
//         
//      });
//   });
   
   
//   form.submit();
}

function showResultPopup(quiz) {
   var answers = []; // 선택한 답변들을 저장할 배열
   var quizForm = document.getElementById('quiz');
   var allQuestionsAnswered = true; // 모든 질문에 대한 답변이 완료되었는지를 나타내는 변수
   
   // 각 질문의 답변 여부를 확인
    for (var i = 1; i <= 7; i++) {
        var answerName = "answer" + i;
        var selectedAnswer = $("input[name='" + answerName + "']:checked").val();
        
        // 선택된 답변이 없는 경우
        if (selectedAnswer === undefined) {
            allQuestionsAnswered = false;          
            break;
        }
    }
 // 모든 질문에 대한 답변이 완료되지 않은 경우, 알림을 띄우고 함수 종료
    // 모든 질문에 대한 답변이 완료되지 않은 경우, 알림을 띄우고 함수 종료
    if (!allQuestionsAnswered) {
      Swal.fire({
         icon: 'warning',
         title:'알림',
         text: '질문에 모두 답해주세요!',
      });       
        return;
    }

   // 사용자가 선택한 답변들을 배열에 저장합니다.
   for (var i = 0; i < quizForm.elements.length; i++) {
      var element = quizForm.elements[i];
      if (element.type === 'radio' && element.checked) {
         answers.push(parseInt(element.value)); // 답변 값을 정수로 변환하여 배열에 추가합니다.
      }
   }
   
   // 선택하지 않은 질문이 있는지 검사합니다.
  //  var questionCount = quizForm.querySelectorAll('fieldset').length;
 //   if (answers.length !== questionCount) {
    // 선택하지 않은 질문이 있을 경우, 알림을 띄웁니다.
 //       alert('질문에 모두 답해주세요!');
 //     return; // 함수 실행 종료
//  }

   // 선택한 답변들을 합하여 총 점수를 계산합니다.
   var totalScore = answers.reduce((sum, answer) => sum + answer, 0);
   
   

   // 결과 메시지를 생성합니다.
   var resultMsg = "<div style='font-size: 25px; text-align: center;'><b>당신의 점수 총: " + totalScore + "점<b><br><br></div>";
   if (totalScore < 15) {
      resultMsg += "<div style='font-size: 22px; text-align: center; color: blue;'>고객님의 투자 성향은<span style='color: red;'> '저위험'</span> 입니다.<br> 투자 원금은 보존되어야 합니다.</div>";
   } else if (totalScore >= 15 && totalScore < 20) {
      resultMsg += "<div style='font-size: 22px; text-align: center; color: blue;'>고객님의 투자 성향은 <span style='color: red;'>'중위험'</span> 입니다.<br> 투자 원금의 손실 위험을 감수하면서 예/적금보다 높은 수익 또는 임금 상승률만큼의 기대 수익을 얻는 것을 목표로 합니다.</div>";
   } else if (totalScore >= 20) {
      resultMsg += "<div style='font-size: 22px; text-align: center;  color: blue;'>고객님의 투자 성향은 <span style='color: red;'>'고위험'</span> 입니다.<br> 기대 수익이 높다면 위험이 높아도 상관하지 않습니다.</div>";
   }
   
   

   // 선택한 답변들과 해당 점수를 콘솔에 출력합니다.
   console.log('선택한 답변들:', answers);
   console.log('총 점수:', totalScore);
   
   // 8/17일자 업데이트(다인)
    var popupWidth = 600;
    var popupHeight = 500;

    // Calculate the position to center the popup on the screen
    var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    
    var popupLeft = (screenWidth - popupWidth) / 2;
    var popupTop = (screenHeight - popupHeight) / 2;

   // 결과 팝업 창을 열어 결과 메시지를 표시합니다.
   var resultPopup = window.open('', '투자성향 결과', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + popupLeft + ', top=' + popupTop);    
   resultPopup.document.write('<div style="text-align: right;"><img src="/resources/images/logo.png" alt="Your Image" style="width: 150px; height: auto;"></div><br>');  
   resultPopup.document.write('<script src="/resources/js/invest.js"></script>');
   resultPopup.document.write('<style>');
   resultPopup.document.write('  .center-text { text-align: center; margin-top: 0; }'); // 가운데 정렬 스타일 수정
   resultPopup.document.write('</style>');
   resultPopup.document.write('<h1 class="center-text"><b>[투자성향 결과]</b><br></h1><p class="center-text">' + resultMsg + '<br><br></p>');    
   resultPopup.document.write('<div style="text-align: center;"><button onclick="saveResult(' + totalScore + ')" style="font-size: 18px; padding: 10px 30px; background-color: #007bff; color: white; border: none; border-radius: 5%;">확인</button></div>');      
   // resultPopup.document.getElementById('submitBtn').addEventListener('click', function() {
   // saveResult(totalScore); 
   // } );
   
}

var questions = [
   new Question("문제 1 : 고객님의 연령대는 어떻게 되십니까?", ["29세 이하", "30세~40세", "41세~50세", "51세~60세", "61세 이상"], [5, 4, 3, 2, 1]),
   new Question("문제 2 :고객님의 투자기간은 어떻게 되십니까?", ["12개월 미만", "12개월이상~3년미만", "3년이상~5년미만", "5년이상~10년미만", "10년 이상"], [1, 2, 3, 4, 5]),
   new Question("문제 3 : 투자경험과 가장 가까운 금융 투자상품은 어느것입니까?", ["은행 예금/적금", "채권형 펀드/ 원금보장 파생결합증권", "혼합형 펀드/ 원금비보장 파생결합증권", "주식형 펀드", "파생상품투자 펀드, 해외펀드"], [1, 2, 3, 4, 5]),
   new Question("문제 4 : 금융상품 투자에 대한 수준은 어느 정도 입니까?", ["투자해본 경험이 없다.", "채권혼합형 펀드에 투자 경험 있다", "금융투자상품의 구조 및 위험을 이해한다", "파생상품을 포함한 금융투자상품의 구조를 이해하고 있다."], [1, 2, 3, 4]),
   new Question("문제 5 : 고객님의 보유자산 중 은퇴자산의 규모는 얼마입니까?", ["1천만원 미만", "1천만원 이상~5천만원 미만", "5천만원 이상~ 1억원 미만", "1억원 이상~ 5억원 미만", "5억원 이상"], [5, 4, 3, 2, 1]),
   new Question("문제 6 : 고객님의 퇴직시까지의 수입원을 가장 잘 나타내는 것은?", ["현재 일정한 수입이 발생하고, 향후에도 현재수준을 유지하거나 증가할 것으로 예상", "현재 일정한 수입이 발생하고 있으나 향후 감소할 것으로 예상", "현재 일정한 수입이 발생하고 있으나 향후 매우 불안정할 것으로 예상"], [3, 2, 1]),
   new Question("문제 7 : 투자원금에 손실이 발생하는 경우 감내할 수 있는 손실 수준은?", ["무슨일이 있어도 투자 원금 만큼은 보존되어야 함", "투자 수익율을 고려하나 원금 보존이 더 중요", "원금 보존을 고려하나 투자 수익이 더 중요", "손실위험이 있더라도 투자 수익이 더 중요"], [0, 1, 2, 4])
];

var quiz = new Quiz(questions);
