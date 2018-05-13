package api;

import java.sql.Connection;
import javax.naming.Context;
import javax.sql.DataSource;

public class ConnectionPool {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Context ctx = new javax.naming.InitialContext();
			
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/InsDB");
			
			con = ds.getConnection();
			return con;
		}catch(Exception e) {
			return null;
		}
	}
}
