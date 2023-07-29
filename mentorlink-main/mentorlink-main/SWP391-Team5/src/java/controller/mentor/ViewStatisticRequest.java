/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dao.requestDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.MentorRatingStats;
import model.MentorRequest;
import model.MentorRequestStats;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "ViewStatisticRequest", urlPatterns = {"/viewStatistic"})
public class ViewStatisticRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

        //Getdata request static
        try {
            // Lấy phiên làm việc hiện tại
            HttpSession session = request.getSession();

            // Lấy đối tượng User từ phiên làm việc
            User abc = (User) session.getAttribute("acc");

            // Lấy user_id từ đối tượng User
            int user_id = Integer.parseInt(abc.getUser_id());

            // Khởi tạo đối tượng requestDAO để thao tác với cơ sở dữ liệu
            requestDAO rq = new requestDAO();

            // Lấy thông tin thống kê yêu cầu từ MentorRequestStats
            MentorRequestStats mrs = rq.getStatisticByMentorId(user_id);

            // Lấy danh sách yêu cầu từ List<MentorRequest>
            List<MentorRequest> listR = rq.getListRequestByMentorId(user_id);

            // Lấy điểm đánh giá cao nhất từ mentor_id
            int topRank = rq.getTopRateAVGStarByMentorId(user_id);

            // Lấy danh sách các đối tượng MentorRatingStats
            List<MentorRatingStats> listRS = rq.getListTopRankStar();

            // Đặt các thuộc tính trong request để truyền dữ liệu sang view
            request.setAttribute("object", mrs);
            request.setAttribute("listR", listR);
            request.setAttribute("top", topRank);
            request.setAttribute("listRS", listRS);
        } catch (Exception e) {
            // In thông báo lỗi ra màn hình
            System.out.println(e.fillInStackTrace());
        }
        request.getRequestDispatcher("home/home.jsp").forward(request, response);
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
