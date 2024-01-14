<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>


<%
      request.setCharacterEncoding("euc-kr");
 
      String mname = request.getParameter("mname");
 
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
 
      try
      {
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:ORCL";
            String dbId = "system";
            String dbPass = "Aa123456";
  
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  
            String sql = "select mname from monster where mname = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mname);
            rs = pstmt.executeQuery();
  
            if(rs.next())
            {
                  String rmname = rs.getString("mname");
   
                  if(mname.equals(rmname))
                  {
                        sql = "delete from monster where mname = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, mname);
                        pstmt.executeUpdate();
%>

 

<html>
<head><title></title></head>
<body>
	<a href=http://localhost:8080/DBProject/monster.jsp>마물군단 검색</a>

</body>
</html>
<%
                  }
                  
                  
            
            else
            {
                  out.println("아이디가 틀렸습니다.");
            }
            }

            
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null ) try { conn.close(); } catch(SQLException sqle) {}
      }
%>
