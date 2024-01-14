<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<html>
<head><title>용사 등록</title></head>
<body>
      <h3>용사 등록</h3>
      <table width = "550" border = "1">
<tr>
            <td>ID</td>
            <td>PASSWOrD</td>
            <td>NAME</td>
            <td>AGE</td>
            <td>HOMETOWN</td>
            
      </tr>
<%
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
  
      try
      {
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:ORCL";
            String dbId = "system";
            String dbPass = "Aa123456";
   
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass );
            String sql = "select * from solider";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
              
            while(rs.next())
            {
                  String sname = rs.getString(1);
                  String ssup = rs.getString(2);
                  String smup = rs.getString(3);
%>
  <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("age") %></td>
            <td><%= rs.getString("hometown") %></td>
            
      </tr>
<%  
            }
      }catch(Exception e){
            e.printStackTrace();
      }finally{
            if(rs != null) try { rs.close(); } catch(SQLException sqle) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException sqle) {}
            if(conn != null) try { conn.close(); } catch(SQLException sqle) {}
      }
%>
      </table>
</body>
</html>