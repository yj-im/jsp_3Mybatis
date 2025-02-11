<%@page import="mybatis.vo.CustomerVo"%>
<%@page import="mybatis.dao.MybatisCustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mybatisTest.jsp</title>
</head>
<body>
	<%
		MybatisCustomerDao dao=new MybatisCustomerDao();
		CustomerVo vo=dao.selectByPk("hongGD");
		out.print(vo);
	%>
</body>
</html>