//  href="/user/friendRecommend"
//  href="/user/friendRecommend"

/*$(document).ready(function() {
   var loggedIn = $("#loggedInValue").val() === "true";
   var hasContract = $('#hasContract').val();
   var hasContract = document.getElementById("hasContract").value === "true";*/
 document.addEventListener("DOMContentLoaded", function() {
   const loggedIn = $("#loggedInValue").val() === "true";
   const hasContract = document.getElementById("hasContract").value === "true";
   console.log(hasContract);

   let url = "/user/friendRecommend"
   let swal = {
      icon: 'warning', 
      title: '로그인이 필요합니다',
      text: '로그인 페이지로 이동합니다.',
      confirmButtonText: '확인',
   }
   $("#friend1111").on("click", function() {
      if (!loggedIn) {
         Swal.fire(swal).then(function() {
            window.location.href = "/user/logIn";
         });
      } else if (!hasContract) {
         swal.title = '계약정보 없음'
         swal.text = '당사에 IRP 계약이 없습니다. 지금 IRP를 가입해보세요.'

         Swal.fire(swal).then((result) => {
            if (result.isConfirmed) {
               window.location.href = "/contract/join";
            }
         });
      } else {      
         window.location.href = url
      }

   });
});