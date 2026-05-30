package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.InternshipStudentEvaluation;
import model.WorkLog;
import service.InternshipService;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublisher;
import java.net.http.HttpResponse;
import java.nio.ReadOnlyBufferException;
import java.util.Comparator;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class InternshipsServlet
 */
@WebServlet("/reviewStudentInternship")
public class EvaluateInternship extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final InternshipService internshipService = new InternshipService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateInternship() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentInternshipId = request.getParameter("studentInternshipId");
		//String studentInternshipGrade = request.getParameter("studentInternshipGrade");
		String apiUrl = "http://localhost:8080/api/student-internship/%s"
				.formatted(studentInternshipId);
		InternshipStudentEvaluation studentInternship = null;

	    try {
	        HttpClient client = HttpClient.newHttpClient();
	        HttpRequest httpRequest = HttpRequest.newBuilder()
	                .uri(URI.create(apiUrl))
	                .GET()
	                .build();

	        HttpResponse<String> httpResponse =
	                client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

	        ObjectMapper mapper = new ObjectMapper();
	        mapper.findAndRegisterModules();

	        studentInternship = mapper.readValue(httpResponse.body(), InternshipStudentEvaluation.class);
	        
	        
	        List<WorkLog> workLogs = studentInternship.getWorkLogList();

	        // ✅ sort by week (newest first)
	        workLogs.sort(Comparator.comparing(
	            WorkLog::getWeek,
	            Comparator.nullsLast(Comparator.naturalOrder())
	        ).reversed());

	        studentInternship.setWorkLogList(workLogs);
	        System.out.println(studentInternship.getCompanyEvaluation());

	    } catch (Exception e) {
	       e.printStackTrace();
	    }
	    request.setAttribute("studentInternship", studentInternship);
	    request.setAttribute("studentInternshipId", studentInternshipId);
	    //request.setAttribute("studentInternshipGrade", studentInternshipGrade);
		request.getRequestDispatcher("/WEB-INF/reviewInternship.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer grade = Integer.parseInt(request.getParameter("grade"));
		System.out.println(grade);
		Integer studentInternshipId = Integer.parseInt(request.getParameter("studentInternshipId"));
		request.setAttribute("studentInternshipId", studentInternshipId);
		String apiUrl = "http://localhost:8080/api/student-internship/%s/grade"
				.formatted(studentInternshipId);
		 try {
		        HttpClient client = HttpClient.newHttpClient();
		        HttpRequest httpRequest = HttpRequest.newBuilder()
		                .uri(URI.create(apiUrl))
		                .header("Content-Type", "application/json")
		                .PUT(HttpRequest.BodyPublishers.ofString(String.valueOf(grade)))
		                .build();
		        HttpResponse<String> responseHttp = client.send(
		                httpRequest,
		                HttpResponse.BodyHandlers.ofString()
		        );

		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		doGet(request, response);
	}

}
