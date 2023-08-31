
      function saveInputAmount(inputAmount) {
         console.log("in ajax")
         console.log(inputAmount)
         $.ajax({
            type : "POST",
            url : "/deposit/saveInputAmount",
            data : {
               "inputAmount" : inputAmount
               
            },
            success : function(response) {
               console.log(response)
               console.log("입력한 금액이 성공적으로 저장되었습니다.");
            
            },
            error : function() {
               console.log("서버와의 통신에 실패하였습니다.");
            }
         });
      }
   
      function checkAmount() {      
         var setAmount = parseInt(document.getElementById("setAmount").getAttribute("data-setAmount")); // 화면에서 받아온 ${setAmount} 값을 JavaScript 변수에 저장
         var inputAmount = parseInt(document.getElementById("amount").value.replace(/,/g, ""), 10); // 입력한 금액을 가져옴 (콤마 제거)
      


         if (inputAmount > setAmount) {
            // 입력한 금액이 ${setAmount}보다 크면 알림 띄우기
            Swal.fire({
               icon : 'error',
               title : '가입한도 초과입니다. 다시 입력하세요.',
               preConfirm : function() {
                  // 확인 버튼을 클릭했을 때 실행되는 함수
                  document.getElementById("amount").value = "";
               }
            });

         } else {
            // 입력한 금액이 ${setAmount} 이하면 알림 띄우기
            Swal.fire({
               icon : 'success',
               title : '입력이 완료되었습니다',
            });
         }
      }

      var IMP = window.IMP;
      IMP.init("imp42831614"); // 예: imp00000000

       function requestPay() {
           let inputAmount = parseInt(document.getElementById("amount").value.replace(/,/g, ""), 10);
        
          // let inputAmount = parseInt(document.getElementById("amount").value, 10);
        //   console.log("amount값 가져오니?:" + inputAmount);
           IMP.request_pay({
               pg: "html5_inicis",
               pay_method: "card",
               merchant_uid: 'merchant_' + new Date().getTime(), //가맹점에서 구별할 수 있는 고유한id
            //   merchant_uid: "ORD20180131-00002005",
               name: "IRP 개인 추가부담금",
               amount: inputAmount,
               buyer_email: "gildong@gmail.com",
               buyer_name: "${logInName}",
               buyer_tel: "010-4242-4242",
               buyer_addr: "서울특별시 강남구 신사동",
               buyer_postcode: "01181"
           }, function(rsp) {
               if (rsp.success) {
                   // 카카오 결제가 성공한 경우에만 서버에 저장하기 위해 saveInputAmount() 함수를 호출
                   saveInputAmount(inputAmount);
                   // 결제 성공 시 로직
                   Swal.fire({
                       icon: 'success',
                       title: '입금처리가 완료되었습니다.',
                        preConfirm : function() {
                  // 확인 버튼을 클릭했을 때 실행되는 함수
                  document.getElementById("amount").value = "";
               }
                       
                   });
               } else {
                   // 결제 실패 시 로직
                   Swal.fire({
                       icon: 'error',
                       title: '결제에 실패하였습니다.',
                   });
               }              
               console.log(inputAmount);
           });
       } 