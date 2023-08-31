$(document).ready(function() {
	
	var noContract = $('body').data('no-contract');
	if (noContract) {
		Swal.fire({
			icon: 'warning',
			title: 'IRP 계약이 없으시군요!',
			text: '지금 IRP를 가입해보세요.'
		}).then((result)=>{
			window.location.href = "/contract/join";
		});
	}
	

   $('#savePdf').click(function() { // pdf저장 button id


      html2canvas($('#pdfDiv')[0])
         .then(
            function(canvas) { //저장 영역 div id

               // 캔버스를 이미지로 변환
               var imgData = canvas
                  .toDataURL('image/png');

               var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
               var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
               var imgHeight = canvas.height
                  * imgWidth
                  / canvas.width;
               var heightLeft = imgHeight;
               var margin = 10; // 출력 페이지 여백설정
               var doc = new jsPDF(
                  'p',
                  'mm');
               var position = 20;

               // 첫 페이지 출력
               doc
                  .addImage(
                     imgData,
                     'PNG',
                     margin,
                     position,
                     imgWidth,
                     imgHeight);
               heightLeft -= pageHeight;

               // 한 페이지 이상일 경우 루프 돌면서 출력
               while (heightLeft >= 20) {
                  position = heightLeft
                     - imgHeight;
                  doc
                     .addPage();
                  doc
                     .addImage(
                        imgData,
                        'PNG',
                        0,
                        position,
                        imgWidth,
                        imgHeight);
                  heightLeft -= pageHeight;
               }

               var policyNumber = $('[data-policy-number]').data('policy-number');
                console.log("보험 증서 번호:", policyNumber); // 콘솔에 보험 증서 번호 출력
               
               var fileName = policyNumber+'_계약서';
               // 증서 번호를 파일 이름에 추가
               doc
                  .save(fileName);

            });
   });

})