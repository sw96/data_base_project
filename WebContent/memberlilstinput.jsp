<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<html>
<head><title>��ų ���</title></head>
<body>
      <h3>��ų ���</h3>
      <table width = "550" border = "1">
      <tr>
            <td width = "100">���̵�</td>
            <td width = "100">��й�ȣ</td>
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
            String sql = "select * from memberlilst";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
              
            while(rs.next())
            {
                  String id = rs.getString(1);
                  String password = rs.getString(2);
%>
      <tr>
            <td width = "100"><%= id %></td>
            <td width = "100"><%= password %></td>
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