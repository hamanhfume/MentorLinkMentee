/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import dao.MentorCVDAO;
import dao.SkillDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Skill;
import model.User;

/**
 *
 * @author Tuan Vinh
 */
public class CreateCV extends HttpServlet {
   
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
            out.println("<title>Servlet CreateCV</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCV at " + request.getContextPath () + "</h1>");
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
        
        //Khởi tạo đối tượng
        UserDAO daoU = new UserDAO();
        SkillDAO dao = new SkillDAO();
        //Lấy ra các skill mà hệ thống có để cho mentor chọn
        ArrayList<Skill> list = dao.getAllSkillInfo();
        //Lấy ra thông tin cơ bản của mentor.
        User infoU = daoU.getUserById(Integer.parseInt(sessionUser_id));
       
        //Truyền các dữ liệu từ servlet sang JSP
        request.setAttribute("InfoU", infoU);
        request.setAttribute("listSkill", list);
        request.setAttribute("mess", "Error");
        request.getRequestDispatcher("/mentor/createCV.jsp").forward(request, response);
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
        
        
        //Lấy các thông tin người dùng nhập vào
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String birthdate = request.getParameter("date_of_birth");
        int gender = "Male".equals(request.getParameter("gender")) ? 1 : 0;
        String address = request.getParameter("address");
       

        //Lấy các thông tin người dùng nhập vào
        String profession = request.getParameter("profession");
        String profession_intro = request.getParameter("profession_intro");
        String archivement = request.getParameter("archivement");
        String archivement_des = request.getParameter("archivement_des");
        String service_des = request.getParameter("service_des");
        String programming = request.getParameter("programming");
        String[] skillId = request.getParameterValues("SkillId");
        if(skillId == null) {
            
        }
        //Khởi tạo đối tượng
        MentorCVDAO dao = new MentorCVDAO();

        boolean result;
        try {
            //Gọi đến hàm tạo CV
            result = dao.createCV(username, mentor_id, fullName, birthdate, gender, address, profession, profession_intro, 
                    service_des, archivement, archivement_des, programming, skillId);
        } catch (SQLException e) {
            // Xử lý ngoại lệ ở đây
            result = false; // hoặc thực hiện hành động khác khi có lỗi
        }
          
        
        request.setAttribute("mentor_id", mentor_id);
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
