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
	
})