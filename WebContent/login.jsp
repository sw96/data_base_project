<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<%
request.setCharacterEncodiong("euc-kr");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
   Class.forName("oracle.jdbc.driver.OracleDriver");
   
   Connection conn = null; // DBMS�� Java���ᰴü
   Statement stmt = null; // SQL������ ����
   ResultSet rs = null; // SQL������ �������� ����
   
   try
   {
         String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
         String dbUser = "system";
         String dbPass = "Aa123456";

         String query = "select * from memberlist";

         // 2. �����ͺ��̽� Ŀ�ؼ� ����
         conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

         // 3. Statement ����
         stmt = conn.createStatement();

         // 4. ���� ����
         rs = stmt.executeQuery(query);
         
      // 5. ���� ���� ��� ���
         String rid=request.getParameter("id");
         String rpassword=request.getParameter("password");
         Statement.stmt=conn.createStatement();
         String sql="select * from memberlist where id"+rid+

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

</body>
</html>