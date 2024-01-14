<%@ page import = "java.sql.*" %>

 

<html>
<head><title>마물군단 등록</title></head>
<body>
      <h3>마물군단 등록</h3>
      <table width = "550" border = "1">
         <tr>
            <td>이름</td>
            <td>병력수</td>
            <td>총공격력</td>
            <td>총방어력</td>
            <td>이동력</td>
            <td>사기</td>
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
            	String mname = request.getParameter("mname");
                String num = request.getParameter("num");
                String matt = request.getParameter("matt");
                String mden = request.getParameter("mden");
                String mov = request.getParameter("mov");
                String mor = request.getParameter("mor");
%>
      <tr>
            <td><%= rs.getString("mname") %></td>
            <td><%= rs.getString("num") %></td>
            <td><%= rs.getString("matt") %></td>
            <td><%= rs.getString("mden") %></td>
            <td><%= rs.getString("mov") %></td>
            <td><%= rs.getString("mor") %></td>
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