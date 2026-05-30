package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet("/debug-mappings")
public class DebugMappingsServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        ServletContext ctx = getServletContext();

        resp.setContentType("text/plain");

        ctx.getServletRegistrations().forEach((name, reg) -> {
            try {
                resp.getWriter().println(name + " → " + reg.getMappings());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}