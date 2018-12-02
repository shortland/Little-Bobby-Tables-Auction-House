package model;

public class Auction {

	/*
	 * This class is a representation of the auction table in the database
	 * Each instance variable has a corresponding getter and setter
	 */

	private int auctionID;
	private float bidIncrement;
	private float minimumBid;
	private int copiesSold;
	private int monitor;
	private int itemID;
	private int closingBid;
	private int currentBid;
	private int currentHighBid;
	private int reserve;
	private int employeeID;
	public int getAuctionID() {
		return auctionID;
	}
	public void setAuctionID(int auctionID) {
		this.auctionID = auctionID;
	}
	public float getBidIncrement() {
		return bidIncrement;
	}
	public void setBidIncrement(float bidIncrement) {
		this.bidIncrement = bidIncrement;
	}
	public float getMinimumBid() {
		return minimumBid;
	}
	public void setMinimumBid(float minimumBid) {
		this.minimumBid = minimumBid;
	}
	public int getCopiesSold() {
		return copiesSold;
	}
	public void setCopiesSold(int copiesSold) {
		this.copiesSold = copiesSold;
	}
	public int getMonitor() {
		return monitor;
	}
	public void setMonitor(int monitor) {
		this.monitor = monitor;
	}
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public int getClosingBid() {
		return closingBid;
	}
	public void setClosingBid(int closingBid) {
		this.closingBid = closingBid;
	}
	public int getCurrentBid() {
		return currentBid;
	}
	public void setCurrentBid(int currentBid) {
		this.currentBid = currentBid;
	}
	public int getCurrentHighBid() {
		return currentHighBid;
	}
	public void setCurrentHighBid(int currentHighBid) {
		this.currentHighBid = currentHighBid;
	}
	public int getReserve() {
		return reserve;
	}
	public void setReserve(int reserve) {
		this.reserve = reserve;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	
}
