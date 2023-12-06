<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
    PreparedStatement pstmt = null;
    //ResultSet rs = null;
    String id = request.getParameter("id");   //폼에서 넘어온거는 String
    String gajok = request.getParameter("gajok");
    String jikchak = request.getParameter("jikchak");
    String gunsok = request.getParameter("gunsok");
    String gitasudang = request.getParameter("gitasudang");
    
    try {
    	String sql = "insert into sudang0831 values(?,?,?,?,?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	pstmt.setString(2, gajok);
    	pstmt.setString(3, jikchak);
    	pstmt.setString(4, gunsok);
    	pstmt.setString(5, gitasudang);
    	pstmt.executeUpdate();
    	
    	%>
    	<script>
    	alert("수당정보 등록 성공");
    	location.href = "sudangSelect.jsp";
    	</script>
    	<%

    }catch(Exception e) {
    	System.out.println("등록 오류:" +e.getMessage());
    }
%>

</body>
</html>