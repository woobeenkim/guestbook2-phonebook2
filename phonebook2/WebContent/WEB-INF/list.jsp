<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaex.vo.PersonVo" %>
<%@ page import = "java.util.List" %>
<%
	List<PersonVo> PL = (List<PersonVo>)request.getAttribute("personlist");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전화번호 리스트</h1>

<p>입력한 정보 내역입니다.</p>
<% for(PersonVo pv : PL){ %>
	<table border ='1'>
	<colgroup>
		<col style="width: 120px;">
		<col style="width: 170px;">
	</colgroup>
		<tbody>
			<tr>
				<td>이름(name)</td><td><%=pv.getName() %></td>
			</tr>
			<tr>
				<td>핸드폰(hp)</td><td><%=pv.getHp() %></td>
			</tr>
			<tr>
				<td>회사(company)</td><td><%=pv.getCompany() %></td>
			</tr>
			
				<tr>
				<td><a href ="/pb2/pbc?action=uform&personid=<%=pv.getPersonId()%>">수정</a></td>
				<td><a href="/pb2/pbc?action=delete&personid=<%=pv.getPersonId()%>">삭제</a></td>
				</tr>
		</tbody>
	</table>
<%} %>
	<br><br><br>
		<a href="/pb2/pbc?action=wform">추가번호 등록</a>
		
		

</body>
</html>