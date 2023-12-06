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
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String dunggub  = request.getParameter("dunggub");  
   String salary = request.getParameter("salary");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "update hobong0831 set salary=? where dunggub=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(2, dunggub);    
      pstmt.setString(1, salary);  
   
      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="hobongSelect.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>