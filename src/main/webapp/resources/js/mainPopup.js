$(document).ready(function() {

   // 오늘 날짜를 가져옵니다 (년, 월, 일까지만)
   var today = new Date().toISOString().slice(0, 10);

   // 이미지의 실제 크기를 먼저 가져와서 팝업창 크기를 조정합니다.
   var img = new Image();
   img.src = "/resources/images/event.png";
   img.onload = function() {
      var popupWidth = img.width + 5; // 이미지 너비 + 패딩 값
      var popupHeight = img.height + 100; // 이미지 높이 + 추가 여백

      // 이벤트 확인 여부를 브라우저 쿠키에서 가져옵니다.
      var eventConfirmed = getCookie("eventConfirmed");

      // 오늘 날짜에 이벤트 확인을 하지 않았다면 팝업을 엽니다.
      if (eventConfirmed !== today) {
         Swal.fire({
            html: `
                       <div><a href='/user/friendRecommend'>
                           <img src="/resources/images/event.png" style="max-width: 100%; max-height: 100%;"></a>
                       </div>
                       <div style="margin-top: 10px;">
                           <label>
                               <input type="checkbox" id="checkToday"> 오늘만 열기
                           </label>
                       </div>
                   `,
            width: popupWidth,
            height: popupHeight + 30, // 추가된 체크박스 공간 고려
            showCancelButton: true,
            confirmButtonText: '이벤트 확인',
            cancelButtonText: '닫기'
         }).then((result) => {
            // 이벤트 확인 버튼이나 닫기 버튼을 누른 경우 모두 처리합니다.
            if (result.isConfirmed || result.dismiss === Swal.DismissReason.cancel) {
               // 체크박스 상태를 확인하고, 체크되어 있다면 쿠키에 오늘 날짜를 저장합니다.
               var checkToday = document.getElementById("checkToday").checked;
               if (checkToday) {
                  setCookie("eventConfirmed", today, 1); // 쿠키 유효 기간: 1일
               }
               if (result.isConfirmed) {
                  window.location.href = '/user/friendRecommend';
               }
            }
         });
      }
   };
});

// 쿠키를 설정하는 함수
function setCookie(name, value, days) {
   var expires = "";
   if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      expires = "; expires=" + date.toUTCString();
   }
   document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// 쿠키를 가져오는 함수
function getCookie(name) {
   var nameEQ = name + "=";
   var ca = document.cookie.split(';');
   for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
   }
   return null;
}