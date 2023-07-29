/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.signup;

import util.RandomString;
import util.SendEmail;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class registerVerificationController extends HttpServlet {

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
        RandomString rs = new RandomString();
        SendEmail se = new SendEmail();
        String code = rs.getString(5);

        HttpSession session = request.getSession();
        String toEmail = (String) session.getAttribute("drawEmail");
        se.sendCode(toEmail, code);
        session.setAttribute("code", code);
        request.getRequestDispatcher("/signup/authen.jsp").forward(request, response);
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
        // codeU : code người dùng nhập
        String codeU = request.getParameter("code");
        HttpSession session = request.getSession();
        // code: code do hệ thông tạo ra
        String code = (String) session.getAttribute("code");
        if (!codeU.equals(code)) {
            request.setAttribute("err", "Verification code is wrong");
            request.getRequestDispatcher("/signup/authen.jsp").forward(request, response);
        } else {
            session.removeAttribute("code");
            String userName = (String) session.getAttribute("drawUserName");
            String email = (String) session.getAttribute("drawEmail");
            String password = (String) session.getAttribute("drawPassword");
            String accounttype = (String) session.getAttribute("accounttype");
            String name = (String) session.getAttribute("name");
            String date = (String) session.getAttribute("date");
            String phone = (String) session.getAttribute("phone");
            String address = (String) session.getAttribute("address");
            String gender = (String) session.getAttribute("address");
            // mặc định user_status = 1

            UserDAO ud = new UserDAO();
            ud.insert(userName, password, email, accounttype, name, date, address, gender, phone);

            //xóa thông tin rác
            session.removeAttribute("drawUserName");
            session.removeAttribute("drawEmail");
            session.removeAttribute("drawPassword");
            session.removeAttribute("accounttype");
            session.removeAttribute("name");
            session.removeAttribute("date");
            session.removeAttribute("phone");
            session.removeAttribute("address");
            session.removeAttribute("address");

            request.getRequestDispatcher("/signup/success.jsp").forward(request, response);
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

}
