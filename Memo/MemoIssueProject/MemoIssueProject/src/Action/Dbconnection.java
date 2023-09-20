package Action;

import java.sql.*;


public class Dbconnection {
	
	  public static Connection getConnection() {
	        Connection con = null;
	    	

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/memoissues", "root", "");
	          
	        } catch (ClassNotFoundException | SQLException ex) {
	        }
	        return con;
	    }

}
