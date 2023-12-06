<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.id.value==""){
		alert("사원번호를 입력하세요");
		document.frm.id.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.name.value==""){
		alert("성명을 입력하세요");
		document.frm.name.focus(); 
		return false; }	  	
	 	
	if(document.frm.duty.value==""){
		alert("직책을 입력하세요");
		document.frm.duty.focus(); 
		return false;  
	}
	if(document.frm.phone.value==""){
		alert("연락처를 입력하세요");
		document.frm.phone.focus(); 
		return false;  
	}
	if(document.frm.address.value==""){
		alert("주소를 입력하세요");
		document.frm.address.focus(); 
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
<h1>인사관리 사원 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<% 
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   String sql = "select max(id) from info0831";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int id = 0;
   if(rs.next()) {
	   id = rs.getInt(1)+1;
   }
%>

<form name="frm" method="post" action="insert_infoProcess.jsp">

<table border=1 id="tab2">

<tr> 
      <th>사원번호(자동생성)</th>
      <td><input type="text" name="id" value="<%=id %>" id=in1> 마지막번호+1</td>
</tr>


<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in1></td>
</tr>

<tr> 
      <th>소속부서</th>
    <td>
      <select name = "dept" id=in3>
      <option value ="10" selected> 인사부</option>
      <option value ="20"> 기획부</option>
      <option value ="30"> 홍보부</option>
      <option value ="40"> 영업부</option>
      <option value ="50"> 경리부</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직급</th>
      <td>
         <input type="Radio" name="position" value="1" onclick="condition()">1급
         <input type="Radio" name="position" value="2" onclick="condition()">2급
         <input type="Radio" name="position" value="3" onclick="condition()">3급
         <input type="Radio" name="position" value="4" onclick="condition()">4급
         <input type="Radio" name="position" value="5" onclick="condition()">5급
     </td>
</tr>

<tr> 
      <th>직책</th>
      <td><input type="text" name="duty" id=in1></td>
</tr>


<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in1></td>
</tr>


<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in1></td>
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