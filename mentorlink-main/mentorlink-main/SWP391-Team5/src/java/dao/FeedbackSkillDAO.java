/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Feedback_Skill;
import model.Skill;

/**
 *
 * @author Tuan Vinh
 */
public class FeedbackSkillDAO extends DBContext {
    /**
     * Lay ra skill cua mentor kem danh gia
     * @param mentor_id
     * @return 
     */
    public ArrayList<Feedback_Skill> getStarRateSkill(String mentor_id) {
        ArrayList<Feedback_Skill> list = new ArrayList<>();
        String sql = "SELECT feedback_skill.skill_id, skill.skill_name, COUNT(*) AS skill_count, SUM(feedback_skill.rate_skill) AS total_rate_skill, ROUND(SUM(feedback_skill.rate_skill) / COUNT(*), 1) AS avg_rate_skill\n"
                + "FROM swp391_group5.feedback_skill\n"
                + "JOIN swp391_group5.skill ON feedback_skill.skill_id = skill.skill_id\n"
                + "WHERE feedback_skill.mentor_id = ?\n"
                + "GROUP BY feedback_skill.skill_id, skill.skill_name;";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, mentor_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Feedback_Skill(rs.getFloat("avg_rate_skill"),
                        new Skill(rs.getString("skill_name"))));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    public static void main(String[] args) {
//        // Kết nối cơ sở dữ liệu và tạo đối tượng Feedback_SkillDAO (giả sử)      
//        FeedbackSkillDAO feedbackSkillDAO = new FeedbackSkillDAO();
//
//        // Thực hiện gọi phương thức getStarRateSkill và lấy danh sách kết quả
//        String mentorId = "2";
//        ArrayList<Feedback_Skill> feedbackSkills = feedbackSkillDAO.getStarRateSkill(mentorId);
//
//        // Hiển thị kết quả
//        if (!feedbackSkills.isEmpty()) {
//            for (Feedback_Skill feedbackSkill : feedbackSkills) {
//                System.out.println("Skill Name: " + feedbackSkill.getSkill().getSkill_name());
//                System.out.println("Average Rate Skill: " + feedbackSkill.getStar_rate_skill());
//                System.out.println("--------------------");
//            }
//        } else {
//            System.out.println("No feedback skills found for the given mentor ID.");
//        }
//       
//    }


}
