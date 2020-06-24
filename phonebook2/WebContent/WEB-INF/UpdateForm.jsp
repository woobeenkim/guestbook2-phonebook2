<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.dao.PhoneDao"  %>
<%@ page import = "com.javaex.vo.PersonVo" %>
    
<%
	int personId = Integer.parseInt(request.getParameter("personid"));
	PhoneDao phonedao = new PhoneDao();
	PersonVo pv = phonedao.getPerson(personId);
	System.out.println(pv.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>정보 수정</h1>

<p>수정할 정보를 입력해 주세요.</p>

<form action="/pb2/pbc" method="get">
이름(name) : <input type="text" name="name" value="<%=pv.getName()%>"> <br>
핸드폰(hp) : <input type="text" name="hp" value="<%=pv.getHp()%>"> <br>
회사(company) : <input type="text" name="company" value="<%=pv.getCompany()%>"> <br>
<input type="hidden" name="personid" value="<%=pv.getPersonId()%>"><br>
<input type="hidden" name="action" value="update"><br>
<br><BR>
<button type="submit">수정</button>
</form>

</body>
</html>