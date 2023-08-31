
window.addEventListener('load', function() {
   dailyContract();
   contractCount();

})
var newContractDataListJson;
let contractStatusList;
var labelList = new Array();
var valueList = new Array();
var colorList = new Array();
const ctx = document.getElementById('dailyContract');


function dailyContract() {
   $.ajax({
      url: "/admin/dailyContractCount",
      //data: JSON.stringify(data),
      type: "POST",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      success: function(resp) {
         console.log('Data received:', resp);
         newContractDataListJson = resp;
         console.log('newContractDataListJson:', newContractDataListJson);
         for (var i = 0; i < newContractDataListJson.length; i++) {
            var d = newContractDataListJson[i];
            labelList.push(d.entry_date);
            valueList.push(d.contract_count);
            colorList.push(colorize());
         }

         var data = {
            labels: labelList,
            datasets: [{
               label: '일자',
               backgroundColor: colorList,
               data: valueList
            }],
         };

         var options = {
            plugins: {
               title: {
                  display: true,
                  text: '일자별 회원가입현황'
               }
            },
            scales: {
               y: {
                  beginAtZero: true,
                  ticks: {
                     stepSize: 1
                     // Y축 눈금 간격을 1로 설정
                  }
               }
            }
         };

         function colorize() {
            var r = Math.floor(Math.random() * 200);
            var g = Math.floor(Math.random() * 200);
            var b = Math.floor(Math.random() * 200);
            var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
            return color;
         }

         new Chart(ctx, {
            type: 'bar',
            data: data,
            options: options
         });



      },
      error: function(error) {
         console.log("error", error);
      }
   });
}


function contractCount() {
   $.ajax({
      url: "/admin/contractStatusCount",
      type: "POST",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      success: function(resp) {
         console.log('contract received:', resp);
         contractStatusList = resp;
         var contractTableHTML = "";
         contractTableHTML += "<tr>";
         contractTableHTML += "<td>" + contractStatusList[0].contract_count + "</td>";
         contractTableHTML += "<td>" + contractStatusList[2].contract_count + "</td>";
         contractTableHTML += "<td>" + contractStatusList[1].contract_count + "</td>";
         contractTableHTML += "<td>" + contractStatusList[3].contract_count + "</td>";
         contractTableHTML += "</tr>";

         // 테이블에 HTML 추가
         $('#contractTable tbody').html(contractTableHTML);

      },
      error: function(error) {
         console.log("error", error);
      }
   });

}


function contractDelete() {

   let swalConfig = {
      title: "삭제할 계약이 없습니다.",
      icon: "success",
      showConfirmButton: false, // 확인 버튼을 표시하지 않음
      timer: 7000
   }
   $.ajax({
      url: "/admin/contractDelete",
      type: "get",
      success: function(result) {
         console.log("result", result);
         if (result > 0) {
            swalConfig.title = `${result}건의 계약삭제가 완료되었습니다.`
            Swal.fire(swalConfig).then(function(result) {
               location.reload();
            });
         }
         else {
            Swal.fire(swalConfig).then(function(result) {
               location.reload();
            });
         }
      },
      error: function(error) {
         console.log("error", error);
      }
   });
}