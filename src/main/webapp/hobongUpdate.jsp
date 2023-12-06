<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.dunggub.value==""){
		alert("호봉이 입력되지 않았습니다");
		document.frm.dunggub.focus(); //커서가 custno에 그대로 남아있도록 
		return false;            //회원번호를 입력하지 않으면 진행불가
	}
	if(document.frm.salary.value==""){
		alert("급여가 입력되지 않았습니다");
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
<h1>호봉 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
   String dunggub = request.getParameter("dunggub"); //select의 update.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select dunggub, salary from hobong0831 where dunggub=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, dunggub);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String salary = rs.getString("salary");
	
%>

<form name="frm" method="post" action="hobongUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>등급</th>
      <td><input type="text" name="dunggub" id=in value="<%=dunggub%>"></td>
</tr>

<tr> 
      <th>급여</th>
      <td><input type="text" name="salary" id=in value="<%=salary%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="button" value="조회" onclick="newPage()">
      <script>
     function newPage()  {
	 location.href="hobongSelect.jsp";
	}
     </script>
    </td>
</tr>

</table>

<%
	   }
    }catch(Exception e){
 	  System.out.println("회원정보 수정 에러" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>