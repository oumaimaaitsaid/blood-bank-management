package com.bloodbank.servlet;
import com.bloodbank.service.MatchingService;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
public class MatchingServlet extends HttpServlet{
    private final MatchingService matchingService = new MatchingService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        matchingService.effectuerMatching();
        req.setAttribute("message","matching automatique effectuè avec succées");
        RequestDispatcher rd =req.getRequestDispatcher("matching-result.jsp");
        rd.forward(req,resp);

    }


}
