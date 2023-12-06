<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>사원 정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>사번</th>
    <th>성명</th>
    <th>직급</th>
    <th>직책</th>
    <th>연락처</th>
    <th>소속부서</th>
    <th>주소</th>
    <th>관리</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select*from info0831";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String name= rs.getString("name");
    		 String position = rs.getString("position");
    		 String duty = rs.getString("duty");
    		 String phone = rs.getString("phone");
    		 String dept = rs.getString("dept");
    		 String address = rs.getString("address");
    		    		
    		 if(dept.equals("10")){
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
    		 
    		no++;
%>
<tr>
    <td><%=no %> </td>
    <td><a href = "infoUpdate.jsp?id=<%=id %>"><%=id %></a> </td>
    <td><%=name %> </td>
    <td><%=position %> </td>
    <td><%=duty %> </td>
    <td><%=phone %> </td>
    <td><%=dept %> </td>
    <td><%=address %> </td>
    <td>
      
      <a href="infoDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_info.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>