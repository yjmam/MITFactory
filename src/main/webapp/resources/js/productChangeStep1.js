document.addEventListener("DOMContentLoaded", function() {
   if (!isContractDTOPresent) {
      Swal.fire({
         icon: 'warning',
         title: '계약정보 없음',
         text: '당사에 IRP 계약이 없습니다. 지금 IRP를 가입해보세요.'
      }).then((result) => {
         window.location.href = "/contract/join";
      });
   }
});


   let userId = document.getElementById("userId");
   if (userId) {
      userId = userId.value;
   }
   
function changeNextPage() {
   const selectedRadio = document.querySelector('input[name="step"]:checked');
   const selectedValue = selectedRadio.id;

   if (selectedValue === 'investStep') {
      window.location.href = '/invest/showInvestPage'; // 투자성향분석
   } else if (selectedValue === 'reuseStep') {
      $.ajax({
         url: "/invest/checkInvest",
         type: "post",
         data: { userId: userId },
         success: function(resp) {
            console.log("resp", resp);
            let json = JSON.parse(resp);
            if (json.result) { // JSON에서 'result' 필드를 확인
               window.location.href = '/product/selectInvest'; // 상품선택
            } else {
               Swal.fire({
                  title: "투자성향 정보가 없습니다.",
                  text: "투자성향분석 하셔야 펀드변경이 가능합니다.",
                  icon: "error",
                  showConfirmButton: true,
                  timer: 5000,
               });
            }
         },
         error: function(error) {
            console.log("error", error);
            Swal.fire({
               title: "서버 오류",
               text: "서버에서 응답을 받아오지 못했습니다.",
               icon: "error",
               showConfirmButton: true,
               timer: 5000
            });
         }
      });
   }
}

const reuseStepRadio = document.getElementById("reuseStep");
if (reuseStepRadio) { reuseStepRadio.addEventListener("click", checkDTOAndAlert); }

function checkDTOAndAlert() {

   $.ajax({
      url: "/invest/checkInvest",
      type: "post",
      data: { userId: userId },
      success: function(resp) {
         console.log("resp", resp);
         let json = JSON.parse(resp);
         if (json.result) { // JSON에서 'result' 필드를 확인

            // 투자성향 정보가 있는 경우
            /*                    Swal.fire({
                              title: "투자성향 정보 확인",
                              text: "투자성향 정보가 있습니다.",
                              icon: "success",
                              showConfirmButton: false,
                              timer: 5000
                           }); */

         } else {

            // 투자성향 정보가 없는 경우
            Swal.fire({
               title: "투자성향 정보가 없습니다.",
               text: "",
               icon: "error",
               showConfirmButton: true,
               timer: 5000,

            });
         }
      },

      error: function(error) {
         console.log("error", error);
         Swal.fire({
            title: "서버 오류",
            text: "서버에서 응답을 받아오지 못했습니다.",
            icon: "error",
            showConfirmButton: true,
            timer: 5000
         });
      }
   });
}
