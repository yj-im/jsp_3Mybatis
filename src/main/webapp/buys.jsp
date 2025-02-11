<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/customers.css">
<link rel="stylesheet" href="assets/css/modal.css">
</head>
<body>
<%@ include file="header.jsp" %>
	<h3>구매 조회</h3>
	<hr>
	<div>
		<input type="text" name="customerid" 
						placeholder="고객 id를 입력하세요." >
		<button id="search">조회</button>				
		<button id="selectAll">전체보기</button>
	</div>
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
						<input type="text" id="custom_id" placeholder="고객 ID를 입력하세요.">
					</li>
					<li>
						<select id="pcode">
							<option value="">상품 선택</option>
							<c:forEach items="${pros }" var="pro">
								<option value="${pro.pcode}" >
									<c:out value="${pro.pname }" />(<c:out value="${pro.price }" />)
								</option>
							</c:forEach>
						</select>
					</li>
					<li>
						<input type="number" id="quantity" placeholder="수량을 입력하세요.">
					</li>
					<li>
						<button id="post">저장</button>&nbsp;&nbsp;&nbsp;<button id="clear">다시쓰기</button>
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
	
		</script>
	<!-- temp 변수값은 search.js 와 공유합니다. -->
	<script type="text/javascript" src="assets/js/buyApi_list.js"></script>
</body>
</html>








