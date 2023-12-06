<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.salary.value==""){
		alert("급여를 입력하세요");
		document.frm.salary.focus(); 
		return false;  
	}
	
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>인사관리 호봉 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="insert_hobongProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>직급</th>
    <td>
      <select name = "dunggub" id=in1>
      <option value ="1" selected> 1급</option>
      <option value ="2"> 2급</option>
      <option value ="3"> 3급</option>
      <option value ="4"> 4급</option>
      <option value ="5"> 5급</option>
      </select>
    </td>
</tr>

<tr> 
      <th>급여</th>
      <td><input type="text" name="salary" id=in1></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>l>