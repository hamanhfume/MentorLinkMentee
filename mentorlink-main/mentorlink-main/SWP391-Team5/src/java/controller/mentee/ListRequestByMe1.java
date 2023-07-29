package controller.mentee;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.requestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import model.Request;
import model.RequestName;
import model.Skill;
import model.User;

/**
 *
 * @author SANG
 */
public class ListRequestByMe1 extends HttpServlet {

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
        String request_idDel = request.getParameter("idDel");
        String request_idCan = request.getParameter("idCancel");
        String idAcc = request.getParameter("idAcc");
        String idRej = request.getParameter("idRej");
        String idp = request.getParameter("id");

        String index = request.getParameter("index");
        //Do luc dau chay chua co gia tri -> Nen phai gan gia tri = 1 tuc la trang dau tien. De lan dau chay o trang 1 va khac null
        if (index == null) {
            index = "1";
        }
        int indexPage = Integer.parseInt(index);

        requestDAO dao = new requestDAO();
        //User sessionUser = (User) session.getAttribute("acc");
        User sessionUser = (User) session.getAttribute("acc");
        String sessionUser_id = sessionUser.getUser_id();
        //String sessionUser_id = "3";
        Date currentTime = new Date();

        if (request_idDel != null) {
            dao.DeleteRequestSkill(request_idDel);
            dao.deletebyIDForMente(request_idDel);
        }

        if (request_idCan != null) {
            dao.cancelRequest(request_idCan);
        }
//        if (idAcc != null) {
//            dao.acceptOrRejectRequest(idAcc, 5);
//        }
        if (idRej != null) {
            dao.acceptOrRejectRequest(idRej, 2);
        }
        int sum = 0;
        if (idAcc != null) {
            int idr = Integer.parseInt(idAcc);
            RequestName rn = dao.getRequestByID(idr);
            int MenTorID = rn.getMentor_id();
            List<Skill> ls = rn.getSkill_name();
//            String url = "commentAndRateStart?mentorId="+MenTorID;
            String url = "commentAndRateStart?mentorId=" + MenTorID;
            for (Skill l : ls) {
                url += "&skillId=" + l.getSkill_id();
            }
            dao.update(5, idr);
            response.sendRedirect(url);
        }
        List<RequestName> list1 = dao.listRequestByIDMente(sessionUser_id, indexPage);
        List<RequestName> sumRq = dao.listRequestByID(sessionUser_id);

        sum = sumRq.size();
        request.setAttribute("sum", sum);

        for (RequestName request1 : list1) {
            if (request1.getRequest_status() == 5) {
                if (dao.checkTime(request1.getFinish_date())) {
                    dao.update(4, request1.getRequest_id());
                }
            }
            if (request1.getRequest_status() == 1) {
                Timestamp timeBeginString = request1.getTime_begin();

                if (timeBeginString.before(currentTime)) {
                    request1.setRequest_status(3);
                } else if (timeBeginString.after(currentTime)) {
                    request1.setRequest_status(1);
                }
            }
        }
        for (RequestName request1 : list1) {
            dao.update(request1.getRequest_status(), request1.getRequest_id());
        }
        request.setAttribute("lista", list1);
        request.setAttribute("indexPagee", indexPage);
        request.getRequestDispatcher("/mentee/listrequestbyme.jsp").forward(request, response);

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
