document.addEventListener("DOMContentLoaded", function() {
    const step = document.body.getAttribute('data-step');
    console.log("step 값:", step);

    var selectedProducts = [];

    window.handleCheckbox = function(checkboxElem) {
        var checkboxes = document.getElementsByName("selectedProducts");
        var count = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                count++;
            }
        }

        if (step === "simpleStep" && count > 1) {
            Swal.fire({
                icon: 'warning',
                title: '간편운용지시 선택 확인',
                text: '간편운용지시 상품은 하나의 상품만 선택 가능합니다.'
            });
            checkboxElem.checked = false;
            return false;
        }

        var productId = checkboxElem.value;

        if (checkboxElem.checked) {
            if (selectedProducts.includes(productId)) {
                checkboxElem.checked = false;
                Swal.fire({
                    icon: 'warning',
                    title: '상품선택 오류',
                    text: '이 상품은 이미 선택된 상품입니다.'
                });
            } else {
                selectedProducts.push(productId);
            }
        } else {
            var index = selectedProducts.indexOf(productId);
            if (index > -1) {
                selectedProducts.splice(index, 1);
            }
        }
    };
});
