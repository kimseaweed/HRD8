<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbpkg.*" %>

<% 
int result = 
new Dao().insertP(
	request.getParameter("a"),
	request.getParameter("b"),
	request.getParameter("c"),
	request.getParameter("d"),
	request.getParameter("e"),
	request.getParameter("f")
);

if(result == -1){
	out.println(" <script> alert('등록실패'); history.back() </script> ");
}else{
	out.println(" <script> alert('검사결과가 정상적으로 등록되었습니다!'); location.href='index.jsp' </script> ");
}

%>
