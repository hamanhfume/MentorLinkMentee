/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import dao.MentorCVDAO;
import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CV_Mentor;
import model.Skill;
import model.User;

/**
 *
 * @author Tuan Vinh
 */
public class UpdateCv extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateCv</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCv at " + request.getContextPath () + "</h1>");
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
         HttpSession session = request.getSession();
        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
        User sessionUser = (User) session.getAttribute("acc");
        // Lấy user_id từ đối tượng User lấy từ session
        String sessionUser_id = sessionUser.getUser_id();
        MentorCVDAO dao = new MentorCVDAO();
        CV_Mentor cv = dao.getInfoCvMentorById(sessionUser_id);       
        SkillDAO dao1 = new SkillDAO();    
        ArrayList<Skill> list = dao1.getAllSkillInfo();
        request.setAttribute("cv", cv);
        request.setAttribute("listSkill", list);
        request.getRequestDispatcher("mentor/updateCV.jsp").forward(request, response);
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
         HttpSession session = request.getSession();
        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
        User sessionUser = (User) session.getAttribute("acc");
        // Lấy user_id từ đối tượng User lấy từ session
        String sessionUser_id = sessionUser.getUser_id();
        int mentor_id = Integer.parseInt(sessionUser_id);
        
        
        String fullName = request.getParameter("fullName");
        String birthdate = request.getParameter("date_of_birth");
        int gender = "Male".equals(request.getParameter("gender")) ? 1 : 0;
        String address = request.getParameter("address");
        
        request.setAttribute("fullName", fullName);
        request.setAttribute("gender", gender);
        request.setAttribute("address", address);
        request.setAttribute("date", birthdate);

        String profession = request.getParameter("profession");
        String profession_intro = request.getParameter("profession_intro");
        String archivement = request.getParameter("archivement");
        String archivement_des = request.getParameter("archivement_des");
        String service_des = request.getParameter("service_des");
        String programming = request.getParameter("programming");
        String[] skillId = request.getParameterValues("SkillId");

        MentorCVDAO dao = new MentorCVDAO();

        boolean result;
        try {
            result = dao.updateCV(mentor_id, fullName, birthdate, gender, address, profession, profession_intro, 
                    service_des, archivement, archivement_des, programming, skillId);
        } catch (SQLException e) {
            // Xử lý ngoại lệ ở đây
            result = false; // hoặc thực hiện hành động khác khi có lỗi
        }

//        result = dao.insetSKill(mentor_id, skillId);
        
        if(result == true) {
            request.setAttribute("m", "OK");
        } else  {
            request.setAttribute("m", "Failed");
            }
        request.setAttribute("mentor_id", mentor_id);
        request.setAttribute("skillId", skillId);
        request.getRequestDispatcher("/mentor/cvSuccessfull.jsp").forward(request, response);
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
