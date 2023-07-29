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
public class ChangePassServlet extends HttpServlet {

    static String a;

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
            out.println("<title>Servlet ChangePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassServlet at " + request.getContextPath() + "</h1>");
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
         request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
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
        User sessionUser = (User) session.getAttribute("acc");
        String sessionUsername = sessionUser.getUsername();
        String user = request.getParameter("username");
        String oldp = request.getParameter("oldpass");
        String newp = request.getParameter("newpass");
        String verifyp = request.getParameter("repass");
        UserDAO d = new UserDAO();
        int id = d.getUserIDByUserAndPass(user, oldp);
        if (!sessionUsername.equalsIgnoreCase(user)) {
            request.setAttribute("error", "Username must matched username logged!");
            request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
        }
        if (oldp.equals(newp)) {
            request.setAttribute("error", "The new password cannot be the same as the old password!");
            request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
        }
        if (!verifyp.equals(newp)) {
            request.setAttribute("error", "Password is not match!");
            request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
        }
        if (id == -1) {

            request.setAttribute("error", "Username or Password invalid");
            request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
        } else if(!newp.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$")){
            //System.out.println("mật khảu phải từ 8-20 ký tự , 1 chữ hoa, 1 số , 1 ký tự đặc biệt");
            request.setAttribute("error", "Password is Invalid!");
            request.getRequestDispatcher("/changePassword/changePassword.jsp").forward(request, response);
        }else {
            d.changepass(id, newp);
            session.removeAttribute("user");
            session.removeAttribute("acc");
            request.setAttribute("noti", "You changed password successfully. Please login again!");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
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
