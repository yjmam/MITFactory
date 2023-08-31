document.addEventListener("DOMContentLoaded", function() {
    if (!isContractDTOPresent) {
        Swal.fire({
            icon: 'warning',
            title: '계약정보 없음',
            text: '당사에 IRP 계약이 없습니다. 지금 IRP를 가입해보세요.'
        }).then((result) => {
            window.location.href = "/contract/join";
        });
    }
});
function changeNextPage() {
    const selectedRadio = document.querySelector('input[name="step"]:checked');
    const selectedValue = selectedRadio.id;
    
    if (selectedValue === 'investStep') {
        window.location.href = '/invest/showInvestPage'; // 투자성향분석
    } else if (selectedValue === 'reuseStep') {
        window.location.href = '/product/selectInvest'; // 상품선택
    }
}