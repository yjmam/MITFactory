
var ownerName = $('[data-name]').data('name');
var ownerButtonclick = false;
$(document).ready(function() {
   // 예금주 조회 버튼 클릭 이벤트 핸들러
   $(".ownerButton").on("click", function() {
      var ownerName =

         $('[data-name]').data('name');

      console.log(ownerName);
      // 해당 행의 예금주 이름 셀 업데이트
      $(this).closest("tr").find(".contractNameCell").text(ownerName);
      ownerButtonclick = true;

   });
   
  /* $(".input[type='text']").on("input",function(){
	   var value=$(this).val().replace(/,/g,'');
	   $(this).val(Number(value).toLocaleString());
   });*/
});

/*
function submitForm() {
   // 자동이체금액, 한도금액을 가져옴
   var autoAmount = document.getElementsByName("autoAmount")[0].value;
   var subtractedValue = parseInt($('[data-subtractedValue]').data('subtractedValue'));

   // set_amount를 가져오고 숫자로 변환
   var setAmountInput = document.getElementsByName("setAmount")[0].value;
   var setAmount = parseInt(setAmountInput.replace(/,/g,''));

   // set_amount가 숫자가 아니거나, 한도금액 범위를 벗어나면 오류 메시지를 표시하고 폼 제출을 중단
   if (isNaN(setAmount) || setAmount < 0 || setAmount > subtractedValue) {
      alert('한도금액 범위 내에서 숫자를 입력해주세요.');
      return false;
   }

   document.getElementById("myForm").submit();
}
*/