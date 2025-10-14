package com.bloodbank.servlet;

import com.bloodbank.model.Receveur;
import com.bloodbank.model.enums.GroupeSanguin;
import com.bloodbank.model.enums.NiveauBesoin;
import com.bloodbank.model.enums.Sexe;
import com.bloodbank.service.ReceveurService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;


public class ReceveurServlet  extends  HttpServlet{

    private ReceveurService service =new ReceveurService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  ServletException,IOException{
        String action = request.getParameter("action");

        if("list".equals(action)){
            request.setAttribute("receveurs", service.listerReceveurs());
            RequestDispatcher rd =request.getRequestDispatcher("receveur-list.jsp");
            rd.forward(request,response);

        } else if("delete".equals(action)){
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimer(id);
            response.sendRedirect("receveur?action=list");
        }else {
            request.setAttribute("groupes" ,Arrays.asList(GroupeSanguin.values()));
            request.setAttribute("besoins" ,Arrays.asList(NiveauBesoin.values()));
            RequestDispatcher rd = request.getRequestDispatcher("receveur-form.jsp");
            rd.forward(request, response);
        }
    }
}
