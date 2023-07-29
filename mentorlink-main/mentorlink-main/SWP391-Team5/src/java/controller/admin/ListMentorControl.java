/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.MentorInfo;

import dao.MentorCVDAO;

@WebServlet(name = "ListMentorControl", urlPatterns = {"/listmentor"})
public class ListMentorControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String index = request.getParameter("index");
        //Do luc dau chay chua co gia tri -> Nen phai gan gia tri = 1 tuc la trang dau tien. De lan dau chay o trang 1 va khac null
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        List<MentorInfo> mentors = new ArrayList<>();
        MentorCVDAO c = new MentorCVDAO();

        mentors = c.GetListMentorPagingAdm(indexPage);
        //Gui Danh sach Mentor đa duoc phan trang kèm theo vi tri page
        request.setAttribute("listMentor", mentors);
        request.setAttribute("indexPagee", indexPage);
        request.getRequestDispatcher("admin/listmentor.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
