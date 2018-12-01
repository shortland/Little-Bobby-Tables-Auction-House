package dao;
//hi
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Auction;
import model.Bid;
import model.Customer;
import model.Item;

public class AuctionDao {
	
	public List<Auction> getAllAuctions() {
		
		List<Auction> auctions = new ArrayList<Auction>();
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Auction" class object and added to the "auctions" ArrayList
		 * Query to get data about all the auctions should be implemented
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM AuctionData");
			while(rs.next()) {
				Auction auction =new Auction();
				auction.setAuctionID(rs.getInt("AuctionID"));
				auction.setBidIncrement(rs.getInt("Increment"));
				auction.setMinimumBid(rs.getInt("OpeningBid"));  //David: missing CopiesSold bcus we don't have it in the table
				auction.setItemID(rs.getInt("ItemID"));
				auction.setClosingBid(rs.getInt("ClosingBid"));
				auction.setCurrentBid(rs.getInt("CurrentBid"));
				auction.setCurrentHighBid(rs.getInt("CurrentHighBid"));
				auction.setReserve(rs.getInt("Reserve"));
				auctions.add(auction);
			}
		}catch(Exception e) {
		}
		return auctions;
	}

	public List<Auction> getAuctions(String customerID) {
		
		List<Auction> auctions = new ArrayList<Auction>();
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Auction" class object and added to the "auctions" ArrayList
		 * Query to get data about all the auctions in which a customer participated should be implemented
		 * customerID is the customer's primary key, given as method parameter
		 */
		
		/*Sample data begins*/
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM AuctionData A WHERE A.SellerID = \'"+ customerID+"\' OR A.BuyerID = \'"+customerID+"\'");
		
			while(rs.next()) {
				Auction auction = new Auction();
				auction.setAuctionID(rs.getInt("AuctionID"));
				auction.setBidIncrement(rs.getInt("Increment"));
				auction.setMinimumBid(rs.getInt("OpeningBid"));	//David: missing CopiesSold
				auction.setItemID(rs.getInt("ItemID"));
				auction.setClosingBid(rs.getInt("ClosingBid"));
				auction.setCurrentBid(rs.getInt("CurrentBid"));
				auction.setCurrentHighBid(rs.getInt("CurrentHighBid"));
				auction.setReserve(rs.getInt("Reserve"));
				auctions.add(auction);
			}
		}catch(Exception e) {
		}
		return auctions;

	}

	public List<Auction> getOpenAuctions(String employeeEmail) {
		List<Auction> auctions = new ArrayList<Auction>();
		
		/*
		 * The students code to fetch data from the database will be written here
		 * Each record is required to be encapsulated as a "Auction" class object and added to the "auctions" ArrayList
		 * Query to get data about all the open auctions monitored by a customer representative should be implemented
		 * employeeEmail is the email ID of the customer representative, which is given as method parameter
		 */
		
		/*Sample data begins*/
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT A.* FROM AuctionData A, EmployeeData E WHERE A.EmployeeID = E.EmployeeID AND E.EmailAddress =\'"+employeeEmail+"\'");
			while(rs.next()) {
				Auction auction = new Auction();
				auction.setAuctionID(rs.getInt("AuctionID"));
				auction.setBidIncrement(rs.getInt("Increment"));
				auction.setMinimumBid(rs.getInt("OpeningBid"));	//David: missing CopiesSold
				auction.setItemID(rs.getInt("ItemID"));
				auction.setClosingBid(rs.getInt("ClosingBid"));
				auction.setCurrentBid(rs.getInt("CurrentBid"));
				auction.setCurrentHighBid(rs.getInt("CurrentHighBid"));
				auction.setReserve(rs.getInt("Reserve"));
				auctions.add(auction);
			}
		}catch(Exception e) {
		}
		return auctions;
		
	}

	public String recordSale(String auctionID) {
		/*
		 * The students code to update data in the database will be written here
		 * Query to record a sale, indicated by the auction ID, should be implemented
		 * auctionID is the Auction's ID, given as method parameter
		 * The method should return a "success" string if the update is successful, else return "failure"
		 */
		
		//David TODO Not sure what this method want. Assuming it want us to update the AuctionData's BuyerID to the Customer's ID who posted the bid value that matches the closing bid
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("SELECT B.CustomerID FROM Bid B, AuctionData A WHERE A.ClosingBid=B.Value AND A.AuctionID=\'"+auctionID+"\'");
			int customerID= rs.getInt("CustomerID");
			st.executeUpdate("UPDATE AuctionData SET BuyerID= \'"+customerID+"\'");
		}catch(Exception e) {
			System.out.println(e);
			return "failure";
		}
		return "success";
		
	}

	public List getAuctionData(String auctionID, String itemID) {
		
		List output = new ArrayList();
		Item item = new Item();
		Bid bid = new Bid();
		Auction auction = new Auction();
		Customer customer = new Customer();
		
		/*
		 * The students code to fetch data from the database will be written here
		 * The item details are required to be encapsulated as a "Item" class object
		 * The bid details are required to be encapsulated as a "Bid" class object
		 * The auction details are required to be encapsulated as a "Auction" class object
		 * The customer details are required to be encapsulated as a "Customer" class object
		 * Query to get data about auction indicated by auctionID and itemID should be implemented
		 * auctionID is the Auction's ID, given as method parameter
		 * itemID is the Item's ID, given as method parameter
		 * The customer details must include details about the current winner of the auction
		 * The bid details must include details about the current highest bid
		 * The item details must include details about the item, indicated by itemID
		 * The auction details must include details about the item, indicated by auctionID
		 * All the objects must be added in the "output" list and returned
		 */
		/*Sample data begins*/
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("SELECT I.*, B.*, C.*, A.* FROM ItemData I, Bid B, AuctionData A, CustomerData C WHERE A.ItemID = I.ItemID AND B.AuctionID= A.AuctionID AND B.CustomerID = C.CustomerID AND A.BuyerID= C.CustomerID");
			while(rs.next()) {
				item.setItemID(rs.getInt("ItemID"));
				item.setDescription(rs.getString("ItemDescription"));
				item.setType(rs.getString("ItemType"));
				item.setName(rs.getString("ItemName"));
				
				bid.setCustomerID(Integer.toString(rs.getInt("CustomerID")));
				bid.setBidPrice(rs.getFloat("Value"));
				
				customer.setCustomerID(Integer.toString(rs.getInt("CustomerID")));
				customer.setFirstName(rs.getString("FirstName"));
				customer.setLastName(rs.getString("LastName"));
				
				auction.setMinimumBid(rs.getInt("OpeningBid"));
				auction.setBidIncrement(rs.getInt("Increment"));
				auction.setCurrentBid(rs.getInt("CurrentBid"));
				auction.setCurrentHighBid(rs.getInt("CurrentHighBid"));
				auction.setAuctionID(rs.getInt("AuctionID"));
			}
			output.add(item);
			output.add(bid);
			output.add(auction);
			output.add(customer);
		}catch(Exception e) {
			System.out.println(e);
		}
		return output;
	}

	
}
