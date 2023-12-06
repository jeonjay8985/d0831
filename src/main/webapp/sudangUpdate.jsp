<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function changesubmit()/*이벤트이름*/ {
    //alert("경고");
	document.frm.submit();//form이름 frm 
 }

function check() {
	if(document.frm.id.value==""){
		alert("사원번호를 입력하세요");
		document.frm.id.focus(); 
		return false;           
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;  
	}

	if(document.frm.gajok.value==""){
		alert("가족수당을 입력하세요");
		document.frm.gajok.focus(); 
		return false;  
	}
	if(document.frm.jikchak.value==""){
		alert("직책수당을 입력하세요");
		document.frm.jikchak.focus(); 
		return false;  
	}
	if(document.frm.gunsok.value==""){
		alert("근속수당을 입력하세요");
		document.frm.gunsok.focus(); 
		return false;  
	}
	if(document.frm.gitasudang.value==""){
		alert("기타수당을 입력하세요");
		document.frm.gitasudang.focus(); 
		return false;  
	}

	//frm.action="insert_sudang.jsp";

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>수당정보 등록</h1>
<%@ include file = "dbconn.jsp" %>
<%
    
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
    String id=request.getParameter("id");
/* 		String name="";
		 String gajok = "";
		 String jikchak = "";
		 String gunsok = "";
		 String gitasudang = ""; */

    try{
   	 String sql = "select a.id, a.name, c.gajok,c.jikchak,c.gunsok,c.gitasudang from info0831 a, sudang0831 c where a.id=c.id and a.id=?";
   	 pstmt = conn.prepareStatement(sql);
   	 pstmt.setString(1, id);
   	 rs = pstmt.executeQuery();
   	 if(rs.next()) {
   		String name= rs.getString("name");
   		String gajok = rs.getString(3);
   		String jikchak = rs.getString(4);
   		String gunsok = rs.getString(5);
   		String gitasudang = rs.getString(6);
   
    %>
    <%-- 
    String gajok=request.getParameter("gajok");
    String jikchak=request.getParameter("jikchak");
    String gunsok=request.getParameter("gunsok");
    String gitasudang=request.getParameter("gitasudang");
    
    if(gajok == null) {
    	gajok="";
    }
    if(jikchak == null) {
    	jikchak="";
    }

    if(gunsok == null) {
    	gunsok="";
    }
    if(gitasudang == null) {
    	gitasudang="";
    }
    
    String name="";
   
   	if(id==null){
   		id="";
   	}else{
		  try{
    	  String sql = "select name from info0831 where id=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, id);
    	  rs=pstmt.executeQuery();
    	  if(rs.next()){
    		  name = rs.getString(1);
    		 }else{
    		  %>
    		  <script>
    		  alert("등록되지 않은 사원번호입니다");
    		  </script>
    		  <%
    		 }
		  }
    	  catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
   	}
    --%>
 


<form name="frm" method="post" action="sudangUpdateProcess.jsp" method="post">
<table border=1 id="tab2">
<tr> 
      <th>사원번호</th>
      <td width=30%><input type="text" name="id"  value="<%=id %>" id=in1 onchange="changesubmit();"></td>
      <th>이름</th>
      <td><input type="text" name="name"  value="<%=name %>" id=in1></td>
</tr>

<tr> 
      <th>가족수당</th>
      <td><input type="text" name="gajok" value="<%=gajok %>" id=in1 placeholder="0"></td>
      <th>직책수당</th>
      <td><input type="text" name="jikchak" value="<%=jikchak %>" id=in1 placeholder="0"></td>
</tr>

<tr> 
      <th>근속수당</th>
      <td width=30%><input type="text" name="gunsok" value="<%=gunsok %>"  id=in1 placeholder="0"></td>
</tr>

<tr> 
      <th>기타수당</th>
      <td width=30%><input type="text" name="gitasudang" value="<%=gitasudang %>"  id=in1 placeholder="0"></td>
</tr>



<tr>
    <td colspan = 4 align = center>
    <input id=bt1 type="button" value="목록" onclick="check()"> 
    <input id=bt2 type="submit" value="저장" onclick="check()">
    </td>
</tr>

</table>
<%
 	}}
		  catch(Exception e) {
		    System.out.println("에러" + e.getMessage());
	 }

%>
</form>
</section>
<%@ include file = "footer.jsp" %>


</body>
</html>