<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.javaex.dao.PhoneDao"  %>
<%
int personId = Integer.parseInt(request.getParameter("personid"));
PhoneDao phonedao = new PhoneDao();
phonedao.personDelete(personId);
response.sendRedirect("List.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>