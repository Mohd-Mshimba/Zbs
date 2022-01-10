package LoginDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
 
import loginVar.loginVariable;
import LoginDao.DBConnection;

public class LoginCred {
	public String authenticateUser(loginVariable loginBean)
	{
	    String username = loginBean.getUsername();
	    String password = loginBean.getPassword();
	 
	    Connection con = null;
	    Statement statement = null;
	    ResultSet resultSet = null;
	 
	    String userNameDB = "";
	    String passwordDB = "";
	    String roleDB = "";
	 
	    try
	    {
	        con = DBConnection.createConnection();
	        statement = con.createStatement();
	        resultSet = statement.executeQuery("select username,password, Status from Login");
	 
	        while (resultSet.next()) {
				userNameDB = resultSet.getString("username");
				passwordDB = resultSet.getString("password");
				roleDB = resultSet.getString("Status");

				if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Distributer"))
					return "Distributer_Role";
				else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Receiver"))
					return "Receiver_Role";
				else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Customer"))
					return "Customer_Role";
				else if (username.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("Lab Expart"))
					return "LabExpert_Role";
	        }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	    }
	    return "Invalid user credentials";
	}
	}