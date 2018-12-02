package dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Employee;
import model.Item;
import model.Post;

public class PostDao {

	
	public List<Item> getSalesReport(Post post) {
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Item" class object and added to the "items" List
		 * Query to get sales report for a particular month must be implemented
		 * post, which has details about the month and year for which the sales report is to be generated, is given as method parameter
		 * The month and year are in the format "month-year", e.g. "10-2018" and stored in the expireDate attribute of post object
		 * The month and year can be accessed by getter method, i.e., post.getExpireDate()
		 */

		List<Item> items = new ArrayList<Item>();
		String[] dateData = post.getExpireDate().split("-");
		String s = dateData[1] + "-" + dateData[0];

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();			
			ResultSet rs = st.executeQuery("SELECT I.ItemName, I.ItemID, I.ItemType, I.YearManufactured, COUNT(I.ItemID) AS CopiesSold, SUM(A.ClosingBid) AS Profits FROM AuctionData A, ItemData I WHERE I.ItemID = A.ItemID AND MONTH(A.ClosingDate) = " + dateData[0] + " AND YEAR(A.ClosingDate) = " + dateData[1] + " GROUP BY I.ItemID");

			while (rs.next()) {
				Item item = new Item();
				item.setName(rs.getString("ItemName"));
				item.setItemID(rs.getInt("ItemID"));
				item.setType(rs.getString("ItemType"));
				item.setNumCopies(rs.getInt("CopiesSold"));
				item.setSoldPrice(rs.getInt("Profits"));
				item.setYearManufactured(rs.getInt("YearManufactured"));
				items.add(item);
			}
		} catch(Exception e) {
			System.out.println(e);
		}		

		return items;
	}
}
