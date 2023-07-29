/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.fogetPassword;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "changePasswordController", urlPatterns = {"/resetPassword"})
public class changePasswordController extends HttpServlet {

    

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
        request.getRequestDispatcher("forgetPassword/changePassword.jsp").forward(request, response);
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
        
        String newPass = request.getParameter("password");
        String newCfPass = request.getParameter("cfpassword");
        User accountSession = (User) request.getSession().getAttribute("userForgetPass");
        String username = accountSession.getUsername();
        
        // ^: The caret symbol at the beginning indicates that the password must start at the beginning of the input string.
        // (?=.*[0-9]): This is a positive lookahead assertion. It requires the password to contain at least one numeric digit (0-9).
        // (?=.*[a-z]): This is another positive lookahead assertion, ensuring the password contains at least one lowercase letter (a-z).
        // (?=.*[A-Z]): This positive lookahead assertion checks for at least one uppercase letter (A-Z) in the password.
        // (?=.*[!@#&()-[{}]:;',?/*~$^+=<>]): This positive lookahead assertion demands the presence of at least one special character from the given set: !@#&()-[{}]:;',?/*~$^+=<>.
        // .{8,20}: This part ensures that the password length is between 8 and 20 characters.
        // $: The dollar sign at the end indicates that the password must end at the end of the input string.
        String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        //new password doesn't match new password confirm
        if (!newPass.equals(newCfPass)) {
            request.setAttribute("mess2", "Password mismatch. Please re-enter!");
            request.getRequestDispatcher("forgetPassword/changePassword.jsp").forward(request, response);
         //new password match with new password confirm   
        } else {
            //new password match with regex
            if (newPass.matches(passwordRegex)) {
                UserDAO account = new UserDAO();
                account.updatePassword(username, newPass);
                request.getRequestDispatcher("changePassSuccess").forward(request, response);
            //new password doesn't match with regex password    
            } else {
                request.setAttribute("mess1", "Passwords must include 8 or more characters and must include uppercase, lowercase, numbers 0 through 9, and include special characters");
                request.getRequestDispatcher("forgetPassword/changePassword.jsp").forward(request, response);
            }

        }
    }



}
