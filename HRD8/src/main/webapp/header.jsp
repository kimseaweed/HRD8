<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{padding:0;margin:0;}
h1,h2,h3{text-align: center; padding: 20px 30px;}
ul {
	display: flex;
}
li {
	list-style: none;
	padding: 15px 25px;
}
a{
	text-decoration: none;
}
body{background-color: lightgray}
header{background-color: gray}
nav{background-color: darkgray}
footer{
padding : 30px 0;
text-align:center;
background-color: gray; 
width:100%;
position: absolute;
bottom: 0;
}
table{
	margin: 30px auto;
}
th, td{
	padding: 10px 30px;
	text-align: center;
}

</style>
</head>
<body>
<header>
<h1>(과정평가형 정보처리산업기사)진단검사 프로그램 ver 2020-04</h1>
</header>
<nav> <ul>
	<li> <a href="pList.jsp"> 환자조회 </a> </li>
	<li> <a href="insertP.jsp"> 검사결과입력 </a> </li>
	<li> <a href="rList.jsp"> 검사결과조회 </a> </li>
	<li> <a href="rankList.jsp"> 지역별검사건수 </a> </li>
	<li> <a href="index.jsp"> 홈으로 </a> </li>
</ul> </nav>
</body>
</html>