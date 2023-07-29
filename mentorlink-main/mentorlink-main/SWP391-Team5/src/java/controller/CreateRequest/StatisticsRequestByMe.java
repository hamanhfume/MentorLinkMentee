/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.CreateRequest;

import dao.requestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import model.RequestName;
import model.User;

/**
 *
 * @author Tuan Vinh
 */
@WebServlet(name = "StatisticsRequestByMe", urlPatterns = {"/satisticsRequest"})
public class StatisticsRequestByMe extends HttpServlet {

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
        // lấy id_request 
        HttpSession session = request.getSession();
        String request_id=request.getParameter("idDel");
        String idp = request.getParameter("id");
        // khởi tạo đối tượng requestDAO
        requestDAO dao = new requestDAO();
        //User sessionUser = (User) session.getAttribute("acc");
        User sessionUser = (User) session.getAttribute("acc");
        String sessionUser_id = sessionUser.getUser_id();
        //String sessionUser_id = "3";
        Date currentTime = new Date(); 
        // nếu id_request khác null thì sẽ chuyển rquest vào hàm xóa 
        if(request_id!=null){
            // gọi đến hàm delete để xóa skill của request
        dao.DeleteRequestSkill(request_id);
            //gọi đến hàm deleteIDformente để xóa request mà người dùng chọn
        dao.deletebyIDForMente(request_id);
        }
        
        int sum=0;
        if(idp!=null){
            int idr = Integer.parseInt(idp);
            dao.update(4, idr);  
        }
        // lấy tất cả các request của mentee
        List<RequestName> list1 = dao.listRequestByID(sessionUser_id);
        // tính tống thời gian học của mentee
        int sum_time = dao.sumTime_Study(sessionUser_id);
        // đếm số mentor mà mentee đã thuê
        int count_mentor = dao.count_Mentor(sessionUser_id);
        //tính tỏng số request
        sum=list1.size();
        request.setAttribute("count", count_mentor);
        request.setAttribute("sum_study", sum_time);
        request.setAttribute("sum", sum);
        // ửo đây kiểm tra xem thời gian tạo request 
        for (RequestName request1 : list1) {
              // kiểm tra nếu request đang ở trạng thìa open thì sẽ kiểm tra time_begin với thời gian hiện tại 
            if(request1.getRequest_status()==1){
                Timestamp timeBeginString = request1.getTime_begin();
                // nếu time_begin trước thười gian hiện tại thì chuyển trạng thái thành hủy 
                // nếu sau thì giữ nguyên trạng thái 
                if (timeBeginString.before(currentTime)) {
                    request1.setRequest_status(3);
                } else if (timeBeginString.after(currentTime)) {
                    request1.setRequest_status(1);
                }
            }
        }
        // cập nhật thay đổi vào database và chuyền lại trang jsp
        for (RequestName request1 : list1) {
                dao.update(request1.getRequest_status(),request1.getRequest_id());
            }
        request.setAttribute("lista", list1);
            request.getRequestDispatcher("/mentee/statisticRequestByMe.jsp").forward(request, response);

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
        processRequest(request, response);
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
