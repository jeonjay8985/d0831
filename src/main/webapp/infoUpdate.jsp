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
		alert("이름을 입력하세요");
		document.frm.name.focus(); 
		return false;  
	}
	if(document.frm.dept.value==""){
		alert("직책을 입력하세요");
		document.frm.dept.focus(); 
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
<h1>사원 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String id = request.getParameter("id"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from info0831 where id=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, id); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
		   String dept = rs.getString("dept");
			  /*  if(dept.equals("10")){
		     	 dept="인사부";
				 }else if(dept.equals("20")){
				 dept="기획부";
				 }
				 else if(dept.equals("30")){
				 dept="홍보부";
				 }
				 else if(dept.equals("40")){
					 dept="영업부";
				 }
				 else if(dept.equals("50")){
				 dept="경리부";
				 }
			 */
		   String position = rs.getString("position");
		   String duty = rs.getString("duty");
		   String phone = rs.getString("phone"); 
		   String address = rs.getString("address"); 
	
		   
%>
<form name="frm" method="post" action="infoUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>사원번호</th>
      <td><input type="text" name="id" id=in1 value="<%=id%>"></td>
</tr>
<tr> 
      <th>사원명</th>
      <td><input type="text" name="name" id=in1 value="<%=name%>"></td>
</tr>

<tr> 
      <th>소속부서</th>
    <td>
      <select name = "dept" id=in3>
      <option value ="10" <% if(dept.equals("10")){ %>selected <%}%>> 인사부</option>
      <option value ="20" <% if(dept.equals("20")){ %>selected <%}%>> 기획부</option>
      <option value ="30" <% if(dept.equals("30")){ %>selected <%}%>> 홍보부</option>
      <option value ="40" <% if(dept.equals("40")){ %>selected <%}%>> 영업부</option>
      <option value ="40" <% if(dept.equals("50")){ %>selected <%}%>> 경리부</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직급</th>
      <td>
         <input type="Radio" name="position" value="1"<%=position.equals("1급") ? "checked" :""%>>1급
         <input type="Radio" name="position" value="2"<%=position.equals("2급") ? "checked" :""%>>2급
         <input type="Radio" name="position" value="3"<%=position.equals("3급") ? "checked" :""%>>3급
         <input type="Radio" name="position" value="4"<%=position.equals("4급") ? "checked" :""%>>4급
         <input type="Radio" name="position" value="5"<%=position.equals("5급") ? "checked" :""%>>5급
      <td>
</tr>

<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in1 value="<%=phone%>"></td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in1 value="<%=address%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>