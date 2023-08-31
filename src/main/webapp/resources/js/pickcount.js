/*      const ctx = document.getElementById('pickProd');
     const productCountList = JSON.parse('${pickProdListJson}');
     console.log("productCountList:", newPickProdList);

     var labelList = new Array();
     var valueList = new Array();
     var colorList = new Array();

     for (var i = 0; i < newPickProdList.length; i++) {
       var d = newPickProdList[i];
       labelList.push(d.product_name);
       valueList.push(d.selection_ratio);
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
            text : '상품별 선택현황'
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
       type : 'doughnut', // 차트 유형을 doughnut으로 변경
       data : data,
       options : 
            {   maintainAspectRatio: false, // 가로 세로 비율 고정 해제
            responsive: true, // 반응형 설정
            width: 500, // 원하는 가로 크기
            height: 500, // 원하는 세로 크기
         }
     });*/

window.addEventListener('load',function() {
   pickCount();

})

var pickProdListJson;
var labelList = new Array();
var valueList = new Array();
var colorList = new Array();

const ctx = document.getElementById('pickProd');

function pickCount() {
	console.log(5555);
   $.ajax({
      url: "/product/pickProductBest",
      type: "POST",
      dataType: "json",
      contentType: "application/json; charset=utf-8",
      success: function(resp) {
         console.log('Data received:', resp);
         pickProdListJson = resp;
         console.log('pickProdListJson:', pickProdListJson);
         for (var i = 0; i < pickProdListJson.length; i++) {
            var d = pickProdListJson[i];
            labelList.push(d.product_name);
            valueList.push(d.selection_ratio);
            colorList.push(colorize());
         }

         var data = {
            labels: labelList,
            datasets: [{
               backgroundColor: colorList,
               data: valueList
            }],
         };

         var options = {
            plugins: {
               title: {
                  display: true,
                  text: '상품별 선택현황'
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
            type: 'doughnut', // 차트 유형을 doughnut으로 변경
            data: data,
            options:
            {
               maintainAspectRatio: false, // 가로 세로 비율 고정 해제
               responsive: true, // 반응형 설정
               width: 500, // 원하는 가로 크기
               height: 500, // 원하는 세로 크기
            }
         });

      },

      error: function(error) {
         console.log("error", error);
      }
   });

}