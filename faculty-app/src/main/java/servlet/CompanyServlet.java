package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entity.Company;
import service.CompanyService;

import java.io.IOException;

/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/companies")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final CompanyService companyService = new CompanyService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String toggle = request.getParameter("toggle");
		if (toggle != null) {
		    int id = Integer.parseInt(toggle);
		    companyService.changeStatus(id);
		}
		
		var companies = companyService.getAll();
		request.setAttribute("companies", companies);
		
		var companyId = request.getParameter("edit");
		if(companyId != null) {
		var company = companyService.getById(Long.parseLong(companyId));
		request.setAttribute("company", company);
		}
		
		request.getRequestDispatcher("/WEB-INF/company.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Company company = new Company();
		Long companyId = null;
		if(request.getParameter("id") != null) {
			companyId = Long.parseLong(request.getParameter("id"));
			company.setId(companyId);
		}
		company.setName(request.getParameter("name"));
		company.setUsername(request.getParameter("username"));
		company.setPassword(request.getParameter("password"));
		companyService.update(company);
		doGet(request, response);
	}

}
