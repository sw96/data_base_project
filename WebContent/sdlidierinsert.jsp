<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String ID = request.getParameter("ID");
      String Password= request.getParameter("Password");
      String name = request.getParameter("name");
      String age = request.getParameter("age");
      String hometown = request.getParameter("hometown");
 
      Connection conn = null;
      PreparedStatement pstmt = null;
      // Connection/PreparedStatement/ResultSet ==> interface
 
      try
      {
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:ORCL";
            String dbId = "system";
            String dbPass = "Aa123456";
  
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  
            String sql = "insert into solider values(?, ?, ?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ID);
            pstmt.setString(2, Password);
            pstmt.setString(3, name);
            pstmt.setString(4, age);
            pstmt.setString(5, hometown);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>용사 등록</title></head>
<body>
      용사 등록 완료
      	<li><a href=http://localhost:8080/DBProject/sdlidiersearch.jsp>용사 검색</a></li>
      
</body>
</html>