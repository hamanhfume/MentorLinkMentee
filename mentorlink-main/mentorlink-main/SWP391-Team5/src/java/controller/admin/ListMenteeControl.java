/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.MenteeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Mentee;

/**
 *
 * @author Tuan Vinh
 */
public class ListMenteeControl extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String index = request.getParameter("index");
        //Do luc dau chay chua co gia tri -> Nen phai gan gia tri = 1 tuc la trang dau tien. De lan dau chay o trang 1 va khac null
        if (index == null) {
            index = "1";
        }        
        int indexPage = Integer.parseInt(index);
        MenteeDAO dao = new MenteeDAO();
        List<Mentee> list = dao.getMentees(indexPage);

        //Gui Danh sach Mentor đa duoc phan trang kèm theo vi tri page
        request.setAttribute("listMentee", list);
        request.setAttribute("indexPagee", indexPage);
        request.getRequestDispatcher("admin/listmentee.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
