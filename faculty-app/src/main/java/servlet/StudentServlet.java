package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.entity.Student;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class StudentServlet
 */
@MultipartConfig
@WebServlet("/student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
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
		
		String message = request.getParameter("message");
	    if (message != null) {
	        request.setAttribute("message", message);
	    }
	    
	    String edit = request.getParameter("edit");
	    if(edit != null) {
	    	Student student = getStudent(Integer.parseInt(edit));
	    	if(student != null) {
	    		request.setAttribute("student", student);
	    	}
	    }
	    
	    String delete = request.getParameter("delete");
	    if(delete != null) {
	    	deleteStudent(Integer.parseInt(delete));
	    }

	    setStudents(request);

	    request.getRequestDispatcher("/WEB-INF/student.jsp").forward(request, response);
	}
	
	
	private void deleteStudent(int id) {
		try {
	        HttpClient client = HttpClient.newHttpClient();

	        HttpRequest apiRequest = HttpRequest.newBuilder()
	                .uri(URI.create("http://localhost:8080/api/student/" + id))
	                .DELETE()
	                .build();

	        client.send(apiRequest, HttpResponse.BodyHandlers.ofString());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	private Student getStudent(int id) {
		try {
	        HttpClient client = HttpClient.newHttpClient();

	        HttpRequest apiRequest = HttpRequest.newBuilder()
	                .uri(URI.create("http://localhost:8080/api/student/" + id))
	                .GET()
	                .build();

	        HttpResponse<String> apiResponse = client.send(apiRequest, HttpResponse.BodyHandlers.ofString());

	        ObjectMapper mapper = new ObjectMapper();

	        Student student = mapper.readValue(
	                apiResponse.body(),
	                new TypeReference<Student>() {}
	        );
	        student.setPassword(null);

	        return student;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return null;
	}

	private void setStudents(HttpServletRequest request) {
		try {
	        // 1. Call REST API
	        HttpClient client = HttpClient.newHttpClient();

	        HttpRequest apiRequest = HttpRequest.newBuilder()
	                .uri(URI.create("http://localhost:8080/api/student"))
	                .GET()
	                .build();

	        HttpResponse<String> apiResponse = client.send(apiRequest, HttpResponse.BodyHandlers.ofString());

	        // 2. Convert JSON → List<Student>
	        ObjectMapper mapper = new ObjectMapper();

	        List<Student> students = mapper.readValue(
	                apiResponse.body(),
	                new TypeReference<List<Student>>() {}
	        );

	        // 3. Send to JSP
	        request.setAttribute("students", students);

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Failed to load students");
	    }
	}

	
//	@Override
//	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    try {
//	        // Create object
//	        Student student = new Student();
//	        student.setId(Integer.parseInt(request.getParameter("id")));
//	        student.setUsername(request.getParameter("username"));
//	        student.setPassword(request.getParameter("password"));
//	        student.setFirstName(request.getParameter("firstName"));
//	        student.setLastName(request.getParameter("lastName"));
//
//	        // Convert to JSON
//	        ObjectMapper mapper = new ObjectMapper();
//	        String json = mapper.writeValueAsString(student);
//
//	        // HTTP client
//	        HttpClient client = HttpClient.newHttpClient();
//
//	        // POST request
//	        HttpRequest apiRequest = HttpRequest.newBuilder()
//	                .uri(URI.create("http://localhost:8080/api/student/" + student.getId() ))
//	                .header("Content-Type", "application/json")
//	                .PUT(HttpRequest.BodyPublishers.ofString(json))
//	                .build();
//
//	        // Send request
//	        HttpResponse<String> apiResponse =
//	                client.send(apiRequest, HttpResponse.BodyHandlers.ofString());
//
//	        // Handle response
//	        if (apiResponse.statusCode() == 200 || apiResponse.statusCode() == 201) {
//
//	        	setStudents(request);		
//	     	    request.getRequestDispatcher("/WEB-INF/student.jsp").forward(request, response);
//
//	        } else {
//
//	        	String errorMessage = apiResponse.body();
//        	    request.setAttribute("error", errorMessage);
//        	    setStudents(request);	
//        	    request.getRequestDispatcher("/WEB-INF/student.jsp")
//        	            .forward(request, response);
//	        }
//
//	    } catch (Exception e) {
//
//	        e.printStackTrace();
//
//	        request.setAttribute("error", e.getMessage());
//	        setStudents(request);
//	        request.getRequestDispatcher("/WEB-INF/student.jsp")
//	                .forward(request, response);
//	    }
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		
		Student s = null;
		String action = request.getParameter("action");

		if ("uploadCsv".equals(action)) {

		    Part filePart = request.getPart("csvFile");

		    BufferedReader reader =
		            new BufferedReader(
		                    new InputStreamReader(filePart.getInputStream()));

		    String line;

		    while ((line = reader.readLine()) != null) {

		        String[] data = line.split(",");

		        if (data.length == 4) {

		            s = new Student();

		            s.setUsername(data[0].trim());
		            s.setPassword(StudentServlet.sha256(data[1].trim()));
		            s.setFirstName(data[2].trim());
		            s.setLastName(data[3].trim());
		            System.out.println(s.getUsername());

		        }
		        else {
		        	String errorMessage = "Invalid csv file!";
	        	    request.setAttribute("error", errorMessage);
	        	    setStudents(request);	
	        	    request.getRequestDispatcher("/WEB-INF/student.jsp")
	        	            .forward(request, response);
		        }
		    }

		}
		
		String id = request.getParameter("id");

	    try {

	    	Student student = new Student();
	    	if(s != null) {
	    		student=s;
	    	}else {
	        student.setUsername(request.getParameter("username"));
	        student.setPassword(request.getParameter("password"));
	        student.setFirstName(request.getParameter("firstName"));
	        student.setLastName(request.getParameter("lastName"));
	    	}
	        
	        if (id != null) {
			   student.setId(Integer.parseInt(id));
			}

	        // Convert to JSON
	        ObjectMapper mapper = new ObjectMapper();
	        String json = mapper.writeValueAsString(student);

	        HttpClient client = HttpClient.newHttpClient();
	        HttpRequest apiRequest = null;
	        
	        if(id != null) {
	        	 apiRequest = HttpRequest.newBuilder()
	 	                .uri(URI.create("http://localhost:8080/api/student/" + id))
	 	                .header("Content-Type", "application/json")
	 	                .PUT(HttpRequest.BodyPublishers.ofString(json))
	 	                .build();
	        }
	        else{
	        	apiRequest = HttpRequest.newBuilder()
	                .uri(URI.create("http://localhost:8080/api/student"))
	                .header("Content-Type", "application/json")
	                .POST(HttpRequest.BodyPublishers.ofString(json))
	                .build();
	        }

	        // Send request
	        HttpResponse<String> apiResponse =
	                client.send(apiRequest, HttpResponse.BodyHandlers.ofString());

	        // Handle response
	        if (apiResponse.statusCode() == 200 || apiResponse.statusCode() == 201) {

	        	setStudents(request);		
	     	    request.getRequestDispatcher("/WEB-INF/student.jsp").forward(request, response);

	        } else {

	        	String errorMessage = apiResponse.body();
        	    request.setAttribute("error", errorMessage);
        	    setStudents(request);	
        	    request.getRequestDispatcher("/WEB-INF/student.jsp")
        	            .forward(request, response);
	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	        request.setAttribute("error", e.getMessage());
	        setStudents(request);
	        request.getRequestDispatcher("/WEB-INF/student.jsp")
	                .forward(request, response);
	    }
	}
	
	 private static String sha256(String input) {
	        try {
	            MessageDigest digest = MessageDigest.getInstance("SHA-256");

	            byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));

	            StringBuilder hexString = new StringBuilder();

	            for (byte b : hash) {
	                String hex = Integer.toHexString(0xff & b);

	                if (hex.length() == 1) {
	                    hexString.append('0');
	                }

	                hexString.append(hex);
	            }

	            return hexString.toString();

	        } catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException(e);
	        }
	    }

}
