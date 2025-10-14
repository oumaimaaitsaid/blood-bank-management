package  com.bloodbank.servlet;


import com.bloodbank.dao.MedicalConditionDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.enums.GroupeSanguin;
import com.bloodbank.model.enums.Sexe;
import com.bloodbank.service.DonneurService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
            request.setAttribute("groupes", Arrays.asList(GroupeSanguin.values()));
            request.setAttribute("conditions", new MedicalConditionDAO().findAll());

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
        d.setGroupe(GroupeSanguin.valueOf(request.getParameter("groupeSanguin")));
        String[] conditions = request.getParameterValues("conditions");
        List<Integer> ids = new ArrayList<>();
        if (conditions != null) {
            for (String id : conditions) ids.add(Integer.parseInt(id));
        }

        service.ajouterDonneur(d,ids);
        response.sendRedirect("donneur?action=list");
    }

}