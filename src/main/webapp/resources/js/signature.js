var _CANVAS = new function() {

   // 서명 : 이곳을 터치하세요.
   let baseSign = "배경이미지";

   this.start = function(_canvas, _width, _height) {
      let isDrawing = false;
      let x = 0;
      let y = 0;

      const drawCanvas = document.getElementById(_canvas);
      const context = drawCanvas.getContext('2d');

      drawCanvas.width = _width;
      drawCanvas.style.width = _width + "px";
      drawCanvas.height = _height;
      drawCanvas.style.height = _height + "px";

      drawCanvas.addEventListener('mousedown', e => {
         x = e.offsetX;
         y = e.offsetY;
         isDrawing = true;
      });

      drawCanvas.addEventListener('mousemove', e => {
         if (isDrawing === true) {
            this.drawLine(context, x, y, e.offsetX, e.offsetY);
            x = e.offsetX;
            y = e.offsetY;
         }
      });

      window.addEventListener('mouseup', e => {
         if (isDrawing === true) {
            this.drawLine(context, x, y, e.offsetX, e.offsetY);
            x = 0;
            y = 0;
            isDrawing = false;
         }
      });

      drawCanvas.addEventListener('touchstart', e => {
         isDrawing = true;
         context.beginPath();
         context.moveTo(getPosition(e).X, getPosition(e).Y);
         x = getPosition(e).X;
         y = getPosition(e).Y;
      });

      drawCanvas.addEventListener('touchmove', e => {
         if (isDrawing === true) {
            e.preventDefault();
            this.drawLine(context, x, y, getPosition(e).X, getPosition(e).Y);
            x = getPosition(e).X;
            y = getPosition(e).Y;

         }
      });

      drawCanvas.addEventListener('touchend', e => {
         context.closePath();
         x = 0;
         y = 0;
         isDrawing = false;
      });

      function getPosition(e) {
         // canvas의 실제 위치 (position:absolute)
         var drawCanvasPos = drawCanvas.getBoundingClientRect();
         return {
            X: e.changedTouches[0].pageX - drawCanvas.offsetLeft - drawCanvasPos.left,
            Y: e.changedTouches[0].pageY - drawCanvas.offsetTop - drawCanvasPos.top
         }
      }
   }

   this.drawLine = function(context, x1, y1, x2, y2) {
      context.beginPath();
      context.strokeStyle = 'black';
      context.lineWidth = 1;
      context.moveTo(x1, y1);
      context.lineTo(x2, y2);
      context.stroke();
      context.closePath();
   }

   this.getCanvas = function(_canvas) {
      const drawCanvas = document.getElementById(_canvas);
      var data = drawCanvas.toDataURL("image/png");
      return data;
   }

   this.clearCanvas = function(_canvas) {
      const drawCanvas = document.getElementById(_canvas);
      drawCanvas.getContext("2d").clearRect(0, 0, drawCanvas.width, drawCanvas.height);
   }

   this.downCanvas = function(_canvas) {
      var link = document.createElement('a');
      link.href = this.getCanvas(_canvas);
      link.download = "${contract.policyNumber}.png";
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
   }

   this.doneCanvas = function(_canvas) {
      const drawCanvas = document.getElementById(_canvas);
      var data = this.getCanvas(_canvas);

      this.clearCanvas(_canvas);
      var blankImage = this.getCanvas(_canvas);

      if (data != blankImage) {
         drawCanvas.parentNode.previousElementSibling.style.backgroundImage = "url('" + data + "')";
      } else {
         drawCanvas.parentNode.previousElementSibling.style.backgroundImage = "url('" + baseSign + "')";
      }
      drawCanvas.parentElement.style.display = "none";
   }

   // 이전 이미지를 가져와서 canvas에 삽입
   this.setPreImage = function(_canvas) {
      const drawCanvas = document.getElementById(_canvas);
      const context = drawCanvas.getContext('2d');
      var preImage = drawCanvas.parentNode.previousElementSibling.style.backgroundImage;
      preImage = preImage.replace(/(url\(|\)|")/g, '');
      if (preImage != baseSign) {
         var img = new Image();
         img.src = preImage;
         img.onload = function() {
            context.drawImage(img, 0, 0);
         }
      }
   }
};



$(function() {
   _CANVAS.start("canvas_name1", 300, 100);
});

function save(_canvas) {
   var data = _CANVAS.getCanvas(_canvas);
   console.log("data is : " + data);

   var policyNumber = $('[data-policy-number]').data('policy-number');
   // AJAX를 사용하여 서명 데이터를 서버로 전송하고 저장하는 부분을 추가하세요.
   $.ajax({
      type: 'POST',
      url: '/contract/saveSignature/' + policyNumber,
      data: data,
      contentType: "application/json",
      success: function(response) {
         console.log("Signature data saved successfully.");
      },
      error: function(error) {
         console.error("Error saving signature data: " + error);
      }
   });
}


function del(_canvas) {
   _CANVAS.clearCanvas(_canvas);
}

function down(_canvas) {
   _CANVAS.downCanvas(_canvas);
}

function done(_canvas) {
   _CANVAS.doneCanvas(_canvas);
}


$("body").delegate(".canvas-draw-base", "click", function() {
   var _canvas = $(this).data("id");
   $("canvas#" + _canvas).parents(".canvas-draw-pad-box").show();
   //$(this).siblings(".canvas-draw-pad-box").show();

   // 이전 이미지를 가져와서 canvas에 삽입
   _CANVAS.setPreImage(_canvas);
});