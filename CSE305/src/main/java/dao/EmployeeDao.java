package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import model.Customer;
import model.Employee;

public class EmployeeDao {
	/*
	 * This class handles all the database operations related to the employee table
	 */
	
	public String addEmployee(Employee employee) {

		/*
		 * All the values of the add employee form are encapsulated in the employee object.
		 * These can be accessed by getter methods (see Employee class in model package).
		 * e.g. firstName can be accessed by employee.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database insertion of the employee details and return "success" or "failure" based on result of the database insertion.
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			String query = "INSERT INTO EmployeeData (Address, AuthorizationLevel, City, EmailAddress, FirstName, HourlyRate, LastName, Password, SocialSecurity, StartDate, State, Telephone, ZipCode) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString (1, employee.getAddress());
			// TODO: 
			// Is this always going to be a customerRepresentative? Or can it be a manager?
			preparedStmt.setString (2, "customerRepresentative");
			preparedStmt.setString (3, employee.getCity());
			preparedStmt.setString (4, employee.getEmail());
			preparedStmt.setString (5, employee.getFirstName());
			preparedStmt.setString (6, "" + employee.getHourlyRate());
			preparedStmt.setString (7, employee.getLastName());
			preparedStmt.setString (8, employee.getPassword());
			preparedStmt.setString (9, employee.getEmployeeID());
			preparedStmt.setString (10, employee.getStartDate());
			preparedStmt.setString (11, employee.getState());
			preparedStmt.setString (12, employee.getTelephone());
			preparedStmt.setString (13, "" + employee.getZipCode());
			preparedStmt.execute();
		} catch(Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";
	}

	public String editEmployee(Employee employee) {
		/*
		 * All the values of the edit employee form are encapsulated in the employee object.
		 * These can be accessed by getter methods (see Employee class in model package).
		 * e.g. firstName can be accessed by employee.getFirstName() method.
		 * The sample code returns "success" by default.
		 * You need to handle the database update and return "success" or "failure" based on result of the database update.
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			String query = "UPDATE EmployeeData SET Address = ?, AuthorizationLevel = ?, City = ?, EmailAddress = ?, FirstName = ?, HourlyRate = ?, LastName = ?, Password = ?, SocialSecurity = ?, StartDate = ?, State = ?, Telephone = ?, ZipCode = ? WHERE SocialSecurity = ?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString (1, employee.getAddress());
			// TODO: 
			// Is this always going to be a customerRepresentative? Or can it be a manager?
			preparedStmt.setString (2, "customerRepresentative");
			preparedStmt.setString (3, employee.getCity());
			preparedStmt.setString (4, employee.getEmail());
			preparedStmt.setString (5, employee.getFirstName());
			preparedStmt.setString (6, "" + employee.getHourlyRate());
			preparedStmt.setString (7, employee.getLastName());
			preparedStmt.setString (8, employee.getPassword());
			preparedStmt.setString (9, employee.getEmployeeID());
			preparedStmt.setString (10, employee.getStartDate());
			preparedStmt.setString (11, employee.getState());
			preparedStmt.setString (12, employee.getTelephone());
			preparedStmt.setString (13, "" + employee.getZipCode());
			preparedStmt.setString (13, employee.getEmployeeID());
			preparedStmt.execute();
		} catch(Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";
	}

	public String deleteEmployee(String employeeID) {
		/*
		 * employeeID, which is the Employee's ID which has to be deleted, is given as method parameter
		 * The sample code returns "success" by default.
		 * You need to handle the database deletion and return "success" or "failure" based on result of the database deletion.
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			String query = "DELETE FROM EmployeeData WHERE SocialSecurity = ?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString (1, employeeID);
			preparedStmt.execute();
		} catch(Exception e) {
			System.out.println(e);
			return "error";
		}

		return "success";
	}

	
	public List<Employee> getEmployees() {

		/*
		 * The students code to fetch data from the database will be written here
		 * Query to return details about all the employees must be implemented
		 * Each record is required to be encapsulated as a "Employee" class object and added to the "employees" List
		 */

		List<Employee> employees = new ArrayList<Employee>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM EmployeeData");
			while (rs.next()) {
				Employee employee = new Employee();
				employee.setEmail(rs.getString("EmailAddress"));
				employee.setFirstName(rs.getString("FirstName"));
				employee.setLastName(rs.getString("LastName"));
				employee.setAddress(rs.getString("LastName"));
				employee.setCity(rs.getString("City"));
				employee.setStartDate(rs.getString("StartDate"));
				employee.setState(rs.getString("State"));
				employee.setZipCode(Integer.parseInt(rs.getString("ZipCode")));
				employee.setTelephone(rs.getString("Telephone"));
				employee.setEmployeeID(rs.getString("SocialSecurity"));
				employee.setHourlyRate(Integer.parseInt(rs.getString("HourlyRate")));
				employees.add(employee);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return employees;
	}

	public Employee getEmployee(String employeeID) {

		/*
		 * The students code to fetch data from the database based on "employeeID" will be written here
		 * employeeID, which is the Employee's ID who's details have to be fetched, is given as method parameter
		 * The record is required to be encapsulated as a "Employee" class object
		 */

		Employee employee = new Employee();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM EmployeeData");
			while (rs.next()) {
				employee.setEmail(rs.getString("EmailAddress"));
				employee.setFirstName(rs.getString("FirstName"));
				employee.setLastName(rs.getString("LastName"));
				employee.setAddress(rs.getString("LastName"));
				employee.setCity(rs.getString("City"));
				employee.setStartDate(rs.getString("StartDate"));
				employee.setState(rs.getString("State"));
				employee.setZipCode(Integer.parseInt(rs.getString("ZipCode")));
				employee.setTelephone(rs.getString("Telephone"));
				employee.setEmployeeID(rs.getString("SocialSecurity"));
				employee.setHourlyRate(Integer.parseInt(rs.getString("HourlyRate")));
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return employee;
	}
	
	public Employee getHighestRevenueEmployee() {
		
		/*
		 * The students code to fetch employee data who generated the highest revenue will be written here
		 * The record is required to be encapsulated as a "Employee" class object
		 */
		
		Employee employee = new Employee();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT E.SocialSecurity, E.EmailAddress, E.FirstName, E.LastName, E.EmployeeID, SUM(A.ClosingBid) AS Revenue FROM AuctionData A, EmployeeData E WHERE E.EmployeeID = A.EmployeeID GROUP BY A.EmployeeID ORDER BY Revenue DESC LIMIT 1");
			while (rs.next()) {
				employee.setEmail(rs.getString("EmailAddress"));
				employee.setFirstName(rs.getString("FirstName"));
				employee.setLastName(rs.getString("LastName"));
				employee.setEmployeeID(rs.getString("SocialSecurity"));
			}
		} catch(Exception e) {
			System.out.println(e);
		}

		return employee;
	}

	public String getEmployeeID(String username) {
		/*
		 * The students code to fetch data from the database based on "username" will be written here
		 * username, which is the Employee's email address who's Employee ID has to be fetched, is given as method parameter
		 * The Employee ID is required to be returned as a String
		 */

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			String query = "SELECT E.SocialSecurity FROM EmployeeData E WHERE E.EmailAddress = ?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setString(1, username);
			ResultSet rs = preparedStmt.executeQuery();
			while (rs.next()) {
				return rs.getString("SocialSecurity");
			}
		} catch(Exception e) {
			System.out.println(e);
		}

		return "";
	}

}
