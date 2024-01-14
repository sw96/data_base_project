<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String kname = request.getParameter("kname");
      String att = request.getParameter("att");
      String den = request.getParameter("den");
      String sta = request.getParameter("sta");
      String mag = request.getParameter("mag");
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
  
            String sql = "insert into kind values(?, ?, ?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kname);
            pstmt.setString(2, att);
            pstmt.setString(3, den);
            pstmt.setString(4, sta);
            pstmt.setString(5, mag);
            pstmt.setString(6, ene);
            pstmt.setString(7, inte);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>종족 등록</title></head>
<body>
      종족 등록 완료
      	<a href=http://localhost:8080/DBProject/kind.jsp>종족 검색</a>
      
</body>
</html>