<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String iname = request.getParameter("iname");
      String ikind = request.getParameter("ikind");
      String att = request.getParameter("att");
      String den = request.getParameter("den");
      String ene = request.getParameter("ene");
      String inte = request.getParameter("inte");
 
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
  
            String sql = "insert into item values(?, ?, ?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, iname);
            pstmt.setString(2, ikind);
            pstmt.setString(3, att);
            pstmt.setString(4, den);
            pstmt.setString(5, ene);
            pstmt.setString(6, inte);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>아이템 등록</title></head>
<body>
      아이템 등록 완료
      	<a href=http://localhost:8080/DBProject/itemsearch.jsp>아이템 검색</a>
      	
      
</body>
</html>