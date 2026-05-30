package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req,
                         ServletResponse res,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String path = request.getRequestURI();

        // Public routes
        boolean publicRoute =
                path.endsWith("login") ||
                path.endsWith("login.jsp") ||
                path.contains("css") ||
                path.contains("js") ||
                path.contains("images");

        HttpSession session = request.getSession(false);

        boolean loggedIn =
                session != null &&
                session.getAttribute("user") != null;

        if (loggedIn || publicRoute) {
            chain.doFilter(req, res);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}