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
   String id  = request.getParameter("id");  
   String gajok = request.getParameter("gajok");
   String jikchak = request.getParameter("jikchak");
   String gunsok = request.getParameter("gunsok");
   String gitasudang = request.getParameter("gitasudang");
 
   
   PreparedStatement pstmt = null;
   try{
      String sql = "update sudang0831 set gajok=?, jikchak=?, gunsok=?, gitasudang=? where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(5, id);    
      pstmt.setString(1, gajok);  
      pstmt.setString(2, jikchak);
      pstmt.setString(3, gunsok);
      pstmt.setString(4, gitasudang);

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="sudangSelect.jsp";
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