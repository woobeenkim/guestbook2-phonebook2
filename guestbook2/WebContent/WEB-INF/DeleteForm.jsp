<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.dao.ListDao" %>
<%@ page import = "com.javaex.vo.PersonVo" %>

<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));	
ListDao  lb = new ListDao();
PersonVo pv = lb.getPerson(no);
//삭제를 선택한 PersonVo를 가져오기 위하여 리스트 선언후 리스트상 해당 인원의 정보 가져오기 위한 준비
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="/gb2/ct1" method ="get">
비밀번호 : 
<input type = "text" name="password" >
<input type = "hidden" name ="no" value = "<%=pv.getNo()%>">
<input type = "hidden" name = "action" value="delete">
<button type ="submit">확인</button>
</form>
<br>
<a href ="/gb2/ct1">메인으로 돌아가기</a>
</body>
</html>