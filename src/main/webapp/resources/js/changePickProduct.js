
   function calculateTotal() {
       let total = 0;
       const ratios = document.querySelectorAll('input[type="number"]');
       ratios.forEach(ratio => {
           total += parseInt(ratio.value || 0);
       });
       return total;
   }
            
   function updateSum() {
       const total = calculateTotal();
       $('#sumDisplay').text(total);
   }

   $("input[name='investRatio']").on('input', updateSum);

   function validateSum() {
       const total = calculateTotal();
       if (total !== 100) {
           alert("비율의 총 합은 100이 되어야합니다.");
           return false;
       }
       return true;
   }

            $("#changeSubmitBtn").click(function () {
      if (!validateSum()) {
          return;
      }

      var pickProdDTOList = [];
      $("tbody tr").each(function () {
          var pickProdDTO = {};
          pickProdDTO.policyNumber = $(this).find("input[name='policyNumber']").val();
          pickProdDTO.productId = $(this).find("input[name='productId']").val();
          pickProdDTO.productName = $(this).find("input[name='productName']").val();
          pickProdDTO.investRatio = $(this).find("input[name='investRatio']").val();
          pickProdDTOList.push(pickProdDTO);
      });
      var policyNumber = pickProdDTOList[0].policyNumber;
                
   //console.log(pickProdDTOList)
   //console.log(JSON.stringify(pickProdDTOList))
                
      $.ajax({
          url: "/pickProd/changeRatio",
          type: "POST",
          data: JSON.stringify(pickProdDTOList),
          // JSON → 문자열   JSON.stringify({name:'aaa'})
          // 문자열 → JSON   JSON.parse('{"name":"aaa"}')
          contentType: "application/json; charset=utf-8",

          success : function(resp) { 
             console.log("resp", resp);
             let json = JSON.parse(resp)
             console.log("json", json);
            Swal.fire({
                 title: "펀드변경 신청이 완료되었습니다.",
                 icon: "success",
                 showConfirmButton: false, // 확인 버튼을 표시하지 않음
                 timer: 7000
                 }).then(function(result){
                    //console.log(result)
                    window.location.href = "/";
                 })
                 
          },error : function(error) {
            console.log("error",error);
        }
      });
      
              //window.location.href = "/pickProd/changeRatio?policyNumber=" + policyNumber;
 })