<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
   content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
<meta name="keywords"
   content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
<title>M.IT IRP Factory</title>
<!-- Bootstrap -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<!-- <link href="/resources/css/style2.css" rel="stylesheet"> -->
<link href="/resources/css/style4.css" rel="stylesheet">
<!-- Google Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
   rel="stylesheet">
<!-- FontAwesome CSS -->
<link rel="stylesheet" type="text/css"
   href="/resources/css/fontello.css">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/css/owl.theme.default.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
   <!-- header-start -->
   <%@include file="/WEB-INF/views/header.jsp"%>
   <!-- header-close -->
   <div class="movewrap">
      <div>
         <div class="moving"></div>
      </div>
   </div>

   <div class="space-small"></div>

   <div class="container">
      <h1 class="logo2">JOIN US</h1>
      <div style="text-align: center;">
       <img src="/resources/images/registerIcon.png" alt="" style="width: 3%; height: 30px;">
       </div>
      <div class="container2">
         <div>
            <div class="form-group">
               <label class="control-label sr-only " for="username"></label> <input
                  id="username" type="text" placeholder="Id" class="form-control"
                  required>
            </div>
         </div>
         <div>
            <div class="form-group">
               <label class="control-label sr-only" for="password"></label> <input
                  id="password" type="password" placeholder="Password"
                  class="form-control" required>
            </div>
         </div>
         <div>
            <div class="form-group">
               <label class="control-label sr-only " for="ssn"></label> <input
                  id="ssn" type="text" placeholder="주민번호" class="form-control"
                  required>
            </div>
         </div>
         <div>
            <div class="form-group">
               <label class="control-label sr-only " for="name"></label> <input
                  id="name" type="text" placeholder="Name" class="form-control"
                  required>
            </div>
         </div>
         <div>
            <div class="form-group">
               <label class="control-label sr-only " for="email"></label> <input
                  id="email" type="text" placeholder="Email" class="form-control"
                  required>
            </div>
         </div>
         <div class="col-lg-6">
            <div class="form-group">
               <label class="control-label sr-only" for="phone"></label> <input
                  id="phone" type="text" placeholder="Tel" class="form-control"
                  required oninput="autoHyphen(this)" maxlength="13">
               <button id="phoneChk" class="doubleChk">
                  <b>인증번호발송</b>
               </button>
               <br />
            </div>
         </div>
         <div class="col-lg-6">
            <div class="form-group">
               <input id="phone2" type="text" name="phone2" placeholder="인증번호 입력"
                  class="form-control" required>
               <button id="phoneChk2" class="doubleChk">
                  <b>본인인증</b>
               </button>
               <input type="hidden" id="phoneDoubleChk">
            </div>
         </div>
         <div class="col-lg-6">
            <div class="form-group">
               <label class="control-label sr-only " for="recommenderId"></label>
               <input type="text" placeholder="추천인코드" class="form-control"
                  required>
            </div>
         </div>
         <div class="col-lg-6">
            <div class="form-group">
               <label class="control-label sr-only " for="recommenderId"></label>
               <c:if test="${empty recommenderId}">
                  <input id="recommenderId" type="text" class="form-control"
                     required>
               </c:if>
               <c:if test="${not empty recommenderId}">
                  <input id="recommenderId" type="text" value="${recommenderId}"
                     class="form-control" required>
               </c:if>
            </div>
         </div>
         <div class="col-lg-12 text-center" style="margin-top:20px;">
            <button class="btn-primary5" onclick="startRegistration()">회원가입</button>
         </div>
         <!--    </form> -->
      </div>
   </div>

   <!--    </form> -->

   <!-- form-close -->

   <div class="space-small"></div>

   <!-- footer start -->
   <%@include file="/WEB-INF/views/footer.jsp"%>
   <!-- footer close -->

   <script>
   
   const autoHyphen = (target) => {
       target.value = target.value
         .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
     }
  
  // 휴대폰 번호 인증
    var code2 = "";
    $("#phoneChk").click(function() {
        Swal.fire({
            icon: 'info',
            title: "인증번호 발송",
            text: "인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주십시오.",
        });

        var phone = $("#phone").val();

        $.ajax({
            type: "post", // post 형식으로 발송
            url: "/user/phoneCheck",
            data: {
                phone: phone
            },
            cache: false,
            success: function(data) {
                if (data == "error") {
                    Swal.fire({
                        icon: 'warning',
                        title: '실패!',
                        text: '휴대폰 번호가 올바르지 않습니다.',
                    });
                } else {
                    Swal.fire({
                        icon: 'success',
                        title: '성공!',
                        text: '인증번호가 전송되었습니다.',
                    });
                    code2 = data; // 성공하면 데이터 저장
                }
            }
        });
    });

    // 휴대폰 인증번호 대조x`
    $("#phoneChk2").click(function() {
        if ($("#phone2").val() == code2) {
            Swal.fire({
                icon: 'success',
                title: '인증성공',
                text: '본인인증이 완료되었습니다.',
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: '인증실패',
                text: '인증번호가 올바르지 않습니다.',
                preConfirm : function() {
                    // 확인 버튼을 클릭했을 때 실행되는 함수
                    document.getElementById("phone2").value = "";
                }  
            });
        }
    });    
  
  
  
    function isValidSSN(ssn) {
        // 주민번호 유효성 검사 정규식
        /* const ssnPattern = /^[0-9]{6}-?[0-9]{7}$/; */   
        const ssnPattern = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])[-]*[1-4]\d{6}$/;
        return ssnPattern.test(ssn);
    }
    
    function isValidEmail(email) {
        // 이메일 유효성 검사 정규식
        const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
        return emailPattern.test(email);
    }
    
  //  function isValidTel(콜) {
        // 입력된 연락처를 숫자로만 구성된 문자열로 변환
     //   const digitsOnly = phone.replace(/[^\d]/g, '');
        // 변환된 문자열이 유효한 숫자 10자리 또는 11자리인지 검사
    //    return /^[0-9]{10,11}$/.test(digitsOnly);
 //   }
        
    function startRegistration() {
        // 주민등록번호에서 생년, 월, 일 추출
        const ssn = $("#ssn").val();
        const currentYear = new Date().getFullYear() % 100; // 현재 연도의 뒤 2자리
        const ssnYear = parseInt(ssn.substring(0, 2));
        let birthYear;
        if (ssnYear <= currentYear) {
            birthYear = "20" + ssn.substring(0, 2); // 1900년대 또는 2000년대 생년
        } else {
            birthYear = "19" + ssn.substring(0, 2); // 1900년대 또는 2000년대 생년
        }
        const birthMonth = ssn.substring(2, 4);
        const birthDay = ssn.substring(4, 6);

     // 인증번호 대조
        if ($("#phone2").val() !== code2) {
            Swal.fire({
                icon: 'error',
                title: '인증실패',
                text: '본인인증을 다시 진행하시기 바랍니다.',
            });
            return;
        }
        let recommenderId = 0;
        if($("#recommenderId").val() != ""){
           recommenderId = parseInt($("#recommenderId").val(), 10);
        }
        console.log(recommenderId);
        
        let formData = {
            username: $("#username").val(),
            password: $("#password").val(),      
            ssn: ssn,
            name: $("#name").val(),   
            email: $("#email").val(),   
            tel: $("#phone").val(),
            phone2: $("#phone2").val(),
            birthYear: birthYear,
            birthMonth: birthMonth,
            birthDay: birthDay,
            recommenderId: recommenderId,
        };
        
      
       if (!isValidSSN(formData.ssn)) {
             Swal.fire({
                 title: "유효하지 않은 주민번호 형식입니다.",
                 icon: "error",
             });
             return;
         }
      
       if (!isValidEmail(formData.email)) {
             Swal.fire({
                 title: "유효하지 않은 이메일 형식입니다.",
                 icon: "error",
             });
             return;
         }   
       if (!formData.phone2) { // phone2 값이 없거나 falsy한 경우 확인
           Swal.fire({
               title: "휴대폰 인증을 진행하셔야 합니다.",
               icon: "error",
           });
           return;
       }
       
       
   //  if (!isValidTel(formData.phone)) {
   //          Swal.fire({
  //               title: "유효하지 않은 연락처 형식입니다.",
   //              icon: "error",
   //          });
   //          return;
   //     }
             
         $.ajax({
            type:"post",
            url: "/user/validate",
            data: formData,
            success: (resp) => {
               let obj = JSON.parse(resp);
               if(obj.result === 'success'){
                  Swal.fire({
                     title: obj.message,
                     icon: 'sueecss'
                  }).then(() => {
                     location.href= "/";
                  })
               } else if(obj.result === 'fail'){
                  Swal.fire({
                     title: obj.message,
                     icon: 'error'
                  });
               }
            } 
         });         
      }   
</script>
</body>
</html>