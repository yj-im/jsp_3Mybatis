/**
 * 비동기 통신을 지원하는 자바스크립트의 XHR 사용하기 (POST)
 */
const clear = function(){
    document.querySelector('#pcode').value=''
    document.querySelector('#category').value=''
    document.querySelector('#pname').value=''
    document.querySelector('#price').value=''
}

//입력값을 가져와서 js 객체 -> json 문자열로 변환하여 서버에 전송하기
const save = function(){
	//비동기 통신에 필요한 데이터 json문자열 만들기
	const yn = confirm('상품 등록하시겠습니까?')
    if(!yn) return          //confirm 에서 취소누르면 false -> 함수 종료

    //1. 입력값 가져오기
    const pcode =document.querySelector('#pcode').value
    const category = document.querySelector('#category').value
    const pname = document.querySelector('#pname').value
    const price = document.querySelector('#price').value
    
    //2. 입력값으로 자바스크립트 객체 생성(자바스크립트 객체는 미리 타입을 정의하지 않고 사용할수 있습니다.)
    const jsObj={pcode:pcode,
        category:category,
        pname:pname,
        price:price }
    console.log('자바스크립트 객체 : ',jsObj)
    
    //3.자바스크립트 객체를 json 전송을 위해 직렬화 (문자열로 변환)
    const jsonData = JSON.stringify(jsObj)
	 console.log('json 문자열 : ',jsonData)
	
	// post 요청
	const xhr = new XMLHttpRequest()		//비동기 통신 객체 생성
    xhr.open('POST','api/product')			//전송 보낼 준비 (url과 method)
    //전송할 데이터의 형식을 요청 헤더로 전달합니다.
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.send(jsonData)				//요청 전송.POST는 페이로드가 있습니다.
    xhr.onload=function(){			//요청에 대한 응답받았을 때 onload 이벤트 생깁니다. onload 핸들러 함수
        if(xhr.status === 200 || xhr.status ===201){        // readyState 가 DONE
	       	console.log("post 응답 :",xhr.response)		//response 는 응답받은 내용을 저장한 프로퍼티
            const resultObj = JSON.parse(xhr.response)	//전송 응답 문자열를 객체로 역직렬화 
            if(resultObj.result ===1){
				alert('새로운 상품 등록이 완료되었습니다.')
				clear()					//입력값 지우깅
				modal.hide()			//모달창 없애기
				selectAll();			//전체 목록 다시 가져오기
			}else{
				alert('상품 등록 오류 입니다. pcode 중복 주의하세요.')
				
			}
        }else {
			console.error('오류1-',xhr.response)
            console.error('오류2-',xhr.status)
		}    
	}
}
document.querySelector('#new').addEventListener('click',function(){
	modal.show();
})
document.querySelector('#post').addEventListener('click',save)
document.querySelector('#clear').addEventListener('click',clear)










