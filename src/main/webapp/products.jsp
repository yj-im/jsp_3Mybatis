<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/customers.css">
<link rel="stylesheet" href="assets/css/modal.css">
</head>
<body>
<%@ include file="header.jsp" %>
	<h3>판매 관리</h3>
	<hr>
	<div class="search">
	<!-- form action 이 없을 때 동작은? 자기자신 url 입니다.  method 기본값은 GET -->
		<form>
		<select name="category">
			<option value="">카테고리 선택</option>
			<c:forEach items="${cateList }" var="cate">
				<option value="${cate.code}" >
					<c:out value="${cate.name }" />(<c:out value="${cate.code }" />)
				</option>
			</c:forEach>
		</select>
		<input type="text" name="keyword" placeholder="상품명 검색어 입력하세요."> 
		<span style="padding-left: 10px;">가격대별</span>
		<input type="text" name="from" placeholder="10000"><b>~</b>
		<input type="text" name="to" placeholder="50000">
		<button id="search" type="button">조회</button>
		<button id="selectAll" type="button">전체보기</button>
		</form>
	</div>
	
	<button id="new">새 상품 등록</button>&nbsp;&nbsp;&nbsp;<button id="delete">상품 삭제</button>
	<ul id="list">
		
	</ul>	
	<!-- The Modal -->
	<div class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">새 상품 등록</h4>
				</div>
				<div class="modal-body">
				<ul>
					<li>
						<input type="text" id="pcode" placeholder="상품코드를 입력하세요.">
					</li>
					<li>
						<select id="category">
							<option value="">카테고리 선택</option>
							<c:forEach items="${cateList }" var="cate">
								<option value="${cate.code}" >
									<c:out value="${cate.name }" />(<c:out value="${cate.code }" />)
								</option>
							</c:forEach>
						</select>
					</li>
					<li>
						<input type="text" id="pname" placeholder="상품명을 입력하세요.">
					</li>
					<li>
						<input type="number" id="price" placeholder="가격을 입력하세요.">
					</li>
					<li>
						<button id="post">저장</button>&nbsp;&nbsp;&nbsp;
						<button id="clear">다시쓰기</button>
					</li>
				</ul>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<!--  <button type="button" class="btn btn-primary">Save changes</button>-->
					</div>
				</div>
			</div>
		</div>
		<!-- modal 끝 -->	
	<!-- 부트스트랩 js로 모달 메소드 사용하기 위함 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	const modal = new bootstrap.Modal(document.querySelector('.modal'));
	
	//js 파일에서는 서버 애트리뷰트를 가져올 수 없습니다.
	//		 jsp파일안에 있는 script 태그에서만 가능합니다.
	// 동기 통신에서는 submit 을 하면 사용자가 선택한 카테고리가 초기상태로 바뀝니다.
	//			   선택 카테고리를 받아와서 설정하는 방법
	// 비동기 통신에서는 화면이 바뀌지 않으므로 아래 코드가 필요없습니다.
	//	const temp = '${cate}'
	</script>
	<!-- temp 변수값은 search.js 와 공유합니다. -->
	<script type="text/javascript" src="assets/js/productApi_list.js"></script>
	<script type="text/javascript" src="assets/js/productApi_post.js"></script>
	<script type="text/javascript" src="assets/js/productApi_search.js"></script>
	<script type="text/javascript" src="assets/js/productApi_delete.js"></script>
</body>
</html>








