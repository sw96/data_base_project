<%@ page import = "java.sql.*" %>

 

<html>
<head><title>스킬 등록</title></head>
<body>
      <h3>스킬 등록</h3>
      <table width = "550" border = "1">
      <tr>
            <td>아이템이름</td>
            <td>종류</td>
            <td>공격력</td>
            <td>방어력</td>
            <td>에너지</td>
            <td>지능</td>
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
            String sql = "select * from skill";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
              
            while(rs.next())
            {
                String iname = request.getParameter("iname");
                String ikind = request.getParameter("ikind");
                String att = request.getParameter("att");
                String den = request.getParameter("den");
                String ene = request.getParameter("ene");
                String inte = request.getParameter("inte");
           
%>
      <tr>
            <td><%= rs.getString("iname") %></td>
            <td><%= rs.getString("ikind") %></td>
            <td><%= rs.getString("att") %></td>
            <td><%= rs.getString("den") %></td>
            <td><%= rs.getString("ene") %></td>
            <td><%= rs.getString("inte") %></td>
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