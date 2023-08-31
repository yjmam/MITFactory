
    function firework() {
      var count = 200;
      var defaults = {
        origin: {
          y: 0.7
        }
      };

      function fire(particleRatio, opts) {
        confetti(Object.assign({}, defaults, opts, {
          particleCount: Math.floor(count * particleRatio)
        }));
      }

      fire(0.25, {
        spread: 26,
        startVelocity: 55,
      });
      fire(0.2, {
        spread: 60,
      });
      fire(0.35, {
        spread: 100,
        decay: 0.91,
        scalar: 0.8
      });
      fire(0.1, {
        spread: 120,
        startVelocity: 25,
        decay: 0.92,
        scalar: 1.2
      });
      fire(0.1, {
        spread: 120,
        startVelocity: 45,
      });

      // 폭죽 효과가 끝난 후에 복권 팝업을 보여주는 함수 호출
      setTimeout(showLotteryPopup, 3000); // 3초 후에 복권 팝업을 보여줍니다.
    }

    function showLotteryPopup() {
        var popupContent = `
            <div style="width:500px; height:250px; text-align: center; display: flex; justify-content: center; align-items: center;">
                <div id="lotteryScratch1" style="width: 500px; height: 200px;"></div>
            </div>
        `;

        Swal.fire({
            width: 550,
            height: 250, // 팝업창 높이에 추가 여백
            title: '! 당첨을 축하합니다 !',
            html: popupContent,
            showCancelButton: false,
            confirmButtonText: '닫기',
            willOpen: function () {
                var lotteryScratchGo1 = new lotteryScratch(
                    document.querySelector('#lotteryScratch1'),
                    500, 200, 100, '/resources/images/img_cont02.jpg'
                );

                var backgroundImages = [
                    "/resources/images/coupon1.png",
                    "/resources/images/coupon3.png",
                    "/resources/images/coupon4.png",
                    "/resources/images/coupon5.png",
                ];

                var randomBackgroundIndex = Math.floor(Math.random() * backgroundImages.length);
                var randomBackgroundUrl = backgroundImages[randomBackgroundIndex];

                lotteryScratchGo1
                    .LotteryScratchInit()
                    .LotteryScratchCallback(function () {
                        document.querySelector('#lotteryScratch1').style.backgroundImage = "url('" + randomBackgroundUrl + "') ";
                        document.querySelector('#lotteryScratch1').style.backgroundSize = "100% 100%"; // 사이즈 조정
                    })
                    .LotteryScratch();
            }
        });
    }

    // 페이지 로딩이 완료되면 firework() 함수 호출
    window.onload = function () {
      firework();
    };