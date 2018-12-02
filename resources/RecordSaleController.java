package resources;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AuctionDao;
import dao.CustomerDao;

/**
 * Servlet implementation class RecordSaleController
 */
public class RecordSaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecordSaleController() {
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
		String auctionID = request.getParameter("auctionID");
		
		AuctionDao auctionDao = new AuctionDao();
		String result = auctionDao.recordSale(auctionID);
		
		if(result.equals("success")) {
			response.sendRedirect("customerRepresentativeHome.jsp?status=recordSuccess");
		}
		else {
			response.sendRedirect("customerRepresentativeHome.jsp?status=recordFailure");
		}

	}

}
