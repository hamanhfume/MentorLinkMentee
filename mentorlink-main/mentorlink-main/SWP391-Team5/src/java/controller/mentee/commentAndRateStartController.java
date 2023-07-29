    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dao.FeedbackDAO;
import dao.MentorCVDAO;
import dao.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CV_Mentor;
import model.Feedback;
import model.Skill;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "commentAndRateStartController", urlPatterns = {"/commentAndRateStart"})
public class commentAndRateStartController extends HttpServlet {
    int mentor_id;
    String [] skillId;
    int size;
    //int requeset_id;
    /**
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
         skillId = request.getParameterValues("skillId");
         size = skillId.length;
         SkillDAO kd = new SkillDAO();
         //requeset_id =Integer.parseInt(request.getParameter("requestId")) ;
         mentor_id = Integer.parseInt(request.getParameter("mentorId")) ;
         List<Skill> skillList = new ArrayList<Skill>();
         for (String st : skillId) {
             Skill e = kd.getSkillById(st);
             skillList.add(e);
         }
         request.setAttribute("listSkill", skillList);
         request.getRequestDispatcher("/mentee/feedbackmentor.jsp").forward(request, response);
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
        // Retrieve rating and opinion from the request
        int rating = Integer.parseInt(request.getParameter("rating")) ;
        String opinion = request.getParameter("opinion");
        
        // Retrieve user_id from the session
        HttpSession session = request.getSession();
        User abc = (User) session.getAttribute("acc");
        int user_id = Integer.parseInt(abc.getUser_id());

        // Retrieve mentor_id from the request
        
        String rating1 = request.getParameter("rating1");
        String rating2 = request.getParameter("rating2");
        String rating3 = request.getParameter("rating3");
        
        int ratingSkill[] = new int[size];
        if(rating1 != null) {
            ratingSkill[0] = Integer.parseInt(rating1);
        } 
        if(rating2 != null) {
            ratingSkill[1] = Integer.parseInt(rating2);
        }
        if(rating3 != null) {
            ratingSkill[2] = Integer.parseInt(rating3);
        }
        FeedbackDAO dao = new FeedbackDAO();
        if(dao.insertFeedbackSkill(user_id, mentor_id, ratingSkill, skillId) == true && dao.insertFeedback(user_id, mentor_id, rating, opinion) == true ) {
            request.getRequestDispatcher("/mentee/feedbackSuccessful.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "Loi roi be oi");
            request.getRequestDispatcher("/mentee/feedbackSuccessful.jsp").forward(request, response);
        }
        
        
        // Insert feedback into the database
//        FeedbackDAO fb = new FeedbackDAO();
//        if (fb.insertFeedback(user_id, mentor_id, rating, opinion)) {
//            // Retrieve CV details of the mentor
//            MentorCVDAO dao = new MentorCVDAO();
//            CV_Mentor cv = dao.getCvMentorById(String.valueOf(mentor_id));
//
//            // Retrieve the list of all mentors
//            List<CV_Mentor> list = dao.getAllListMentor();
//
//            // Retrieve the list of feedback for the mentor
//            FeedbackDAO dao1 = new FeedbackDAO();
//            List<Feedback> listF = dao1.getAllFeedbackOfMentor(mentor_id);
//
//            // Set attributes in the request for further processing
//            request.setAttribute("mentor_id", mentor_id);
//            request.setAttribute("cv", cv);
//            request.setAttribute("listMentor", list);
//            request.setAttribute("listF", listF);
//
//            // Forward the request to the specified JSP file for rendering
//            request.getRequestDispatcher("feedbacksuccess").forward(request, response);
//        }

    }
}
