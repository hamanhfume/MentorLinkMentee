/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dao.FeedbackDAO;
import dao.FeedbackSkillDAO;
import dao.MentorCVDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.CV_Mentor;
import model.Feedback;
import model.Feedback_Skill;

/**
 *
 * @author Tuan Vinh
 */
public class ViewCvMentor extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewCvMentor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewCvMentor at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        MentorCVDAO dao = new MentorCVDAO();
        //Lấy thông tin dựa trên mentor_id khi người dùng click vào xem CV
        String mentor_id = request.getParameter("mentor_id");
        CV_Mentor cv = dao.getCvMentorById(mentor_id);
        //Lấy ra list mentor để gợi ý cho mentee
        List<CV_Mentor> list = dao.getAllListMentor();
        FeedbackDAO dao1 = new FeedbackDAO();
        //Lấy ra Feedback về mentor
        List<Feedback> listF = dao1.getAllFeedbackOfMentor(Integer.parseInt(mentor_id));
        //Lấy ra đánh ra cho mỗi skill mà mentor nhận được.
        FeedbackSkillDAO fbs = new FeedbackSkillDAO();
        //Lay ra skill cua mentor kem danh gia
        ArrayList<Feedback_Skill> listFS = fbs.getStarRateSkill(mentor_id);
        //Truyền dữ liều từ servlet sang jsp để hiển thị
        request.setAttribute("mentor_id", mentor_id);
        request.setAttribute("cv", cv);
        request.setAttribute("listMentor", list);
        request.setAttribute("listF", listF);      
        request.setAttribute("listFS", listFS);      
        request.getRequestDispatcher("common/viewCvMentor.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
