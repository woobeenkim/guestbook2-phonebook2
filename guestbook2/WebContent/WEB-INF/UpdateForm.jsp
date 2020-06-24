<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.javaex.dao.ListDao"  %>
<%@ page import = "com.javaex.vo.PersonVo" %>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	ListDao ld = new ListDao();
	PersonVo pv = ld.getPerson(no);
	System.out.println(pv.toString());
	//리스트에서 선택한 해당인원의 정보중 기본키 no을가져와서 그에 해당하는 모든 정보를 담아서 Controller에 보낸다.
	//Controller에서는 받아온 정보를 재입력하여 정보를 수정한다.
	//웹실행시 500에러가 나면 보내는 파라미터가 전부 잘 들어갔나 확인.
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
<form action ="/gb2/ct1" method = "get">
<table border = '1'>
<tbody>
	<tr>
		<td>이름</td>
		<td><input type = "text" name = "name" value="<%=pv.getName()%>"></td>
		<td>비밀번호</td>
		<td><input type = "text" name = "password" value="<%=pv.getPassword()%>"></td>
	</tr>
	<tr>
		<td colspan="4"><input type = "text" name = "content" value = "<%=pv.getContent()%>" size = "60"></td>
	</tr>
	<tr>
		<td colspan="4"><button type ="submit">확인</button></td>
	</tr>
	</tbody>
</table>
<input type ="hidden" name="reg_date" value="<%=pv.getReg_date()%>">
<input type ="hidden" name="no" value="<%=pv.getNo()%>">
<input type ="hidden" name="action" value="update">
</form>

</body>
</html>