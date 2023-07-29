/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.fogetPassword;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "forgetPasswordServlet", urlPatterns = {"/forgetPassword"})
public class forgetPasswordController extends HttpServlet {

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
        request.getRequestDispatcher("forgetPassword/forgetPassword.jsp").forward(request, response);
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
        //Get information in form forgetpassword
        String username = request.getParameter("username");
        String email = request.getParameter("use_email");
        //
        UserDAO userDao = new UserDAO();
        User acount = userDao.checkUserExisted(username);

        //user not exist
        if(acount == null) {
            request.setAttribute("mess", "The account name or email is incorrect, please re-enter!");
            request.getRequestDispatcher("forgetPassword/forgetPassword.jsp").forward(request, response);
        //username existed    
        }else {
            //Set account to session
            request.getSession().setAttribute("userForgetPass", acount);
            //email that matches the account
            if(email.equals(acount.getEmail())){
                request.setAttribute("userForgetPass", acount);
                request.getRequestDispatcher("sendMail").forward(request, response);
            //email doesn't match the account    
            }else{
                request.setAttribute("mess", "The account name or email is incorrect, please re-enter!");
                request.getRequestDispatcher("forgetPassword/forgetPassword.jsp").forward(request, response);
            }
        }
    }


}
