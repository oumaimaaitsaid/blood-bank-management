package  com.bloodbank.servlet;


import com.bloodbank.model.Donneur;
import com.bloodbank.model.enums.Sexe;
import com.bloodbank.service.DonneurService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DonneurServlet extends HttpServlet {


    private DonneurService service =new DonneurService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action =request.getParameter("action");

        if("list".equals(action)){
            request.setAttribute("donneurs" ,service.listerDonneurs());
            RequestDispatcher rd = request.getRequestDispatcher("donneur-list.jsp");
            rd.forward(request, response);
        } else if ("delete".equals(action)){
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimer(id);
            response.sendRedirect("donneur?action=list");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("donneur-form.jsp");
            rd.forward(request ,response);
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        Donneur d = new Donneur();

        d.setNom(request.getParameter("nom"));
        d.setPrenom(request.getParameter("prenom"));
        d.setCin(request.getParameter("cin"));
        d.setTelephone(request.getParameter("telephone"));
        d.setSexe(Sexe.valueOf(request.getParameter("sexe")));
        d.setPoids(Double.parseDouble(request.getParameter("poids")));
        d.setDateNaissance(LocalDate.parse(request.getParameter("dateNaissance"), formatter));

        service.ajouterDonneur(d);
        response.sendRedirect("donneur?action=list");
    }

}