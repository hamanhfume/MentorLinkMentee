    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.fogetPassword;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "verifyCodeController", urlPatterns = {"/verifyCode"})
public class verifyCodeController extends HttpServlet {


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
        //Get inform verify code form by user 
        String verifyCode = request.getParameter("confirm").trim();
        //Get verify code from Session 
        HttpSession verifyPremium = request.getSession();
        String Code = String.valueOf(verifyPremium.getAttribute("verifyCode"));
        request.setAttribute("tk", "Thank you!");
        //Code confirm match vs code
        if (verifyCode.equals(Code)) {
            request.setAttribute("alertTitle", "Thank you!");
            request.getRequestDispatcher("forgetPassword/verifySuccessful.jsp").forward(request, response);
        //Code confirm doesn't match vs code
        } else {
            request.setAttribute("alertTitle", "Sorry!");
            request.getRequestDispatcher("forgetPassword/verifyFail.jsp").forward(request, response);
        }
    }



}
