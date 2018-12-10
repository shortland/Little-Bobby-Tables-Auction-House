package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bid;
import model.Customer;

public class BidDao {

	public List<Bid> getBidHistory(String auctionID) {
		
		List<Bid> bids = new ArrayList<Bid>();

		/*
		 * The students code to fetch data from the database
		 * Each record is required to be encapsulated as a "Bid" class object and added to the "bids" ArrayList
		 * auctionID, which is the Auction's ID, is given as method parameter
		 * Query to get the bid history of an auction, indicated by auctionID, must be implemented
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM Bid WHERE auctionID ='"+auctionID+"'");
			while(rs.next()) {
				Bid bid = new Bid();
				bid.setAuctionID(rs.getInt("AuctionID"));
				bid.setCustomerID(Integer.toString(rs.getInt("CustomerID")));
				bid.setBidTime(rs.getString("Time"));
				bid.setBidPrice(rs.getFloat("Value"));
				bids.add(bid);		
			}
		}catch(Exception e) {
			System.out.println(e);
		}		
		return bids;
	}

	public List<Bid> getAuctionHistory(String customerID) {
		
		List<Bid> bids = new ArrayList<Bid>();

		/*
		 * The students code to fetch data from the database
		 * Each record is required to be encapsulated as a "Bid" class object and added to the "bids" ArrayList
		 * customerID, which is the Customer's ID, is given as method parameter
		 * Query to get the bid history of all the auctions in which a customer participated, indicated by customerID, must be implemented
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("SELECT B.* FROM Bid B WHERE B.CustomerID = '"+customerID+"'");
			while(rs.next()) {
				Bid bid = new Bid();
				bid.setAuctionID(rs.getInt("AuctionID"));
				bid.setCustomerID(Integer.toString(rs.getInt("CustomerID")));
				bid.setBidTime(rs.getString("Time"));
				bid.setBidPrice(rs.getFloat("Value"));
				bids.add(bid);	
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return bids;
	}

	public Bid submitBid(String auctionID, String itemID, Float currentBid, Float maxBid, String customerID) {
		
		Bid bid = new Bid();

		/*
		 * The students code to insert data in the database
		 * auctionID, which is the Auction's ID for which the bid is submitted, is given as method parameter
		 * itemID, which is the Item's ID for which the bid is submitted, is given as method parameter
		 * currentBid, which is the Customer's current bid, is given as method parameter
		 * maxBid, which is the Customer's maximum bid for the item, is given as method parameter
		 * customerID, which is the Customer's ID, is given as method parameter
		 * Query to submit a bid by a customer, indicated by customerID, must be implemented
		 * After inserting the bid data, return the bid details encapsulated in "bid" object
		 */
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			Statement stmt=con.createStatement();
			Statement s=con.createStatement();
			ResultSet rs= st.executeQuery("SELECT A.*, B.* FROM AuctionData A, ItemData I, Bid B WHERE A.ItemID='"+itemID+"' AND A.AuctionID = '"+auctionID+"' AND A.CurrentHighBid = B.MaxBid GROUP BY A.AuctionID, B.BidNum");
			if(rs.next()) {
				if (rs.getInt("AuctionID")==Integer.parseInt(auctionID)) {
					int currentHigh=rs.getInt("CurrentHighBid");
					System.out.println(currentHigh);
					int cID=rs.getInt("CustomerID");
					System.out.println(cID);
					System.out.println(customerID);
					if(currentHigh>maxBid && cID!=Integer.parseInt(customerID)) {
						System.out.println("Auto Submit ");
						stmt.executeUpdate("INSERT INTO Bid (AuctionID, CustomerID, Value, MaxBid) VALUE('"+auctionID+"', '"+customerID+"', '"+currentBid+"', '"+maxBid+"')");
						bid.setAuctionID(Integer.parseInt(auctionID));
						bid.setCustomerID(customerID);
						bid.setBidPrice(currentBid);
						bid.setMaxBid(maxBid);
						float x= rs.getInt("Increment")+currentBid;
						s.executeUpdate("INSERT INTO Bid(AuctionID, CustomerID, Value, MaxBid) VALUE('"+auctionID+"', '"+rs.getInt("CustomerID")+"', '"+x+"', '"+rs.getInt("MaxBid")+"')");
					}
					else {
						System.out.println("hi");
						st.executeUpdate("INSERT INTO Bid (AuctionID, CustomerID, Value, MaxBid) VALUE('"+auctionID+"', '"+customerID+"', '"+currentBid+"', '"+maxBid+"')");
						bid.setAuctionID(Integer.parseInt(auctionID));
						bid.setCustomerID(customerID);
						bid.setBidPrice(currentBid);
						st.executeUpdate("UPDATE AuctionData SET CurrentHighBid='"+maxBid+"' WHERE AuctionID= '"+auctionID+"'");
					}	
				}
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		//David This will return a bid Object with no attribute in there if the ItemID didn't match the ItemID in AuctionData 
		return bid;
	}

	public List<Bid> getSalesListing(String searchKeyword) {
		
		List<Bid> bids = new ArrayList<Bid>();

		/*
		 * The students code to fetch data from the database
		 * Each record is required to be encapsulated as a "Bid" class object and added to the "bids" ArrayList
		 * searchKeyword, which is the search parameter, is given as method parameter
		 * Query to  produce a list of sales by item name or by customer name must be implemented
		 * The item name or the customer name can be searched with the provided searchKeyword
		 */
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://138.197.50.244:3306/LittleBobbyTablesAuctionHouse",  "littlebobbytables", "bestcse305group");
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("(SELECT B.* FROM Bid B, AuctionData A, ItemData I WHERE A.ClosingBidID = B.BidNum AND A.ItemID = I.ItemID AND I.ItemName LIKE '%" + searchKeyword + "%') UNION (SELECT B.* FROM Bid B, AuctionData A, CustomerData C WHERE A.ClosingBidID = B.BidNum AND C.FirstName LIKE '%" + searchKeyword + "%') UNION (SELECT B.* FROM Bid B, AuctionData A, CustomerData C WHERE A.ClosingBidID = B.BidNum AND C.LastName LIKE '%" + searchKeyword + "%')");
			while(rs.next()) {
				Bid bid = new Bid();
				bid.setAuctionID(rs.getInt("AuctionID"));
				bid.setCustomerID(Integer.toString(rs.getInt("CustomerID")));
				bid.setBidTime(rs.getString("Time"));
				bid.setBidPrice(rs.getFloat("Value"));
				bids.add(bid);
			}
		}catch(Exception e) {
			System.out.println(e);
		}

		
		return bids;
	}

}
