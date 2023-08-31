const ctx = document.getElementById('dailyContract');

console.log("11contractCountList:", newContractDataListJson);

var labelList = new Array();
var valueList = new Array();
var colorList = new Array();

for (var i = 0; i < newContractDataListJson.length; i++) {
    var d = newContractDataListJson[i];
    labelList.push(d.entry_date);
    valueList.push(d.contract_count);
    colorList.push(colorize());
}

      var data = {
         labels : labelList,
         datasets : [ {
            backgroundColor : colorList,
            data : valueList
         } ],
      };

      var options = {
         plugins : {
            title : {
               display : true,
               text : '일자별 회원가입현황'
            }
         },
         scales : {
            y : {
               beginAtZero : true,
               ticks : {
                  stepSize : 1
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
         type : 'bar',
         data : data,
         options : options
      });