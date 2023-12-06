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

<h1>급여 정보 출력</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>사원번호</th>
    <th>이름</th>
    <th>급여</th>
    <th>가족수당</th>
    <th>직책수당</th>
    <th>근속수당</th>
    <th>기타수당</th>
    <th>급여합계</th>
      
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    int no =0;
     try{
    	 String sql = "select c.id, a.name, to_char(b.salary,'999,999,999'), to_char(c.gajok,'999,999,999'), to_char(c.jikchak,'999,999,999'), to_char(c.gunsok,'999,999,999'), to_char(c.gitasudang,'999,999,999'), to_char((c.gajok+c.jikchak+c.gunsok+c.gitasudang+b.salary),'999,999,999') from info0831 a, hobong0831 b, sudang0831 c where a.id=c.id";

    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String name= rs.getString("name");
    		 String salary = rs.getString(3);
    		 String gajok = rs.getString(4);
    		 String jikchak = rs.getString(5);
    		 String gunsok = rs.getString(6);
    		 String gitasudang = rs.getString(7);
    		 String total = rs.getString(8);
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><%=id %> </td>
    <td><%=name %> </td>
    <td><%=salary %> </td>
    <td><%=gajok %> </td>
    <td><%=jikchak %> </td>
    <td><%=gunsok %> </td>
    <td><%=gitasudang %> </td>
    <td><%=total %> </td>
 

<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>