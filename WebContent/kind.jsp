<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

 

<html>
<head><title>종족 목록</title></head>
<body>
      kind 테이블의 내용
      <table width = "100%" border = "1">
      <tr>
            <td>종족명</td>
            <td>공격력</td>
            <td>방어력</td>
            <td>체력</td>
            <td>마력</td>
            <td>힘</td>
            <td>지능</td>

      </tr>
 
<%
      // 1. JDBC 드라이버 로딩
      Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
            String dbUser = "system";
            String dbPass = "Aa123456";
   
            String query = "select * from kind";
   
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            stmt = conn.createStatement();
   
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
   
            // 5. 쿼리 실행 결과 출력
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
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>

      	      <a href=http://localhost:8080/DBProject/home.jsp>홈으로 이동</a>

      </table>
</body>
</html>
