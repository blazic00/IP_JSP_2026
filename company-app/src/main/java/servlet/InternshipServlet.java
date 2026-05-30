package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entity.Internship;
import model.entity.User;
import service.InternshipService;

import java.io.IOException;
import java.sql.Date;

/**
 * Servlet implementation class InternshipServlet
 */
@WebServlet("/internships")
public class InternshipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final InternshipService internshipService = new InternshipService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InternshipServlet() {
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
		
		var internshipId = request.getParameter("edit");
		
		if(internshipId != null) {
		var internship = internshipService.getById(Long.parseLong(internshipId));
		request.setAttribute("internship", internship);
		}
		else {
			internshipId = request.getParameter("delete");
			if(internshipId != null) {
				try {
					internshipService.deleteById(Long.parseLong(internshipId));
				}
				catch(Exception ex) {
					System.out.println("Can't delete. Already has applications!");
					request.setAttribute("errorMessage", "Can't delete. Already has applications!");
				}
			}
		}
		User user = (User) request.getSession().getAttribute("user");
		var internships = internshipService.getAllForCompany(user);
		request.setAttribute("internships", internships);
		
		
		request.getRequestDispatcher("internship.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("id") != null) {
			//doPut(request, response);
		}
		// TODO Auto-generated method stub
		Internship internship = new Internship();
		internship.setDescription(request.getParameter("description"));
		internship.setTechnologies(request.getParameter("technologies"));
		internship.setStartDate(Date.valueOf(request.getParameter("startDate")));
		internship.setEndDate(Date.valueOf(request.getParameter("endDate")));
		internship.setRequirements(request.getParameter("requirements"));
		internship.setConstraints(request.getParameter("constraints"));
		internship.setCompany((User)request.getSession().getAttribute("user"));
		
		if(request.getParameter("id") != null) {
			internship.setId(Long.parseLong(request.getParameter("id")));
			internshipService.updateInternship(internship);
		}
		else
		{
		internshipService.addInternship(internship);
		}
		doGet(request, response);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				Internship internship = new Internship();
				internship.setId(Long.parseLong(request.getParameter("id")));
				internship.setDescription(request.getParameter("description"));
				internship.setTechnologies(request.getParameter("technologies"));
				internship.setStartDate(Date.valueOf(request.getParameter("startDate")));
				internship.setEndDate(Date.valueOf(request.getParameter("endDate")));
				internship.setRequirements(request.getParameter("requirements"));
				internship.setConstraints(request.getParameter("constraints"));
				internship.setCompany((User)request.getSession().getAttribute("user"));
				
				internshipService.updateInternship(internship);
				doGet(request, response);
	}

}
