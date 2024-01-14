<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>


<%
      request.setCharacterEncoding("euc-kr");
 
      String iname = request.getParameter("iname");
 
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
  
            String sql = "select iname from item where iname = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, iname);
            rs = pstmt.executeQuery();
  
            if(rs.next())
            {
                  String riname = rs.getString("iname");
   
                  if(iname.equals(riname))
                  {
                        sql = "delete from item where iname = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, iname);
                        pstmt.executeUpdate();
%>

 

<html>
<head><title></title></head>
<body>
	<a href=http://localhost:8080/DBProject/itemsearch.jsp>아이템 검색</a>

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
