/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Skill;

@WebServlet(name = "UpdateSkill", urlPatterns = {"/updateskill"})
public class UpdateSkill extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSkill</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSkill at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idU = request.getParameter("kid");
        SkillDAO dao = new SkillDAO();
        Skill k = dao.getSkillById(idU);
        request.setAttribute("ojectupdate", k);
        request.getRequestDispatcher("admin/editskill.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idU = request.getParameter("skill_id");
        String nameU = request.getParameter("skill_name");
        String imgU = request.getParameter("skill_img");
        String statusU = request.getParameter("skill_status");
        
        try{
            int statusbit = Integer.parseInt(statusU);
        SkillDAO dao = new SkillDAO();
        dao.updateSkill(idU, nameU, statusbit, imgU);
        response.sendRedirect("skill");
        }catch(Exception e){
            
        }
   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
