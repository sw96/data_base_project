package test.db;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
public class DBConnection {
public static Connection getCon() throws SQLException{
	Connection con=null;
try{
	Class.forName("oracle.jdbc.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	con = DriverManager.getConnection(url, "system","Aa123456");
	return con;
	} catch (ClassNotFoundException ce){
		System.out.println(ce.getMessage());
		return null;
}
}
} 