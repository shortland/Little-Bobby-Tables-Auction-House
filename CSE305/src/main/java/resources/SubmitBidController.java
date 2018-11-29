package resources;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AuctionDao;
import dao.BidDao;
import model.Bid;

/**
 * Servlet implementation class SubmitBidController
 */
public class SubmitBidController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitBidController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String customerID = (String)request.getSession(false).getAttribute("customerID");
		
		String auctionID = request.getParameter("auctionID");
		String itemID = request.getParameter("itemID");
		Float currentBid = Float.parseFloat(request.getParameter("currentBid"));
		Float maxBid = Float.parseFloat(request.getParameter("maxBid"));
		
		BidDao bidDao = new BidDao();
		Bid bid = bidDao.submitBid(auctionID, itemID, currentBid, maxBid, customerID);
		
		request.setAttribute("auctionID", auctionID);
		request.setAttribute("itemID", itemID);
		
		RequestDispatcher rd = request.getRequestDispatcher("bidInAuction");
		rd.forward(request, response);

	}

}
