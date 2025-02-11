/*
 *   상품 조회 검색어 입력을 확인하기 위한 내용입니다.
 */
const category = document.querySelector('select[name="category"]')
const keyword = document.querySelector('input[name="keyword"]')
const from = document.querySelector('input[name="from"]')
const to = document.querySelector('input[name="to"]')

console.log(temp)
//카테고리 조회 했을 때만 temp 가 null 이 아닙니다.
if(temp != null) category.value=temp

document.getElementById('search').addEventListener('click',()=>{
	let isValid = true
    if(keyword.value.length == 0 && category.value.length == 0 
    	&& from.value.length == 0 && to.value.length == 0 ){
		isValid=false			
    	alert('검색어를 입력하세요.')
	}
    
    if(isValid)  document.forms[0].submit();	
  })