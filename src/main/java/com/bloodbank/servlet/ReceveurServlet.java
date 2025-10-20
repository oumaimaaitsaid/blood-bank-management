package com.bloodbank.servlet;

import com.bloodbank.dao.DonneurDAO;
import com.bloodbank.model.Donneur;
import com.bloodbank.model.Receveur;
import com.bloodbank.model.enums.Disponibilite;
import com.bloodbank.model.enums.GroupeSanguin;
import com.bloodbank.model.enums.NiveauBesoin;
import com.bloodbank.model.enums.Sexe;
import com.bloodbank.service.MatchingService;
import com.bloodbank.service.ReceveurService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;


public class ReceveurServlet extends HttpServlet {

    private ReceveurService service = new ReceveurService();
    private MatchingService matchingService = new MatchingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            request.setAttribute("receveurs", service.listerReceveurs());
            RequestDispatcher rd = request.getRequestDispatcher("receveur-list.jsp");
            rd.forward(request, response);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.supprimer(id);
            response.sendRedirect("receveur?action=list");
        } else if ("compatibles".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.trouverById(id);
            Receveur receveur = service.trouverById(id);
            List<Donneur> donneursCompatible = service.getCompatibleDonneurs(id);
            request.setAttribute("receveur", receveur);
            request.setAttribute("donneursCompatibles", donneursCompatible);
            request.getRequestDispatcher("donneurs-compatibles.jsp").forward(request, response);


        } else {
            request.setAttribute("groupes", Arrays.asList(GroupeSanguin.values()));
            request.setAttribute("besoins", Arrays.asList(NiveauBesoin.values()));
            RequestDispatcher rd = request.getRequestDispatcher("receveur-form.jsp");
            rd.forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        Receveur r = new Receveur();
        r.setNom(request.getParameter("nom"));
        r.setPrenom(request.getParameter("prenom"));
        r.setCin(request.getParameter("cin"));
        r.setTelephone(request.getParameter("telephone"));
        r.setSexe(Sexe.valueOf(request.getParameter("sexe")));
        r.setDateNaissance(LocalDate.parse(request.getParameter("dateNaissance"), formatter));
        r.setGroupe(GroupeSanguin.valueOf(request.getParameter("groupeSanguin")));
        r.setBesoin(NiveauBesoin.valueOf(request.getParameter("besoin")));

        service.ajouterReceveur(r);
        response.sendRedirect("receveur?action=list");
    }
}
