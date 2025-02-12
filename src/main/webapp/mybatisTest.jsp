<%@page import="mybatis.dao.MybatisProductDao2"%>
<%@page import="mybatis.vo.ProductVo"%>
<%@page import="mybatis.dao.MybatisProductDao"%>
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
			
			ProductVo pvo=new ProductVo(
				"SPAM9E",
				"B2",
				"스팸 9개입 선물세트",
					45000
				);
			MybatisProductDao2 dao2=new MybatisProductDao2();
			//int result=dao2.insert(pvo);
			//out.print("result : "+result);
			out.print(dao2.selectByPk("SPAM9E")); out.print("<br/>");
			
			// "새우" 검색어로 상품을 조회하고 출력
			
		
			out.print(dao2.searchByKeyword("새우")); out.print("<br/>");
			
			
			out.print("delete result : "+dao2.delete("SPAM9E"));
			
		
	%>
	
	
</body>
</html>