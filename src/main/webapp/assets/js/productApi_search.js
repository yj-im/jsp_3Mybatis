/**
 * 비동기 통신을 지원하는 자바스크립트의 XHR 사용하기(PUT)
 * 작성자 : 조하연 
 */
 document.querySelector('#search').addEventListener('click', function() {
		
	const category = document.querySelector('select[name="category"]').value
	const keyword = document.querySelector('input[name="keyword"]').value
	const from = document.querySelector('input[name="from"]').value
	const to = document.querySelector('input[name="to"]').value
		
	console.log("category :",category)
	console.log("keyword :",keyword)
	console.log("from :",from)
	console.log("to :",to)
	if(category.length == 0 && keyword.length == 0
		&& from.length == 0 && to.length == 0
	){
		alert("검색어를 입력하세요")
		return		//함수 종료
	}

	// 2.입력값으로 자바스크립트 객체 생성(자바스크립트 객체는 미리 타입 정의를 하지 않고  사용 가능합니다)
	// 2-1. 검색 입력값을 프론트엔드에서 처리하기
/*
	const jsonObj = {}
	
	if(category.length !=0) jsonObj.category = category;
	if(keyword.length !=0) jsonObj.keyword = keyword;
	if(from.length !=0) jsonObj.from = from;
	if(to.length !=0) jsonObj.to = to;
	 
*/	
	// 2-2 . 검색 입력값을 백엔드에서 처리하기 - sql 매퍼의 동적쿼리 조건을 수정하기
	const jsonObj = {
		category:category,
		keyword:keyword,
		from:from,
		to:to
	}
	console.log("자바스크립트 객체 : " , jsonObj)
	
	// 3. 자바스크립트 객체를 json 전송을 위해 직렬화 (문자열로 변환)
	const jsonData = JSON.stringify(jsonObj)	
	
	// put 요청 시작
	search_product(jsonData)
	
})

const search_product = function(jsonData) {
	console.log("json 문자열 : " , jsonData)

	const xhr = new XMLHttpRequest()
	
	//PUT은  REST 방식에서 수정 동작을 의미하지만 , 검색값을 페이로드 전달하기 위해 사용해봅니다.
	//	    node.js 서버와 동작할 때는 주의해야 합니다. 우리 예제에서는 PUT 대신 POST 를 사용해도 됩니다.
	//		PUT, PATCH, DELETE 등 다른 메소드 방식도 REST API 에 있다는 것을 보여주는 예시 입니다.
	xhr.open('PUT', 'api/product')		//서버측 url 확인하세요.
	
	// 전송할 데이터의 형식을 요청 헤더로 전달합니다.
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8")
	xhr.send(jsonData)						// 요청 전송. PUT 보낼 때는 페이로드가 있습니다.
	xhr.onload = function() {	
		if(xhr.status === 200 || xhr.status === 201) { 
			console.log("PUT 응답: ", xhr.response)			
			const arr = JSON.parse(xhr.response)	
			console.log("PUT api/product", arr)	
			
			const list = document.querySelector('#list')
			list.innerHTML=''
			arr.forEach((ele,index) => {
				const li = document.createElement('li')
				const ul = document.createElement('ul')
				ul.className = 'row'
				ul.innerHTML = 
				`<li>${index+1}</li>
				<li>${ele.pcode}</li>
				<li>${ele.category}</li>
				<li>${ele.pname}</li>
				<li style=\"text-align: right; \">${ele.price.toLocaleString('ko-KR')}</li>`
				
				li.appendChild(ul)
				list.appendChild(li)
			})
		} else {
			console.log('오류 1- ', xhr.status)
		 	console.log('오류 2- ', xhr.response)
		}
	};		//onload 함수 끝
	
} //search_product 함수 끝
