<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String mname = request.getParameter("mname");
      String num = request.getParameter("num");
      String matt = request.getParameter("matt");
      String mden = request.getParameter("mden");
      String mov = request.getParameter("mov");
      String mor = request.getParameter("mor");
      
 
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
  
            String sql = "insert into monster values(?, ?, ?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mname);
            pstmt.setString(2, num);
            pstmt.setString(3, matt);
            pstmt.setString(4, mden);
            pstmt.setString(5, mov);
            pstmt.setString(6, mor);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>마물군단 등록</title></head>
<body>
      마물군단 등록 완료
      	<a href=http://localhost:8080/DBProject/monster.jsp>마물군단 검색</a>
      
</body>
</html>