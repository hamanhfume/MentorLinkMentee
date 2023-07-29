/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.MentorCVDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.User;

@WebServlet(name = "UpdateStatusMentorSearch", urlPatterns = {"/updatestatusmentorsearch"})
public class UpdateStatusMentorSearch extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStatusSkill</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusSkill at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idMentor = request.getParameter("idmentor");
        String txtSearch_raw = request.getParameter("txtSearch");
        String stt_raw = request.getParameter("stt");
        try {
            int stt = Integer.parseInt(stt_raw);
            int index = (int) Math.ceil(stt / 10.0);
            /*
                 int index = stt/10;
                 if(stt%10!=0){
                 index++;
                  }
             */
            int id_M = Integer.parseInt(idMentor);
            User u = new User();
            MentorCVDAO m = new MentorCVDAO();
            u = m.GetByIdMentor(id_M);

            if (u.getUser_status() == 1) {
                m.updateStatus(id_M, 0);
            } else if (u.getUser_status() == 0) {
                m.updateStatus(id_M, 1);
            }
            //Lay  duoc du lieu truyen lai
            String url = "/searchControl?index=" + index + "&txtSearch=" + txtSearch_raw;
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            //Error 500
            response.sendRedirect("security/error500.html");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
