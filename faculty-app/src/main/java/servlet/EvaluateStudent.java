package servlet;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entity.InternshipApplication;

@WebServlet("/evaluate")
public class EvaluateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String apiUrl = "http://localhost:8080/api/company/1/applications";

	    List<InternshipApplication> applications = new ArrayList<>();

	    try {
	        HttpClient client = HttpClient.newHttpClient();

	        HttpRequest httpRequest = HttpRequest.newBuilder()
	                .uri(URI.create(apiUrl))
	                .GET()
	                .build();

	        HttpResponse<String> httpResponse =
	                client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

	        ObjectMapper mapper = new ObjectMapper();

	        applications = Arrays.asList(
	            mapper.readValue(httpResponse.body(), InternshipApplication[].class)
	        );

	    } catch (Exception e) {
	        //out.println("Error: " + e.getMessage());
	    }
	    request.setAttribute("applications", applications);
		request.getRequestDispatcher("/WEB-INF/evaluate.jsp").forward(request, response);
	}
}
