package dbcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcon {
	final static String driverName = "org.mariadb.jdbc.Driver";
	final static String url = "jdbc:mariadb://localhost:3306/project";
	final static String uid = "DBNAME";
	final static String upw = "DBPW";

	public static Connection getConnect() throws Exception {
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(url, uid, upw);
		return conn;
	}
}
