<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

 

<html>
<head><title>���� ���</title></head>
<body>
      kind ���̺��� ����
      <table width = "100%" border = "1">
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
      // 1. JDBC ����̹� �ε�
      Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS�� Java���ᰴü
      Statement stmt = null; // SQL������ ����
      ResultSet rs = null; // SQL������ �������� ����
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
            String dbUser = "system";
            String dbPass = "Aa123456";
   
            String query = "select * from kind";
   
            // 2. �����ͺ��̽� Ŀ�ؼ� ����
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement ����
            stmt = conn.createStatement();
   
            // 4. ���� ����
            rs = stmt.executeQuery(query);
   
            // 5. ���� ���� ��� ���
            while(rs.next())
            {
%>
      <tr>
            <td><%= rs.getString("kname") %></td>
            <td><%= rs.getString("att") %></td>
            <td><%= rs.getString("den") %></td>
            <td><%= rs.getString("sta") %></td>
            <td><%= rs.getString("mag") %></td>
            <td><%= rs.getString("ene") %></td>
            <td><%= rs.getString("inte") %></td>
            
      </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. ����� Statement ����
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. Ŀ�ؼ� ����
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>

      	      <a href=http://localhost:8080/DBProject/home.jsp>Ȩ���� �̵�</a>

      </table>
</body>
</html>
