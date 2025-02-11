/**
 *  상품 삭제 (REST 메소드 DELETE 매핑하는 연습)
 */
document.querySelector('#delete').addEventListener('click',function(){
	const pcode = prompt('삭제할 상품 코드를 입력하세요.')
	console.log('삭제 상품 코드 :',pcode)
	
	//비동기 통신(ajax) delete 메소드로 삭제를 구현해 보세요.
	//		delete는 페이로드 전달 못합니다. pcode 는 url 파라미터로 보내세요.
	const xhr = new XMLHttpRequest()
	xhr.open('DELETE','api/product?pcode='+pcode)
	xhr.send()
	xhr.onload = function(){
		if(xhr.status ===200 || xhr.status === 201){
			
		}
	}
	
	
})


