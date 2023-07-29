/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.signup;

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
 * @author admin
 */
public class signupController extends HttpServlet {

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
            out.println("<title>Servlet signupController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signupController at " + request.getContextPath() + "</h1>");
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
     
        
            request.getRequestDispatcher("/signup/signup.jsp").forward(request, response);
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
        String username = request.getParameter("user").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String cofirmpassword = request.getParameter("cofirm_password").trim();
        //int accounttype = Integer.parseInt(request.getParameter("accounttype"));
        String accounttype = request.getParameter("accounttype");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        String phone = request.getParameter("phone");

        String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        //kiểm tra xem người dùng có bỏ trống vị trí nào không
        if (isEmpty(username) || isEmpty(email) || isEmpty(password) || isEmpty(cofirmpassword)
                || isEmpty(name) || isEmpty(phone) || isEmpty(date) || isEmpty(gender) || isEmpty(address)) {
            request.setAttribute("errE", "Không được để trống thông tin nào!");
            request.getRequestDispatcher("/signup/signup.jsp").forward(request, response);
            //mật khảu phải từ 8-20 ký tự , 1 chữ hoa, 1 số , 1 ký tự đặc biệt
        } else if (!password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$")) {
            request.setAttribute("errE", "mật khảu phải từ 8-20 ký tự , 1 chữ hoa, 1 số , 1 ký tự đặc biệt");
            request.getRequestDispatcher("/signup/signup.jsp").forward(request, response);
        } // kiểm tra mật khẩu và nhập lại mật khẩu có giống nhau k
        else if (!password.equals(cofirmpassword)) {
            request.setAttribute("errE", "may khau k dung");
            request.getRequestDispatcher("/signup/signup.jsp").forward(request, response);
        } else if (!phone.matches("^\\d{9,11}$")) {
            request.setAttribute("errE", "so dt  k dung");
            request.getRequestDispatcher("/signup/signup.jsp").forward(request, response);
        } else {
            UserDAO accD = new UserDAO();
            
            User acc1 = accD.getAccByUName(username);
            User acc2 = accD.getAccByEmail(email);
            if (acc1 != null || acc2 != null) {
                request.setAttribute("err", "Tên tài khoản hoặc email đã được đăng ký!!");
                request.getRequestDispatcher("signup/signup.jsp").forward(request, response);

            } else {
                session.setAttribute("drawUserName", username);
                session.setAttribute("drawEmail", email);
                session.setAttribute("drawPassword", password);
                session.setAttribute("accounttype", accounttype);
                session.setAttribute("name", name);
                session.setAttribute("date", date);
                session.setAttribute("phone", phone);
                session.setAttribute("gender", gender);
                session.setAttribute("address", address);
                request.getRequestDispatcher("/signup/authen.jsp").forward(request, response);
            }
        }
    }

    boolean isEmpty(String msg) {
        boolean result = false;
        if (msg.isEmpty()) {
            result = true;
        }
        return result;
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

}
