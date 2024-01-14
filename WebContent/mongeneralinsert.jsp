<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<%
      request.setCharacterEncoding("euc-kr");
 
      String mgname = request.getParameter("mgname");
      String mage = request.getParameter("mage");
      String matt = request.getParameter("matt");
      String mden = request.getParameter("mden");
      String mov = request.getParameter("mov");
      String mor = request.getParameter("mor");
      String kind = request.getParameter("kind");
      
 
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
  
            String sql = "insert into mongeneral values(?, ?, ?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mgname);
            pstmt.setString(2, mage);
            pstmt.setString(3, matt);
            pstmt.setString(4, mden);
            pstmt.setString(5, mov);
            pstmt.setString(6, mor);
            pstmt.setString(7, kind);
            pstmt.executeUpdate();
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>

 

<html>
<head><title>장군 등록</title></head>
<body>
      장군 등록 완료
<a href=http://localhost:8080/DBProject/mongeneral.jsp>마물장군 검색</a>
      
</body>
</html>