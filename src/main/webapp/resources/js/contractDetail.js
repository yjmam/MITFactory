
      $(document).ready(function() {
    $('button[data-toggle="modal"]').on('click', function() {
        console.log('스크립트 오니?');

        $(".modal-body button.btn-primary").on("click", function() {
            var policyNumber = $('#policyNumber').val(); // hidden input 요소의 값을 가져옴
            console.log(policyNumber);

               $.ajax({
                  type : 'POST',
                  url : '/contract/update/' + policyNumber,
                  data : {
                     'policyNumber' : policyNumber
                  },
                  // 전달할 데이터 설정
                  success : function(response) {
                     console.log('서버 요청 성공');
                     // 완료페이지로 이동 
                     location.href = "/contract/contractComplete";
                     // 완료페이지로 이동한 후 폭죽 효과 발생 추가
                     //firework();
                     sendSMS('sendSMS 실행')
                  },

                  error : function(error) {
                     console.error('서버 요청 오류', error);
                  }
               });
            });
         });
         $("#noticeModal").on("hidden.bs.modal", function() {
            ownerButtonclick = false;
         });
      });

 function sendSMS(action) {     
         var logInName = '${logInName}';
         console.log(logInName)
        $.ajax({
            type : 'POST',
            url : '/contract/sendSms',
            data : {
               'from' : '01077699442', // 발신번호
               'text' : '[MIT]<IRP가입완료안내>\n' + logInName
                     + '님, IRP가입이 완료되었습니다.\n 당사와의 첫 거래 감사드립니다.' // 문자내용

            }, 
            success : function(smsResponse) {
               console.log('CoolSMS로 문자 발송 성공', smsResponse);
               // 문자 발송 성공시 추가 작업 수행
            },
            error : function(smsError) {
               console.error('CoolSMS로 문자 발송 실패', smsError);
               // 문자 발송 실패시 추가 작업 수행
            }
         });
      } 