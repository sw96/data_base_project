<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<html>
<head><title>��ų ���</title></head>
<body>
      <h3>���� ���</h3>
      <table width = "550" border = "1">
      <tr>
            <td>������</td>
            <td>���ݷ�</td>
            <td>����</td>
            <td>ü��</td>
            <td>����</td>
            <td>��</td>
            <td>����</td>

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
            String sql = "select * from kind";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
              
            while(rs.next())
            {
            	String kname = rs.getString(1);
                String att = rs.getString(2);
                String den = rs.getString(3);
                String sta = rs.getString(4);
                String mag = rs.getString(5);
                String ene = rs.getString(6);
                String inte = rs.getString(7);

%>
      <tr>
			<td width = "100"><%= kname %></td>
            <td width = "100"><%= att %></td>
            <td width = "100"><%= den %></td>
            <td width = "100"><%= sta %></td>
            <td width = "100"><%= mag %></td>
            <td width = "100"><%= ene %></td>
            <td width = "100"><%= inte %></td>
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