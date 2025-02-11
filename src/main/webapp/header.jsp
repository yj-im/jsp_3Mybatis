<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul#header{ list-style: none ; 
		padding: 20px;
		display: flex;	
		border-bottom: 3px solid gray;
		width: 100%;
	}
	li { 	padding: 20px; 	}
	a { 	text-decoration: none; 	}
	hr { border: 3px solid gray;}
</style>
</head>
<body>
	<ul id="header">
		<li><a href="customer/join">고객 등록</a></li>
		<li><a href="customer/list">고객 목록</a></li>
		<li><a href="products">상품 관리</a></li>
		<li><a href="buys">판매 관리</a></li>
	</ul>
</body>
</html>