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

<h1>수당 정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>사원번호</th>
    <th>이름</th>
    <th>가족수당</th>
    <th>직책수당</th>
    <th>근속수당</th>
    <th>기타수당</th>
    <th>수당합계</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    int no =0;
     try{
    	 String sql = "select a.id, a.name, to_char(c.gajok,'999,999,999'), to_char(c.jikchak,'999,999,999'), to_char(c.gunsok,'999,999,999'), to_char(c.gitasudang,'999,999,999'), to_char((c.gajok+c.jikchak+c.gunsok+c.gitasudang),'999,999,999') from info0831 a, sudang0831 c where a.id=c.id";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String name= rs.getString("name");
    		 String gajok = rs.getString(3);
    		 String jikchak = rs.getString(4);
    		 String gunsok = rs.getString(5);
    		 String gitasudang = rs.getString(6);
    		 String total = rs.getString(7);
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><%=id %> </td>
    <td><%=name %> </td>
    <td><%=gajok %> </td>
    <td><%=jikchak %> </td>
    <td><%=gunsok %> </td>
    <td><%=gitasudang %> </td>
    <td><%=total %> </td>
 

    <td>
     <a href="sudangUpdate.jsp?id=<%=id %>"> 수정</a>/
    
     <a href="sudangDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
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
	 location.href="insert_sudang.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>