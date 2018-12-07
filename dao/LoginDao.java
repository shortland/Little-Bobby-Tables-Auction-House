package dao;

import java.sql.*;
import model.Login;

public class LoginDao {
	/*
	 * This class handles all the database operations related to login functionality
	 */
	
	
	public Login login(String username, String password) {
		/*
		 * Return a Login object with role as "manager", "customerRepresentative" or "customer" if successful login
		 * Else, return null
		 * The role depends on the type of the user, which has to be handled in the database
		 * username, which is the email address of the user, is given as method parameter
		 * password, which is the password of the user, is given as method parameter
		 * Query to verify the username and password and fetch the role of the user, must be implemented
		 */
		String authorizationLevel = "";
		String pWord="";
		String email="";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("(SELECT AuthorizationLevel, EmailAddress, Password FROM CustomerData WHERE EmailAddress = '" + username + "' AND Password = '" + password + "') UNION (SELECT AuthorizationLevel, EmailAddress, Password FROM EmployeeData WHERE EmailAddress = '" + username + "' AND Password = '" + password + "')");
			while (rs.next()) {
				authorizationLevel = rs.getString("AuthorizationLevel");
				email= rs.getString("EmailAddress");
				pWord= rs.getString("Password")
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		Login login = new Login();
		login.setRole(authorizationLevel);
		login.setUsername(email);
		login.setPassword(pWord);
		if (authorizationLevel.equals("")) {
			return null;
		} else {
			return login;
		}
	}
	
	public String addUser(Login login) {
		/*
		 * Query to insert a new record for user login must be implemented
		 * login, which is the "Login" Class object containing username and password for the new user, is given as method parameter
		 * The username and password from login can get accessed using getter methods in the "Login" model
		 * e.g. getUsername() method will return the username encapsulated in login object
		 * Return "success" on successful insertion of a new user
		 * Return "failure" for an unsuccessful database operation
		 */
		
		// TODO:
		// I don't really understand the purpose of this.
		// It's called by res/AddCustomer and res/AddEmployee.
		// I think it logs the logins of users? But I'm not posivite
		// executeQuery() should be executeUpdate() for insert/updates


		String table;
		if ((login.getRole()).equals("customer")) {
			table = "CustomerData";
		}
		else {
			table = "EmployeeData";
		}

		try {
		 	Class.forName("com.mysql.jdbc.Driver");
		 	Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
		 	Statement st = con.createStatement();
		 	ResultSet rs = st.executeQuery("INSERT INTO " + table + " (EmailAddress, Password) VALUES ('" + login.getUsername() + "', '" + login.getPassword() + "')");
		 }catch(Exception e) {
			 System.out.println(e);
			 return "failure";
		 }

		return "success";
	}

}
