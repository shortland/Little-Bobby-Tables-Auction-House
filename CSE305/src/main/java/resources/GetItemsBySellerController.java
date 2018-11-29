package resources;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AuctionDao;
import dao.ItemDao;
import model.Auction;
import model.Item;

/**
 * Servlet implementation class GetItemsBySellerController
 */
public class GetItemsBySellerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetItemsBySellerController() {
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
		String customerID = request.getParameter("customerID");
		
		ItemDao itemDao = new ItemDao();
		List data = itemDao.getItemsBySeller(customerID);
		
		request.setAttribute("items", data.get(0));
		request.setAttribute("bids", data.get(1));
		request.setAttribute("auctions", data.get(2));
		
		RequestDispatcher rd = request.getRequestDispatcher("showItemsBySeller.jsp");
		rd.forward(request, response);

	}

}
