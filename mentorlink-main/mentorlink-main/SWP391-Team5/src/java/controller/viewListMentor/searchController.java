/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.viewListMentor;

import dao.MentorCVDAO;
import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CV_Mentor;
import model.Skill;

/**
 *
 * @author admin
 */
@WebServlet(name = "searchController", urlPatterns = {"/search"})
public class searchController extends HttpServlet {

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
        // Get all list skills
        SkillDAO sk = new SkillDAO();
        List<Skill> listS = sk.getAllSkillByStatus();
        request.setAttribute("listS", listS);

// Retrieve search parameters from the request
        String skill_id_raw = request.getParameter("skill_id");
        String keyword = request.getParameter("keyword");
        String profession = request.getParameter("profession");
        String service = request.getParameter("service");
        String achievements = request.getParameter("achievements");
        int skill_id;
        skill_id = (skill_id_raw == null) ? 0 : Integer.parseInt(skill_id_raw);
        MentorCVDAO cv = new MentorCVDAO();
        List<CV_Mentor> listM = cv.search(keyword, profession, service, achievements, skill_id);
        request.setAttribute("listM", listM);

        // Search mentors based on the provided parameters
        // Pagination
        int page, numPerPage = 8;
        int size = listM.size();
        int num = (size % 8 == 0) ? (size / 8) : ((size / 8) + 1);
        String xpage = request.getParameter("page");

        // Check if the "page" parameter is null, set the default page to 1
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numPerPage;
        end = Math.min(page * numPerPage, size);

        // Get the mentors list for the current page
        List<CV_Mentor> listTT = cv.getListByPage(listM, start, end);
        request.setAttribute("listM", listTT);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.getRequestDispatcher("common/viewListMentor.jsp").forward(request, response);
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
