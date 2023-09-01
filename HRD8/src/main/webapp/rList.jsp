<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dbpkg.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<h3>검사결과조회</h3>

<table border="1">
<tr>
	<th>환자번호</th>
	<th>환자명</th>
	<th>검사명</th>
	<th>검사시작일</th>
	<th>검사상태</th>
	<th>검사완료일</th>
	<th>검사결과</th>
</tr>

<% 
List<Map<Integer,String>> list = new Dao().rList();
for( Map<Integer,String> info :list){%>
<tr>
	<td> <%=  info.get(1) %></td>
	<td> <%=  info.get(2) %></td>
	<td> <%=  info.get(3) %></td>
	<td> <%=  info.get(4) %></td>
	<td> <%=  info.get(5) %></td>
	<td> <%=  info.get(6) %></td>
	<td> <%=  info.get(7) %></td>
</tr>
<%} %>
</table>

</section>
<jsp:include page="footer.jsp"/>
</body>
</html>