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
   String dunggub = request.getParameter("dunggub");   
   String salary = request.getParameter("salary");


   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into hobong0831 values(?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dunggub);    
      pstmt.setString(2, salary);         

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장 완료되었습니다");
      location.href="hobongSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>