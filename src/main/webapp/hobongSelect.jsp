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

<h1>호봉 정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>등급</th>
    <th>급여</th>
    <th>구분</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    int no =0;
     try{
    	 String sql = "select*from hobong0831";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String dunggub= rs.getString("dunggub");
    		 String salary= rs.getString("salary");
    		 
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><%=dunggub %> </td>
    <td><%=salary %> </td>


    <td>
     <a href="hobongUpdate.jsp?dunggub=<%=dunggub %>"> 수정</a>/
    
     <a href="hobongDelete.jsp?dunggub=<%=dunggub %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
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
	 location.href="insert_hobong.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>