/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import controller.CreateRequest.Mail;
import controller.CreateRequest.requestMentor;
import dao.requestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Request;
import model.Skill;
import model.User;
import model.skill_Request;

/**
 *
 * @author damtu
 */
@WebServlet(name = "updateRequest", urlPatterns = {"/updateRequest"})
public class updateRequest extends HttpServlet {

    static int id_temp;
    static int id_request;

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
        HttpSession session = request.getSession();
        // gọi đến đối tượng requestDAO
        requestDAO dao = new requestDAO();
        //list request theo id_request
        Request re = dao.listbyRequest_ID(id_request);
        //list skill menter of request
        List<Skill> list_a = dao.getAllskillBySkill_id(id_temp);
        // list request_skill theo id 
        List<skill_Request> list_b = dao.listRequest_SkillByID(id_request);
        // đẩy dự liệu lên cho người dùng 
        request.setAttribute("List_skillRequest", list_b);
        request.setAttribute("request", re);
        request.setAttribute("list_Skill", list_a);
        request.getRequestDispatcher("/mentee/updateRequest.jsp").forward(request, response);

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
        String request_id = request.getParameter("request_id");
        id_request = Integer.parseInt(request_id);
        String id_mentor = request.getParameter("mentor_id");
        id_temp = Integer.parseInt(id_mentor);

        requestDAO dao = new requestDAO();
        //list request theo id
        Request re = dao.listbyRequest_ID(id_request);
        //list skill menter of request
        List<Skill> list_a = dao.getAllskillBySkill_id(Integer.parseInt(id_mentor));
        List<skill_Request> list_b = dao.listRequest_SkillByID(id_request);
        request.setAttribute("List_skillRequest", list_b);
        request.setAttribute("request", re);
        request.setAttribute("list_Skill", list_a);
        request.getRequestDispatcher("/mentee/updateRequest.jsp").forward(request, response);
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
        // lấy id của mentee
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("acc");
        String sessionUser_id = sessionUser.getUser_id();
        //lấy mail của mentee  
        String mail = sessionUser.getEmail();
        String name = sessionUser.getFull_name();
        // nhận thông tin trên jsp
        String tieude = request.getParameter("tieude");
        String batdau = request.getParameter("batdau");
        String ketthuc = request.getParameter("ketthuc");
        String sogiohoc = request.getParameter("sogiohoc");
        String noidung = request.getParameter("noidung");
        String[] skills = request.getParameterValues("skills");
        request.setAttribute("skills", skills);
        Mail ml = new Mail();
        //********************************************************
        // đổi time nhận tưf trên jsp từu string sang timestamp
        requestMentor rq = new requestMentor();
        Timestamp batdau1 = rq.convertToTimestamp(batdau);
        Timestamp ketthuc1 = rq.convertToTimestamp(ketthuc);
        //***********************************************************************
        // tính khoảng cách của thời gian bắt đầu với thời gian kết thúc
        long khoangCach = ketthuc1.getTime() - batdau1.getTime();
        long soGioHoc1 = Long.parseLong(sogiohoc) * 3600000; // Chuyển số giờ học thành mili giây
        boolean result = false;
        //***********************************************************************
        // kiểm tra xem người dùng có nhập thiếu trường thông tin nào không 
        if (isEmpty(tieude) || isEmpty(batdau) || isEmpty(ketthuc) || isEmpty(sogiohoc)
                || isEmpty(noidung) || skills == null) {
            request.setAttribute("errE", "No information can be left blank!");
            processRequest(request, response);
        }// kiểm tra số ký năng mà người dùng chọn phải >=1 và <=3
        else if (skills == null || skills.length < 1 || skills.length > 3) {
            System.out.println("Lỗi: Số lượng kỹ năng phải từ 1 đến 3");
            request.setAttribute("errE", "Error: The number of skills must be from 1 to 3");
            processRequest(request, response);
        }// khoảng cách lớn hơn hoặc bằng với số giừ học 
        else if (khoangCach < soGioHoc1) {
            System.out.println("Lỗi: Thời gian bắt đầu và kết thúc phải lớn hơn hoạc bằng với số giờ học");
            request.setAttribute("errE", "Error: The start and end times must be greater than or equal to the number of hours");
            processRequest(request, response);
        } //so sánh thời gian kết thcs với thời gian bắtd dầu
        else if (ketthuc1.before(batdau1)) {
            System.out.println("Lỗi: Thời điểm kết thúc nhỏ hơn thời điểm bắt đầu ");
            request.setAttribute("errE", "Error: End time is less than start time");
            processRequest(request, response);
        } else {
            // Kiểm tra nếu kết thúc cách bắt đầu ít nhất 1 giờ
            long diffInMillies = ketthuc1.getTime() - batdau1.getTime();
            long diffInHours = diffInMillies / (60 * 60 * 1000);
            // Chuyển đổi milliseconds sang giờ
            // thờ gian kết thúc phải cachs thười gian bắt dầu ít nhất 1 giờ
            if (diffInHours < 1) {
                System.out.println("Lỗi: Thời điểm kết thúc phải cách bắt đầu ít nhất 1 giờ");
                request.setAttribute("errE", "Error: End time must be at least 1 hour from start!");
                processRequest(request, response);
            } else {
                requestDAO DAO = new requestDAO();
                try {
                    //update cá thông tin mà người dùng muốn cập nhật xuống database
                    result = DAO.update_request(id_request, tieude, batdau1, ketthuc1, sogiohoc, noidung, skills); // Xử lý ngoại lệ ở đây
                    // gửi mail cho người dùng 
                   
                } catch (SQLException e) {
                    // Xử lý ngoại lệ ở đây
                    result = false; // hoặc thực hiện hành động khác khi có lỗi
                } 

            }

        }
        request.getRequestDispatcher("/common/successfully.jsp").forward(request, response);

    }

    /**
     * kiểm tra xem có gia strij nào br trống
     *
     * @param msg Tham số đầu vào của hàm (nếu có)
     * @return trả về boolean result
     */
    boolean isEmpty(String msg) {
        boolean result = false;
        if (msg.isEmpty()) {
            result = true;
        }
        return result;
    }

    /**
     * chuyển đởi thời gian từu dạng string sang dạn timestamp
     *
     * @param timestampString
     * @return timestamp
     */
    public static Timestamp convertToTimestamp(String timestampString) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        try {
            // Chuyển đổi chuỗi thành đối tượng java.util.Date
            java.util.Date parsedDate = dateFormat.parse(timestampString);

            // Chuyển đổi java.util.Date thành Timestamp
            Timestamp timestamp = new Timestamp(parsedDate.getTime());

            return timestamp;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
