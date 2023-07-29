/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.CreateRequest;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import dao.requestDAO;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Skill;

/**
 *
 * @author damtu
 */
public class requestMentor extends HttpServlet {
    static int id_temp;
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
        
        
        //   request.setAttribute("errE", "Lỗi: Thời điểm kết thúc nhỏ hơn thời điểm bắt đầu");
       requestDAO dao = new requestDAO();
        List<Skill> list = dao.getAllskillBySkill_id(id_temp);
        // day data len jsp
        request.setAttribute("listp", list);
//            request.setAttribute("id", id_mentor);
        request.getRequestDispatcher("mentee/createRequest.jsp").forward(request, response);
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_mentor = request.getParameter("mentor_id");
        id_temp = Integer.parseInt(id_mentor);
        //   request.setAttribute("errE", "Lỗi: Thời điểm kết thúc nhỏ hơn thời điểm bắt đầu");
        requestDAO dao = new requestDAO();
        List<Skill> list = dao.getAllskillBySkill_id(Integer.parseInt(id_mentor));
        // day data len jsp
        request.setAttribute("listp", list);
//            request.setAttribute("id", id_mentor);
        request.getRequestDispatcher("mentee/createRequest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // lấy id của mentee
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("acc");
        String sessionUser_id = sessionUser.getUser_id();
        request.setAttribute("menteeId", sessionUser_id);
        //lấy mail của mentee  
        String mail = sessionUser.getEmail();
        String name = sessionUser.getFull_name();
        //lấy id mentor
        String tieude = request.getParameter("tieude");
        String batdau = request.getParameter("batdau");
        String ketthuc = request.getParameter("ketthuc");
        String sogiohoc = request.getParameter("sogiohoc");
        String noidung = request.getParameter("noidung");
        String[] skills = request.getParameterValues("skills");
        String framework = request.getParameter("framework");
        request.setAttribute("skills", skills);
        Mail ml = new Mail();
        
        //********************************************************
        requestMentor rq = new requestMentor();
        Timestamp batdau1 = rq.convertToTimestamp(batdau);
        Timestamp ketthuc1 = rq.convertToTimestamp(ketthuc);
        //***********************************************************************
        long khoangCach = ketthuc1.getTime() - batdau1.getTime();
        long soGioHoc1 = Long.parseLong(sogiohoc) * 3600000; // Chuyển số giờ học thành mili giây
        boolean result = false;

        //***********************************************************************
        if (isEmpty(tieude) || isEmpty(batdau) || isEmpty(ketthuc) || isEmpty(sogiohoc)
                || isEmpty(noidung) || skills == null ) {
            request.setAttribute("errE", "No information can be left blank!");
            processRequest(request, response);
        } else if (skills == null || skills.length < 1 || skills.length > 3) {
            System.out.println("Lỗi: Số lượng kỹ năng phải từ 1 đến 3");
            request.setAttribute("errE", "Error: The number of skills must be from 1 to 3");
            processRequest(request, response);
        } else if (khoangCach < soGioHoc1) {
            System.out.println("Lỗi: Thời gian bắt đầu và kết thúc phải lớn hơn hoạc bằng với số giờ học");
            request.setAttribute("errE", "Error: The start and end times must be greater than or equal to the number of hours");
            processRequest(request, response);
        } else if (ketthuc1.before(batdau1)) {
            System.out.println("Lỗi: Thời điểm kết thúc nhỏ hơn thời điểm bắt đầu ");
            request.setAttribute("errE", "Error: End time is less than start time");
            processRequest(request, response);
        } else {
            // Kiểm tra nếu kết thúc cách bắt đầu ít nhất 1 giờ
            long diffInMillies = ketthuc1.getTime() - batdau1.getTime();
            long diffInHours = diffInMillies / (60 * 60 * 1000);
            // Chuyển đổi milliseconds sang giờ

            if (diffInHours < 1) {
                System.out.println("Lỗi: Thời điểm kết thúc phải cách bắt đầu ít nhất 1 giờ");
                request.setAttribute("errE", "Error: End time must be at least 1 hour from start!");
                processRequest(request, response);
            } else {
                requestDAO DAO = new requestDAO();
                
                String email_mentor = DAO.getmailmentor(id_temp);
                System.out.println(email_mentor);
                try {
                    result = DAO.insert1(tieude, batdau1, id_temp, sessionUser_id, ketthuc1, sogiohoc, noidung, framework, skills);
                    String messageText = "Mentor Link hello: " + name
                    + "\nTitle: " + tieude
                    + "\nStart time: " + batdau1
                    + "\nEnd time : " + ketthuc1
                    + "\nDuration of study: " + sogiohoc
                    + "\ncontent: " + noidung
                    + "\nRequests will be approved at the latest 12 hours";
                    ml.send(mail, messageText);
                     String message = "You have a new request from: " + name
                    + "\nTitle: " + tieude
                    + "\nStart time: " + batdau1
                    + "\nEnd time ...: " + ketthuc1
                    + "\nDuration of study: " + sogiohoc
                    + "\ncontent: " + noidung
                    + "\nRequests will be approved at the latest 12 hours";
                     ml.send(email_mentor, message);
                    request.getRequestDispatcher("/common/successfully.jsp").forward(request, response);
                } catch (SQLException e) {
                    // Xử lý ngoại lệ ở đây
                    result = false; // hoặc thực hiện hành động khác khi có lỗi
                } 
                catch (ParseException ex) {
                    Logger.getLogger(requestMentor.class.getName()).log(Level.SEVERE, null, ex);
                }
               
            }

        }
        
    }

    boolean isEmpty(String msg) {
        boolean result = false;
        if (msg.isEmpty()) {
            result = true;
        }
        return result;
    }

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

}
