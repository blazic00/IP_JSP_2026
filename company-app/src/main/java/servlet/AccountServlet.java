package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entity.User;
import service.UserService;

import java.io.IOException;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/account")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final UserService userService = new UserService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		User user = (User) request.getSession().getAttribute("user");
//		if(user == null) {
//			response.sendRedirect("login");
//			return;
//		}
		
		 String error = request.getParameter("error");
		    if (error != null) {
		        request.setAttribute("error", error);
		    }
		request.getRequestDispatcher("account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		var session = request.getSession();
    	var user = (User) session.getAttribute("user");
		boolean isPasswordOK = userService.isLoginValid(user.getUsername(),request.getParameter("currentPassword")) != null;
		if(!isPasswordOK) {
			response.sendRedirect(request.getContextPath() +"/account?error=invalid_password");
			return;
		}
		userService.changePassword(user, request.getParameter("newPassword"));

		response.sendRedirect(request.getContextPath() + "/main?message=password_update");
	}

}
