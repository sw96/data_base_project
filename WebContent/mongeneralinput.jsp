<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*" %>

 

<html>
<head><title>��ų ���</title></head>
<body>
      <h3>��ų ���</h3>
      <table width = "550" border = "1">
      <tr>
            <td>�̸�</td>
            <td>����</td>
            <td>���ݷº���</td>
            <td>���º���</td>
            <td>�̵��º���</td>
            <td>����</td>
            <td>õ�� ����</td>
            
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
            String sql = "select * from mongeneral";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
              
            while(rs.next())
            {
                  String mgname = rs.getString(1);
                  String mage = rs.getString(2);
                  String matt = rs.getString(3);
                  String mden = rs.getString(4);
                  String mov = rs.getString(5);
                  String mor = rs.getString(6);
                  String kind = rs.getString(7);
%>
      <tr>
            <td width = "100"><%= mgname %></td>
            <td width = "100"><%= mage %></td>
            <td width = "100"><%= matt %></td>
            <td width = "100"><%= mden %></td>
            <td width = "100"><%= mov %></td>
            <td width = "100"><%= mor %></td>
            <td width = "100"><%= kind %></td>
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