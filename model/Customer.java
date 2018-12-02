package model;

public class Customer {
	
	/*
	 * This class is a representation of the customer table in the database
	 * Each instance variable has a corresponding getter and setter
	 */
	
	private String customerID;
	private String firstName;
	private String lastName;
	private String Address;
	private String City;
	private String State;
	private int zipCode;
	private String telephone;
	private String email;
	private String creditCard;
	private int rating;
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "The Customer Details are: <br/>Customer ID=" + customerID + "<br/>First Name=" + firstName + "<br/>Last Name=" + lastName
				+ "<br/>Address=" + Address + "<br/>City=" + City + "<br/>State=" + State + "<br/>Zip Code=" + zipCode
				+ "<br/>Telephone=" + telephone + "<br/>Email=" + email + "<br/>Credit Card=" + creditCard + "<br/>Rating=" + rating;
	}
	
}
