/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Tuan Vinh
 */
public class UserProfile extends HttpServlet {

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
            out.println("<title>Servlet UserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile at " + request.getContextPath() + "</h1>");
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
        
        HttpSession session = request.getSession();
        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
        User sessionUser = (User) session.getAttribute("acc");
        // Lấy user_id từ đối tượng User lấy từ session
        String sessionUser_id = sessionUser.getUser_id();
        
       
        
        
        // Khởi tạo đối tượng UserDAO
        UserDAO dao = new UserDAO();
        // Sử dụng UserDAO để lấy thông tin người dùng từ cơ sở dữ liệu dựa trên user_id
        User userIf = dao.getUserById(Integer.parseInt(sessionUser_id));
        String avatarUrl = userIf.getAvatar();
        session.setAttribute("avatarUrl", avatarUrl);
        request.setAttribute("InfoUser", userIf);
        request.getRequestDispatcher("/common/userProfile.jsp").forward(request, response);

//        request.getRequestDispatcher("test.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
        User sessionUser = (User) session.getAttribute("acc");
        // Lấy user_id từ đối tượng User lấy từ session
        String sessionUser_id = sessionUser.getUser_id();
        
        
        //Lấy các thông tin do người dùng nhập.
        String account_name = request.getParameter("account_name");
        String full_name = request.getParameter("full_name");
        int gender = "Male".equals(request.getParameter("gender")) ? 1 : 0;
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        
        UserDAO dao = new UserDAO();
        //Gọi hàm để update thông tin người dùng.
        boolean insertSuccess = dao.UpdateUser(account_name, gender, full_name, birthdate, email, address, phone, Integer.parseInt(sessionUser_id));
        //Kiểm tra để in ra thông báo
        if (insertSuccess == true) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failure");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User userIf = dao.getUserById(3);
        String avatarUrl = userIf.getAvatar();
        System.out.println("URL: " + avatarUrl);
    }
}
