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
      String sql = "Insert into info0831 values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, name);  //두번째 물음표에 name이 넘어감
      pstmt.setString(3, dept);
      pstmt.setString(4, position);
      pstmt.setString(5, duty);
      pstmt.setString(6, phone); 
      pstmt.setString(7, address); 
      
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("사원등록이 완료되었습니다!");
      location.href="infoSelect.jsp";
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