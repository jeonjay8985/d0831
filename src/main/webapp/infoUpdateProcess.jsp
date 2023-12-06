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
   String id = request.getParameter("id");   //사원번호(id) 데이터
   String name = request.getParameter("name");
   String dept = request.getParameter("dept");

   String position = request.getParameter("position");
   String duty = request.getParameter("duty");
   String phone = request.getParameter("phone");
   String address = request.getParameter("address");
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update info0831 set name=?, dept=?, position=?, duty=?, phone=?, address=? where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, id);    
      pstmt.setString(1, name);  
      pstmt.setString(2, dept);
      pstmt.setString(3, position);
      pstmt.setString(4, duty);
      pstmt.setString(5, phone); 
      pstmt.setString(6, address); 
 
      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="infoSelect.jsp";
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