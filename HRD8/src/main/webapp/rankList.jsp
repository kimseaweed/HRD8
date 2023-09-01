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
<h3>(지역별) 검사건수통계</h3>

<table border="1">
<tr>
	<th>지역코드</th>
	<th>지역별</th>
	<th>검사건수</th>
</tr>

<% 
List<Map<Integer,String>> list = new Dao().rankList();
for( Map<Integer,String> info :list){%>
<tr>
	<td> <%=  info.get(1) %></td>
	<td> <%=  info.get(2) %></td>
	<td> <%=  info.get(3) %></td>
</tr>
<%} %>
</table>

</section>
<jsp:include page="footer.jsp"/>
</body>
</html>