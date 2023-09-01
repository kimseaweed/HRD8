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
<h3>검사결과입력</h3>

<form action="action.jsp" name="z">
	<table border="1">
	<tr>
		<th>환자번호</th>
		<td> <input type="text" name="a" > 예)1001 </td>
	</tr> 
	<tr>
		<th>검사코드</th>
		<td>
			<select name="b" >
				<option value="">검사명</option>
				<option value="T001">[T001]결핵</option>
				<option value="T002">[T002]장티푸스</option>
				<option value="T003">[T003]수두</option>
				<option value="T004">[T004]홍역</option>
				<option value="T005">[T005]콜레라</option>
			</select>
		</td>
	</tr> 
	<tr>
		<th>검사시작일자</th>
		<td> <input type="text" name="c" > 예)20200101 </td>
	</tr> 
	<tr>
		<th>검사상태</th>
		<td>
			<label>
				<input type="radio" name="d" value="1"> 검사중
			</label>
			<label>
				<input type="radio" name="d" value="2"> 검사완료
			</label>
		</td>
	</tr> 
	<tr>
		<th>검사완료일자</th>
		<td> <input type="text" name="e" >  예)20200101 </td>
	</tr> 
	<tr>
		<th>검사결과</th>
		<td>
			<label>
				<input type="radio" name="f" value="X"> 미입력
			</label>
			<label>
				<input type="radio" name="f" value="P"> 양성
			</label>
			<label>
				<input type="radio" name="f" value="N"> 음성
			</label>
		</td>
	</tr> 
	<tr>
		<td colspan="2"> 
			<input type="button" onclick="sumitform()" value="검사결과등록" > 
			<input type="reset" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!'); document.pform.a.focus();" value="다시쓰기" > 
		</td>
	</tr> 

	</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
function sumitform(){
	var z = document.z;
	if(z.a.value==""){
		alert('환자번호가가 입력되지 않았습니다');
		z.a.focus();
	} else if(z.b.value==""){
		alert('검사명이 선택되지 않았습니다');
		z.b.focus();
	} else if(z.c.value==""){
		alert('검사시작일자가 입력되지 않았습니다');
		z.c.focus();
	} else if(z.d.value==""){
		alert('검사상태가 선택되지 않았습니다');
		z.d.focus();
	} else if(z.e.value==""){
		alert('검사완료일자가 입력되지 않았습니다');
		z.e.focus();
	} else if(z.f.value==""){
		alert('검사결과가 선택되지 않았습니다');
		z.f.focus();
	} else {	 
	z.submit();
	}
}
</script>
</body>
</html>