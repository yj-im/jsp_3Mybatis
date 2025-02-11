/**
 * 비동기 통신을 지원하는 자바스크립트의 XHR 사용하기 (GET)
 */
const selectAll =function(){
    const xhr = new XMLHttpRequest()		//비동기 통신 객체 생성
    xhr.open('GET','api/buy/list')			//전송 보낼 준비 (url과 method)
    xhr.send()								//요청 전송.
    xhr.onload=function(){					//요청에 대한 응답받았을 때 onload 이벤트 생깁니다. onload 핸들러 함수
        if(xhr.status === 200 || xhr.status ===201){        // readyState 가 DONE
        	console.log("요청 응답 :",xhr.response)		//response 는 응답받은 내용을 저장한 프로퍼티
            const arr = JSON.parse(xhr.response)    //응답받은 json 문자열을 자바스크립트 객체의 배열로 변환(역직렬화)
            console.log("get api/buy/list", arr)
			
			//json 문자열 응답을 자바스크립트 배열 객체로 변환하여 요소하나씩을 ele 변수에 대입한 후
			//화면에 값을 태그요소에 출력하는 코드 
			const list = document.querySelector('#list')
			list.innerHTML=''
			arr.forEach((ele,index) => {
				const li = document.createElement('li')
				const ul = document.createElement('ul')
				ul.className='row'
				ul.innerHTML=
				`<li>${index+1}</li>
				 <li>${ele.customid}</li>
				 <li>${ele.pcode}</li>
				 <li style=\"text-align: center;\">${ele.quantity.toLocaleString('ko-KR')}</li>
				 <li>${ele.buyDate}</li>`
				li.appendChild(ul) 
				list.appendChild(li)
			})
			

        }else {
            console.error('오류1',xhr.status)
            console.error('오류2',xhr.response)
        }
    }
}
document.querySelector('#selectAll').addEventListener('click',selectAll)
//처음 화면이 표시될 때 실행되기
//selectAll()