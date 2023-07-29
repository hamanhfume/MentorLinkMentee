/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import controller.CreateRequest.Mail;
import dao.requestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Request;
import model.User;

/**
 *
 * @author Tuan Vinh
 */
public class ListFollowingRequest extends HttpServlet {

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
        HttpSession session = request.getSession();
        // Lấy thông tin người dùng từ session lưu trữ trong thuộc tính có tên "acc"
        User sessionUser = (User) session.getAttribute("acc");
        // Lấy user_id từ đối tượng User lấy từ session
        String sessionUser_id = sessionUser.getUser_id();
        String index = request.getParameter("index");
        //Do luc dau chay chua co gia tri -> Nen phai gan gia tri = 1 tuc la trang dau tien. De lan dau chay o trang 1 va khac null
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        requestDAO dao = new requestDAO(); 
        //Lay ra tat cac cac request tu mentee gui den mentor
        List<Request> listR = dao.listRequestByMetorID(sessionUser_id, indexPage);
        
        //Kiem tra danh sach nay
        if(listR != null) {
            request.setAttribute("indexPagee", indexPage);
            request.setAttribute("listR", listR);
        } 
        if(listR.isEmpty()) {
            request.setAttribute("mess", "Bạn chưa có yêu cầu nào được gửi đến!");

        }
        request.getRequestDispatcher("mentor/listFollowingRequest.jsp").forward(request, response);
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
        processRequest(request, response);
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
        requestDAO dao = new requestDAO();
        //Lay ve yeu cau cua mentor tu ben jsp khi chon tu choi hoac chap nhan yeu cau
        String requestId_yes = request.getParameter("requestId_yes");
        String requestId_no = request.getParameter("requestId_no");
        String requestId_Fi = request.getParameter("requestId_Fi");
        //Kiem tra hanh dong cua mentor va goi den ham de xu li trong DTB
        Mail ml = new Mail();
        if (requestId_yes != null) {
            //.....................
            String email = dao.getEmailToSend(requestId_yes);
            String messageText = "Your request has been approved.";
            try {
                ml.send(email, messageText);
            } catch (ParseException ex) {
                Logger.getLogger(ListFollowingRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
            //................................................
            dao.update_Request_Status(2, requestId_yes);
            processRequest(request, response);
        }
        if (requestId_no != null) {
            //.................................
            String email = dao.getEmailToSend(requestId_no);
            String messageText = "Your request has been declined.";
            try {
                ml.send(email, messageText);
            } catch (ParseException ex) {
                Logger.getLogger(ListFollowingRequest.class.getName()).log(Level.SEVERE, null, ex);
            }
            //............................
            dao.update_Request_Status(3, requestId_no);
            processRequest(request, response);
        }
        
        if(requestId_Fi != null) {
            dao.update_Request_Status_Finish(requestId_Fi); 
            processRequest(request, response);
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
