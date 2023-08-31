/*   햄버거 이벤트*/
      var burger = $('.menu-trigger');

      burger.each(function(index) {
         var $this = $(this);

         $this.on('click', function(e) {
            e.preventDefault();
            $(this).toggleClass('active-' + (index + 1));
         })
      });

      var h = 0;

      $(burger).on("click", function() {
         if (h == 0) {
            $('.ham-con').animate({
               right : '0',
               opacity : 1
            }, 500);
            $(this).addClass('active-1');
            h++;
         } else if (h == 1) {
            $('.ham-con').animate({
               right : '-20%',
               opacity : 0
            }, 500);
            $(this).removeClass('active-1');
            h--;
         }
         $(window).scroll(function() {
            sct = $(window).scrollTop();
            if (sct > 30) {
               $('.ham-con').css({
                  opacity : 0,
                  right : '-20%'
               }, 500);
               $(burger).removeClass('active-1');
               h = 0;
            }
         });
      })
   /* ck에디터 */
   ClassicEditor
    .create(document.querySelector('#editor')).catch(error => {
      console.error(error);
   });
   console.log(editor);
      
   /* csv포멧 다운로드 */
  function downloadFile(filename){
        
        $.ajax({
            method:"GET",
            url : `/admin/csvFormDownLoad`,
            success : function(data) {
                window.location =`/admin/csvFormDownLoad?FileName=productExcelForm`;
            },
            error:function(request,status){
                alert("오류가 발생했습니다.");
            }
        });
    } 
    
    /* csv추가 */
      function excelUploadSubmit(){
        
        if($("#file").val() == ""){
            alert("파일을 업로드해주세요.");
            $("#file").focus();
            return false;
        }
        
        if(!confirm(gTxt("confirm.save"))){
            return false;
        }
        
        return true;
    } 
