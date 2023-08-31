 $(document).ready(function () {
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
                $('#sumDisplay').text(total+'%');
            }

            $("input[name='investRatio']").on('input', updateSum);

            function validateSum() {
                const total = calculateTotal();
                if (total !== 100) {
                	Swal.fire({
                        icon: 'warning',
                        title: '투입비율의 합은 \n 100%가 되어야합니다.',
                        text: ''
                    });
                    return false;
                }
                return true;
            }

            $("#submitBtn").click(function () {
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

                $.ajax({
                    url: "/pickProd/updateRatio",
                    type: "POST",
                    data: JSON.stringify(pickProdDTOList),
                    contentType: 
                    	"application/json; charset=utf-8",
                    error : function(error) {
                        console.log("error");
                    },
                    success : function(redirectUrl) { 
                    	console.log(redirectUrl);
                    	Swal.fire({
                            title: "상품비율이 설정되었습니다.",
                            icon: "success",
                            showConfirmButton: true, // 확인 버튼을 표시하지 않음
                           
                    	}).then((result) => {
                        	if (result.isConfirmed) {
                        		var PolicyNumber = pickProdDTOList[0].policyNumber;
                       			window.location.href="/account/register/" + PolicyNumber;  //연결부분 다시확인                      		
                        	}
                        });
                    }
                });
            });
        });