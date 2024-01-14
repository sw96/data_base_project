<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String sname = request.getParameter("sname");
      String ssup = request.getParameter("ssup");
      String smup = request.getParameter("smup");
 
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
  
            String sql = "insert into skill values(?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sname);
            pstmt.setString(2, ssup);
            pstmt.setString(3, smup);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>스킬 등록</title></head>
<body>
      스킬 등록 완료	
      <a href=http://localhost:8080/DBProject/skillsearch.jsp>스킬 검색</a>
      
</body>
</html>