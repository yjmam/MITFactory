 var ownerButtonclick = false;
let ownerName = document.getElementById("ownerName");
if (ownerName) {
   ownerName = ownerName.value;
}

let policyNumber = document.getElementById("policyNumber");
if (policyNumber) {
   policyNumber = policyNumber.value;
}

let depositTf = document.getElementById("depositTf");
if (depositTf) {
   depositTf = depositTf.value;
}
console.log("depositTf", depositTf);

$(document)
   .ready(
      function() {
         // 예금주 조회 버튼 클릭 이벤트 핸들러
         $(".ownerButton").on(
            "click",
            function() {
               /* var ownerName = '${contractDTO.name}'; */
               // 해당 행의 예금주 이름 셀 업데이트
               $(this).closest("tr").find(
                  ".contractNameCell").text(
                     ownerName);
               ownerButtonclick = true;
            });

         //해지시 모달창
         $("#noticeModal").on("show.bs.modal", function(e) {
            // 체크박스 체크 여부를 확인하고, 체크되어 있지 않으면 모달창을 숨김
            var checkbox = $("input[type='checkbox']");
            if (!checkbox.prop("checked")) {
               e.preventDefault();
               Swal.fire("확인", "해지할 계약을 선택해주세요", "warning");
            }

           if (depositTf == "false") {
               if (!ownerButtonclick) {
                  e.preventDefault();
                  Swal.fire("확인", "예금주를 확인하세요", "warning");
               }
            }

         });

         // 모달창의 확인 버튼 클릭 시 해지신청 처리를 위한 서버 요청 코드 추가
         $(".modal-body button.btn-primary").on("click", function() {
            // AJAX를 이용하여 계약번호를 서버에 전달
            /* var policyNumber = '${contractDTO.policyNumber}'; */
            $.ajax({
               type: 'POST', // 또는 GET 등 요청 방식 선택
               url: '/contract/cancel/' + policyNumber, // 실제 서버 요청을 처리할 경로
               data: {
                  'policyNumber': policyNumber
               }, // 전달할 데이터 설정
               success: function(response) {
                  console.log('계약해지', response);
                  if (response) {
                     Swal.fire({
                        title: 'IRP계약이 해지되었습니다.',
                        text: '지급일자 2일에서 최대 8일이 소요됩니다.',
                        icon: 'warning',
                        confirmButtonText: '확인',
                     }).then((result) => {
                        if (result.isConfirmed) {
                           window.location.href = "/";
                        }
                     });
                  }

               }, error: function(error) {
                  // 서버 요청 중 오류가 발생했을 때 실행할 코드
                  console.log('서버 요청 오류', error);
                  // 필요한 오류 처리 작업 수행
               }, complete: function() {
                  // AJAX 요청이 완료되면 모달 숨기기
                  $('#noticeModal').modal('hide');
               }
            });
         });


         // 해지 모달이 숨겨질 때 ownerButtonclick 변수를 초기화
         $("#noticeModal").on("hidden.bs.modal", function() {
            ownerButtonclick = false;
         });
      });