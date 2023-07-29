package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Mentee;
import model.MentorInfo;
import model.SkillMentee;

/**
 *
 * @author admin
 */
//Test merge
//Test 2
//Test tiep
//Test tiep2
//Test tiep3
//Test tiep4
//Test tiep5
//Merge 206
public class MenteeDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    private int mentee_id;
//    private String mentee_name;
//    private String mentee_account;
//    private String mentee_avatar_img;
//    private byte mentee_gender;
//    private byte mentee_status;
//    private int mentee_hours;
    public List<Mentee> getMentees(int index) {
        List<Mentee> list = new ArrayList<>();

        try {
            String query = "SELECT\n"
                + "    user.user_id,\n"
                +  "  user.full_name,\n"
                + "    user.username,\n"
                + "    subquery.time_study,\n"
                + "    COUNT(DISTINCT request_skill.skill_id) AS skill_count\n"
                + "FROM"
                + "    swp391_group5.`user`\n"
                +  "  JOIN swp391_group5.`request` ON user.user_id = request.mentee_id\n"
                + "    LEFT JOIN (\n"
                + "        SELECT\n"
                + "            request.mentee_id,\n"
                + "            SUM(request.time_study) AS time_study\n"
                + "        FROM\n"
                + "            swp391_group5.`request`\n"
                + "        GROUP BY\n"
                + "            request.mentee_id\n"
                + "    ) AS subquery ON request.mentee_id = subquery.mentee_id\n"
                + "    LEFT JOIN swp391_group5.`request_skill` ON request.request_id = request_skill.request_id\n"
                + "GROUP BY\n"
                + "    user.user_id,\n"
                + "    user.full_name,\n"
                + "    user.username,\n"
                + "    subquery.time_study\n"
                + "ORDER BY\n"
                + "    user.user_id ASC\n" // Sort by full_name in ascending order
                + "LIMIT 10 OFFSET ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            // Moi page 10 rows: Index  là vi tri page
            ps.setInt(1, (index - 1) * 10);
            rs = ps.executeQuery();
            while (rs.next()) {              
                list.add(new Mentee(rs.getInt("user_id"), rs.getString("full_name"), rs.getString("username"), rs.getInt("time_study"), rs.getInt("skill_count")));
            }
            return list;
        } catch (Exception ex) {
        }
        return null;
    }

    public List<SkillMentee> getSkillMentees() {
        List<SkillMentee> s = new ArrayList<>();

        try {
            String sql = "select c.mentee_id, a.skill_name, a.skill_status, a.skill_img from skill as a join request_skill  as b on a.skill_id = b.skill_id join request as c on b.request_id = c.request_id;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int xMentee_id;
            String xMenteeSkillName, xMenteeImage;
            byte xMenteeStatus;
            SkillMentee x;
            while (rs.next()) {
                xMentee_id = rs.getInt("mentee_id");
                xMenteeSkillName = rs.getString("skill_name");
                xMenteeImage = rs.getString("skill_img");
                xMenteeStatus = rs.getByte("skill_status");
                x = new SkillMentee(xMentee_id, xMenteeSkillName, xMenteeStatus, xMenteeImage);
                s.add(x);
            }
            rs.close();
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (s);
    }

    public int sumMentee(List<Mentee> t) {
        int result = 0;
        for (Mentee mentee : t) {
            result++;
        }
        return result;
    }

//    public static void main(String[] args) {
//        MenteeDAO d = new MenteeDAO();
//        List<SkillMentee> t = d.getSkillMentees();
//        for (SkillMentee mentee : t) {
//            System.out.println(mentee.getSkillName());
//        }
//    }
    
    //Lấy ra số lượng trang n /  trên tổng số trang. của trang listmentee (admin)
    public int getNumberPage2() {
        String query = "SELECT\n"
                + "COUNT(DISTINCT user.user_id) AS total_records\n"
                + "FROM\n"
                + "    swp391_group5.`user`\n"
                + "    JOIN swp391_group5.`request` ON user.user_id = request.mentee_id\n"
                + "    LEFT JOIN (\n"
                + "        SELECT\n"
                + "            request.mentee_id,\n"
                + "            SUM(request.time_study) AS time_study\n"
                + "        FROM\n"
                + "            swp391_group5.`request`\n"
                + "        GROUP BY\n"
                + "            request.mentee_id\n"
                + "    ) AS subquery ON request.mentee_id = subquery.mentee_id\n"
                + "    LEFT JOIN swp391_group5.`request_skill` ON request.request_id = request_skill.request_id\n"
                + "WHERE\n"
                + "    user.role = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                //Tổng số bản ghi mentor được lấy ra.
                int total = rs.getInt(1);
                int countPage = 0;
                //Tổng số bản ghi mentor được lấy ra / Số lượng bản ghi sẽ có trên một trang. 
                // Lay Ra So luong trang ( Moi trang la 10 bang ghi).
                countPage = total / 10;
                if (total % 10 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

}
