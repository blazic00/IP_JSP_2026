
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/internships")
public class RssServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/rss+xml; charset=UTF-8");
		List<Internship> internships = null;
		
		SimpleDateFormat rssDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy");
		
		try {
	        HttpClient client = HttpClient.newHttpClient();

	        HttpRequest apiRequest = HttpRequest.newBuilder()
	                .uri(URI.create("http://localhost:8080/api/internships"))
	                .GET()
	                .build();

	        HttpResponse<String> apiResponse = client.send(apiRequest, HttpResponse.BodyHandlers.ofString());

	        ObjectMapper mapper = new ObjectMapper();

	        internships = mapper.readValue(
	                apiResponse.body(),
	                new TypeReference<List<Internship>>() {}
	        );
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		try (PrintWriter out = response.getWriter()) {
            out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            out.println("<rss version=\"2.0\">");
            out.println("<channel>");
            out.println("<title>Promotions Feed</title>");
            out.println("<link>http://localhost:8443/jsp-rss-app/main</link>");
            out.println("<description>Latest promotions from our site</description>");
            out.println("<language>en-us</language>");

            for (Internship i : internships) {
                out.println("<item>");
                out.println("<title><![CDATA[" + i.getCompanyName() + "]]></title>");
                out.println("<description><![CDATA[" + i.getDescription() + "]]></description>");
                out.println("<startDate>" + rssDateFormat.format(i.getStartDate()) + "</startDate>");
                out.println("<endDate>" + rssDateFormat.format(i.getEndDate()) + "</endDate>");
                out.println("</item>");
            }

            out.println("</channel>");
            out.println("</rss>");
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		this.doGet(request, response);
	}

}
