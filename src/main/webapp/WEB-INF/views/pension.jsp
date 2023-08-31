<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pension calculator</title>
<link href="/resources/css/style2.css" rel="stylesheet">
<style>
body {
   font-family: Arial, sans-serif;
   margin: 0;
   padding: 0;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
   background-color: #f2f2f2;
   
}

.calculator {
   background-color: #fff;
   border-radius: 10px;
   box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
   padding: 10px;
   text-align: center;
   width: 500px;
}

.calculator2 {
   background-color: #fff;
   border-radius: 10px;
   box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
   padding: 10px;
   text-align: center;
   width: 500px;
   height: 70px;
   margin-left: 10px;

}

.calculator2 img {
   width: 250px; 
   height: 70px; 
 }
  
.calculator_title {
   font-size: 24px;
   margin-bottom: 20px;
}

label {
   display: block;
   margin-bottom: 5px;
   font-weight: bold;
}

input {
   width: 50%;
   padding: 8px;
   margin-bottom: 10px;
   border: 1px solid #ccc;
   border-radius: 5px;
}

button {
   background-color: #007bff;
   color: #fff;
   border: none;
   border-radius: 5px;
   padding: 8px 15px;
   cursor: pointer;
}

button:hover {
   background-color: #0056b3;
}

#result {
   margin-top: 20px;
   display: none;
}

#result-value {
   font-weight: bold;
}
</style>
</head>

<body
   style="background-image: url('/resources/images/bg7.png'); 
   background-size: 100% 100%; /* 이미지가 화면을 덮도록 크기 조절 */
   background-repeat: no-repeat;"
   /* 이미지 반복 방지 * />

<div class="container">
   <div class="row">
      <div class="calculator2">
         <div>
            <img src="/resources/images/logo.png";>
         </div>
      </div>
   </div>
   <br />
   <div class="container">
      <div class="calculator">
         <p class="calculator_title">연금 계산기</p>
         <form id="calculator-form">
            <label for="current-age">현재 나이:</label> <input type="number"
               id="current-age" required> <label for="retirement-age">연금개시
               나이:</label> <input type="number" id="retirement-age" required> <label
               for="retirement-years">연금수령기간 (연):</label> <input type="number"
               id="retirement-years" required> <label
               for="monthly-payment">월 납입금액 (원):</label> <input type="number"
               id="monthly-payment" required> <label for="interest-rate">연간
               수익률 (%):</label> <input type="number" id="interest-rate" required>

            <label for="tax-rate">세금율 (%):</label> <input type="number"
               id="tax-rate" required>
            <div>
               <button type="button" id="calculate-button">계산</button>
               <button type="button" id="reset-button">재입력</button>
            </div>
         </form>
      </div>
      <br />
      <div class="calculator">
         <p class="calculator_title">연금 예상액</p>
         <div id="result" class="hidden">
               납입 기간: <span id="months"></span> 개월 / 연금수령 기간: <span id="pensionPeriod"></span> 개월<br/>
               <p>연금 총액: <b><span id="result-value" style ="color:red; font-size:25px;"></span> 원</b> (월 수령액: <b><span
                  id="monthly-payout" style ="color:red; font-size:25px;"></span> 원</b>)<br/>
               ※ 은퇴후 생활비 : 월 <span style ="color:red">280만원</span> (출처:국민연금연구원)</p>  
               
               
<!--                ※ 수익률 1% 상승시 예상액 : <span id="result-value-increased"></span> 원 <br />
               ※ 수익률 1% 하락시 예상액 : <span id="result-value-decreased"></span> 원 -->
         </div><br/>
         <div>
         <button type="button" class="btn-primary" id="join-button">가입하러가기</button>
         </div>
      </div>
   </div>

   <script>
      document
            .addEventListener('DOMContentLoaded',
                  function() {
                     const calculateButton = document
                           .getElementById('calculate-button');
                     const resetButton = document
                           .getElementById('reset-button');
                     const joinButton = document
                           .getElementById('join-button');

                     calculateButton.addEventListener('click',
                           calculatePension);
                     resetButton.addEventListener('click',
                           resetCalculator);
                     joinButton.addEventListener('click', goToJoinPage);
                  });

      function calculatePension() {
         const currentAge = parseInt(document.getElementById('current-age').value);
         const retirementAge = parseInt(document
               .getElementById('retirement-age').value);
         const retirementYears = parseInt(document
               .getElementById('retirement-years').value);
         const monthlyPayment = parseFloat(document
               .getElementById('monthly-payment').value);
         const annualInterestRate = parseFloat(document
               .getElementById('interest-rate').value) / 100;
         const taxRate = parseFloat(document.getElementById('tax-rate').value) / 100;

         const months = (retirementAge - currentAge) * 12;
         let futureValue = calculateFutureValue(monthlyPayment, months,
               annualInterestRate, taxRate);
         /* let futureValueIncreasedInterest = calculateFutureValue(
               monthlyPayment, months, annualInterestRate + 0.01, taxRate);
         let futureValueDecreasedInterest = calculateFutureValue(
               monthlyPayment, months, annualInterestRate - 0.01, taxRate);
 */
         const monthlyPayout = futureValue / (retirementYears * 12);

         let formattedFutureValue = formatCurrency(Math.floor(futureValue));
/*          let formattedFutureValueIncreasedInterest = formatCurrency(Math
               .floor(futureValueIncreasedInterest));
          let formattedFutureValueDecreasedInterest = formatCurrency(Math
               .floor(futureValueDecreasedInterest)); */
          let formattedMonthlyPayout = formatCurrency(Math
               .floor(monthlyPayout)); 

         displayResult(formattedFutureValue,
               /* formattedFutureValueIncreasedInterest,
               formattedFutureValueDecreasedInterest, */
               formattedMonthlyPayout, months);
      }

      function calculateFutureValue(monthlyPayment, months,
            annualInterestRate, taxRate) {
         let futureValue = 0;
         const monthlyInterestRate = Math
               .pow(1 + annualInterestRate, 1 / 12) - 1;

         for (let i = 1; i <= months; i++) {
            futureValue += monthlyPayment;
            futureValue *= (1 + monthlyInterestRate);
         }

         futureValue *= (1 - taxRate);

         return futureValue;
      }

      function formatCurrency(value) {
         return value.toLocaleString('en-US');
      }

      function displayResult(futureValue, /* futureValueIncreasedInterest, */
            /* futureValueDecreasedInterest, */ monthlyPayout, months) {
         const resultElement = document.getElementById('result');
         const resultValueElement = document.getElementById('result-value');
         /* const resultValueIncreasedInterestElement = document
               .getElementById('result-value-increased');
         const resultValueDecreasedInterestElement = document
               .getElementById('result-value-decreased'); */
         const monthlyPayoutElement = document
               .getElementById('monthly-payout');
         const monthsElement = document.getElementById('months');
         const pensionPeriodElement = document.getElementById('pensionPeriod'); // 추가된 부분

         resultValueElement.textContent = futureValue;
         /* resultValueIncreasedInterestElement.textContent = futureValueIncreasedInterest;
         resultValueDecreasedInterestElement.textContent = futureValueDecreasedInterest; */
         monthlyPayoutElement.textContent = monthlyPayout;
         monthsElement.textContent = months;
         const retirementYears = parseInt(document.getElementById('retirement-years').value);
         const pensionPeriodInMonths = retirementYears * 12;
         pensionPeriodElement.textContent = pensionPeriodInMonths;
         
         resultElement.style.display = 'block';
      }

      function resetCalculator() {
         // 입력 필드 초기화
         document.getElementById('current-age').value = '';
         document.getElementById('retirement-age').value = '';
         document.getElementById('retirement-years').value = '';
         document.getElementById('monthly-payment').value = '';
         document.getElementById('interest-rate').value = '';
         document.getElementById('tax-rate').value = '';

         // 결과 숨기기
         const resultElement = document.getElementById('result');
         resultElement.style.display = 'none';
      }

      function goToJoinPage() {
         window.opener.location.href = '/contract/join'; // 원래 창 위치 변경
         window.close(); // 팝업 창 닫기
      }
   </script>
   </body>
</html>