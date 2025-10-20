package com.bloodbank.servlet;

import com.bloodbank.service.MatchingService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AssociationServlet extends HttpServlet {

    private final MatchingService matchingService = new MatchingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("create".equals(action)) {
            int donneurId = Integer.parseInt(request.getParameter("donneurId"));
            int receveurId = Integer.parseInt(request.getParameter("receveurId"));

            matchingService.associerManuellement(donneurId, receveurId);

            request.setAttribute("message", "Association créée avec succès !");
            RequestDispatcher rd = request.getRequestDispatcher("donneur-form.jsp");
            rd.forward(request, response);
        }
    }
}
