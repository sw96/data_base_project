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
   
   Connection conn = null; // DBMS와 Java연결객체
   Statement stmt = null; // SQL구문을 실행
   ResultSet rs = null; // SQL구문의 실행결과를 저장
   
   try
   {
         String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
         String dbUser = "system";
         String dbPass = "Aa123456";

         String query = "select * from memberlist";

         // 2. 데이터베이스 커넥션 생성
         conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

         // 3. Statement 생성
         stmt = conn.createStatement();

         // 4. 쿼리 실행
         rs = stmt.executeQuery(query);
         
      // 5. 쿼리 실행 결과 출력
         String rid=request.getParameter("id");
         String rpassword=request.getParameter("password");
         Statement.stmt=conn.createStatement();
         String sql="select * from memberlist where id"+rid+

   }catch(SQLException ex){
    out.println(ex.getMessage());
    ex.printStackTrace();
}finally{
    // 6. 사용한 Statement 종료
    if(rs != null) try { rs.close(); } catch(SQLException ex) {}
    if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}

    // 7. 커넥션 종료
    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
   %>

</body>
</html>