/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dao.FeedbackDAO;
import dao.SkillDAO;
import dao.requestSkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Skill;

/**
 *
 * @author Tuan Vinh
 */
public class NewServlet extends HttpServlet {

    int size;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String [] skillId = request.getParameterValues("skillId");
        String [] skillId = {"2","3"};     
        size = skillId.length;
         SkillDAO kd = new SkillDAO();
         List<Skill> skillList = new ArrayList<Skill>();
         for (String st : skillId) {
             Skill e = kd.getSkillById(st);
             skillList.add(e);
         }
         request.setAttribute("listSkill", skillList);
        request.getRequestDispatcher("mentee/listrequestbyme.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rating = request.getParameter("rating");
        
        String rating1 = request.getParameter("rating1");
        String rating2 = request.getParameter("rating2");
        String rating3 = request.getParameter("rating3");
        
        int ratingSkill[] = new int[size];
        if(rating1 != null) {
            ratingSkill[0] = Integer.parseInt(rating1);
        } 
        if(rating2 != null) {
            ratingSkill[1] = Integer.parseInt(rating2);
        }
        if(rating3 != null) {
            ratingSkill[2] = Integer.parseInt(rating3);
        } 
        
        String [] skillId = {"2","3"}; 
        
        request.setAttribute("mess", rating);
        request.setAttribute("mess1", rating1);
        request.setAttribute("mess2", rating2);
        request.setAttribute("mess3", rating3);
        request.setAttribute("ratingSkill", ratingSkill);
        FeedbackDAO dao = new FeedbackDAO();
        if(dao.insertFeedbackSkill(16, 2, ratingSkill, skillId) == true) {
            request.setAttribute("m", "OK");
        } else {
            request.setAttribute("m", "Failed");
        }
        request.getRequestDispatcher("test.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
