/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.MentorRatingStats;
import model.MentorRequest;
import model.MentorRequestStats;
import model.Request;
import model.RequestName;
import model.Request_Skill;
import model.Skill;
import model.User;
import model.skill_Request;

/**
 *
 * @author damtu
 */
public class requestDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Skill> getAllskillBySkill_id(int id_mentor) {

        List<Skill> list = new ArrayList<>();
        String sql = "SELECT cv_skill.mentor_id,cv_skill.skill_id,skill.skill_name,skill.skill_status\n"
                + "FROM swp391_group5.cv_skill\n"
                + "JOIN skill ON cv_skill.skill_id = skill.skill_id where skill.skill_status =1 and cv_skill.mentor_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id_mentor);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4)
                ));
            }

        } catch (Exception e) {

        }
        return list;

    }

    /**
     * Lấy ra các request mà mentor hiện đang có
     *
     * @param mentor_id
     * @param index
     * @return List
     */
    public List<Request> listRequestByMetorID(String mentor_id, int index) {
        List<Request> list1 = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM swp391_group5.request\n"
                + "WHERE mentor_id = ? AND request_status IN (1, 2, 4)\n"
                + "ORDER BY request_id DESC\n"
                + "LIMIT 10 OFFSET ?;";
        String sql2 = "select skill.skill_name from swp391_group5.request_skill join swp391_group5.skill on skill.skill_id = request_skill.skill_id "
                + "where request_skill.request_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(mentor_id));
            ps.setInt(2, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int request_id = rs.getInt("request_id"); // Lấy request_id từ ResultSet
                ArrayList<String> skill_name = new ArrayList<>(); // Khởi tạo ArrayList skill_name cho mỗi bản ghi trong rs

                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, request_id); // Thiết lập request_id cho câu lệnh truy vấn sql2
                ResultSet rs2 = ps2.executeQuery();

                while (rs2.next()) {
                    // Thêm dữ liệu vào ArrayList skill_name
                    skill_name.add(rs2.getString("skill_name"));
                }

                list1.add(new Request(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getTimestamp(7),
                        rs.getTimestamp(8),
                        rs.getTimestamp(9),
                        rs.getInt(10),
                        skill_name
                ));
            }

        } catch (Exception e) {

        }
        return list1;
    }

    /**
     * Update trang thai request cua mentee dua tren hanh dong cua mentor
     *
     * @param request_status
     * @param requestId
     */
    public void update_Request_Status(int request_status, String requestId) {
        String sql = "UPDATE `swp391_group5`.`request` SET `request_status` = ? WHERE `request_id` = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, request_status);
            ps.setString(2, requestId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void update_Request_Status_Finish(String requestId) {
        String sql = "UPDATE `swp391_group5`.`request` SET `request_status` = 4 WHERE `request_id` = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, requestId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<RequestName> listRequestByID(String mentee_id) {
        List<RequestName> list1 = new ArrayList<>();
        String sql = "SELECT * FROM swp391_group5.request where mentee_id= " + mentee_id + " order by request_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestName rn = new RequestName();
                rn.setRequest_id(rs.getInt(1));
                rn.setMentor_id(rs.getInt(2));
                rn.setMentee_id(rs.getInt(3));
                rn.setTitle(rs.getString(4));
                rn.setRequest_content(rs.getString(5));
                rn.setTime_study(rs.getInt(6));
                rn.setTime_begin(rs.getTimestamp(7));
                rn.setCreated_date(rs.getTimestamp(8));
                rn.setFinish_date(rs.getTimestamp(9));
                rn.setRequest_status(rs.getInt(10));
                rn.setSkill_name(getAllSkillByRequestID(rn.getRequest_id()));
                list1.add(rn);
            }

        } catch (Exception e) {

        }
        return list1;

    }

    public List<RequestName> listRequestByIDMente(String mentee_id, int index) {
        List<RequestName> list1 = new ArrayList<>();
        String sql = "SELECT * FROM swp391_group5.request where mentee_id = " + mentee_id + " order by request_id desc limit 6 offset ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestName rn = new RequestName();
                rn.setRequest_id(rs.getInt(1));
                rn.setMentor_id(rs.getInt(2));
                rn.setMentee_id(rs.getInt(3));
                rn.setTitle(rs.getString(4));
                rn.setRequest_content(rs.getString(5));
                rn.setTime_study(rs.getInt(6));
                rn.setTime_begin(rs.getTimestamp(7));
                rn.setCreated_date(rs.getTimestamp(8));
                rn.setFinish_date(rs.getTimestamp(9));
                rn.setRequest_status(rs.getInt(10));
                rn.setSkill_name(getAllSkillByRequestID(rn.getRequest_id()));
                list1.add(rn);
            }

        } catch (Exception e) {

        }
        return list1;

    }

    public RequestName getRequestByID(int id) {
        String sql = "select * from request where request_id = " + id + "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //ps.setInt(1, Integer.parseInt(mentee_id));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestName rn = new RequestName();
                rn.setRequest_id(rs.getInt(1));
                rn.setMentor_id(rs.getInt(2));
                rn.setMentee_id(rs.getInt(3));
                rn.setTitle(rs.getString(4));
                rn.setRequest_content(rs.getString(5));
                rn.setTime_study(rs.getInt(6));
                rn.setTime_begin(rs.getTimestamp(7));
                rn.setCreated_date(rs.getTimestamp(8));
                rn.setFinish_date(rs.getTimestamp(9));
                rn.setRequest_status(rs.getInt(10));
                rn.setSkill_name(getAllSkillByRequestID(rn.getRequest_id()));
                return rn;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public List<Skill> getAllSkillByRequestID(int request_id) {

        List<Skill> list1 = new ArrayList<>();
        String sql = "select b.* from request_skill a join skill b on a.skill_id=b.skill_id where request_id = " + request_id + "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //ps.setInt(1, Integer.parseInt(mentee_id));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list1.add(new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }

        } catch (Exception e) {

        }
        return list1;
    }

//    public List<Request> listRequestByID(String mentee_id) {
//        List<Request> list1 = new ArrayList<>();
//        String sql = "SELECT * FROM swp391_group5.request where mentee_id=?;";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, Integer.parseInt(mentee_id));
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list1.add(new Request(
//                        rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getInt(6),
//                        rs.getTimestamp(7),
//                        rs.getTimestamp(8),
//                        rs.getTimestamp(9),
//                        rs.getInt(10)
//                ));
//            }
//
//        } catch (Exception e) {
//
//        }
//        return list1;
//
//    }
//    public static void main(String[] args) {
//        requestDAO rq = new requestDAO();
////
////        // Gọi phương thức listRequestByMetorID để lấy danh sách các request
////        List<Request> requests = rq.listRequestByMetorID("2");
////
////        // In thông tin các request
////        for (Request request : requests) {
////            System.out.println("Name: " + request.getTitle());
////            System.out.println("Name: " + request.getRequest_id());
////            System.out.println("Mentor ID: " + request.getMentor_id());
////            // In thông tin các trường khác của request
////
////            // In thông tin skill_name
////            List<String> skillNames = request.getSkill_name();
////
////            System.out.println("Skill Names:");
////            if (skillNames.isEmpty()) {
////                System.out.println("No skills found.");
////            } else {
////                for (String skillName : skillNames) {
////                    System.out.println(skillName);
////                }
////            }
////
////            System.out.println("-----------------------------");
////        }
//        int a = 3;
//        int rs = rq.getNumberPage4(3);
//        System.out.println("NB:" + rs);
//        int b = 2;
//        String c = rq.getmailmentor(b);
//        System.out.println(c);
//
//    }

    //Lấy ra số lượng trang n /  trên tổng số trang. của trang list following request
    public int getNumberPage1(int mentor_id) {
        String query = "SELECT count(*) as Total FROM swp391_group5.request where mentor_id = ? and request_status in (1, 2);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentor_id);
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

    public int getNumberPage4(int mentee_id) {
        String query = "SELECT count(*) FROM swp391_group5.request where mentee_id = " + mentee_id + ";";
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
                countPage = total / 6;
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

    public boolean insert1(String tieude, Timestamp batdau1, int id_mentor, String sessionUser_id, Timestamp ketthuc1,
            String sogiohoc, String noidung, String framework, String[] skills) throws SQLException {

        // Lấy thời gian hiện tại
        LocalDateTime currentTime = LocalDateTime.now();
        // Cộng thêm 12 giờ
        LocalDateTime newTime = currentTime.plusHours(12);
        // Định dạng lại chuỗi thời gian
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        String currentFormatted = currentTime.format(formatter);
        String newFormatted = newTime.format(formatter);
        LocalDateTime currentDateTime = LocalDateTime.parse(currentFormatted, formatter);
        LocalDateTime newDateTime = LocalDateTime.parse(newFormatted, formatter);
        // In ra kết quả
        System.out.println("Thời gian hiện tại: " + currentDateTime);
        System.out.println("Thời gian sau khi cộng 12 giờ: " + newDateTime);
        // Chuyển đổi LocalDateTime thành Timestamp
        Timestamp timestamp = Timestamp.valueOf(newDateTime);
        //******************************************************
        int request_status = 1;
        int request_id = -1;
        try {

            connection.setAutoCommit(false);  // Vô hiệu hóa tự động xác nhận giao dịch

            //Câu lệnh Insert Information Request vao Table Request
            String sql = "INSERT INTO `swp391_group5`.`request` ( `mentor_id`, `mentee_id`,  "
                    + "`title`, `request_content`, `time_study`, `time_begin`, `created_date`, `finish_date`, `request_status`)"
                    + " VALUES ( ?, ?,  ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id_mentor);
            ps.setInt(2, Integer.parseInt(sessionUser_id));
            // ps.setInt(3,Integer.parseInt(skills));
            ps.setString(3, tieude);
            ps.setString(4, noidung);
            ps.setInt(5, Integer.parseInt(sogiohoc));
            ps.setTimestamp(6, timestamp);
            ps.setTimestamp(7, batdau1);
            ps.setTimestamp(8, ketthuc1);
            ps.setInt(9, request_status);
            ps.executeUpdate();

            // Lấy request_id từ bảng A
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                request_id = generatedKeys.getInt(1);
            }
            generatedKeys.close();
            ps.close();

            // Câu lệnh INSERT Skill vao Table request_skill
            String sql2 = "INSERT INTO `swp391_group5`.`request_skill`\n"
                    + "(`skill_id`,\n"
                    + "`request_id`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";
            PreparedStatement ps1 = connection.prepareStatement(sql2);

            for (String id : skills) {
                int value_id = Integer.parseInt(id);

                // Thiết lập các giá trị trong Prepared Statement
                ps1.setInt(1, value_id);
                ps1.setInt(2, request_id);

                // Thực hiện câu lệnh chèn vào cơ sở dữ liệu
                ps1.executeUpdate();
            }

            connection.commit();  // Áp dụng thay đổi vào cơ sở dữ liệu
            return true;
        } catch (Exception e) {
            connection.rollback();  // Hủy bỏ giao dịch nếu có lỗi
            return false;
        } finally {
            connection.setAutoCommit(true);  // Bật lại tự động xác nhận giao dịch
        }
    }

    public void update(int request_status, int request_id) {
        String sql = "UPDATE `swp391_group5`.`request` SET `request_status` = ? WHERE `request_id` = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, request_status);
            ps.setInt(2, request_id);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deletebyID(String request_id) {
        String sql = "DELETE FROM `swp391_group5`.`request` WHERE `request_id` = ? AND `request_status` = 1;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(request_id));

            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public String SelectNameMentor(int mentor_id) {
        String name = "";
        String sql = "SELECT user.username FROM swp391_group5.request join user "
                + "ON request.mentor_id = user.user_id where mentor_id=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setInt(1, mentor_id);
            if (rs.next()) {
                name = rs.getString("username");
            }
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return name;

    }

    public void deletebyIDForMente(String request_id) {
        String sql = "DELETE FROM swp391_group5.`request` WHERE request_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(request_id));

            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void DeleteRequestSkill(String request_id) {
        String sql = "delete from swp391_group5.request_skill where request_id = " + request_id + "";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void cancelRequest(String request_idCan) {
        String sql = "UPDATE `swp391_group5`.`request`\n"
                + "SET\n"
                + "`request_status` = 3\n"
                + "WHERE `request_id` = " + request_idCan + ";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void acceptOrRejectRequest(String request_idCan, int status) {
        String sql = "UPDATE `swp391_group5`.`request`\n"
                + "SET\n"
                + "`request_status` = ?\n"
                + "WHERE `request_id` = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setString(2, request_idCan);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public boolean checkTime(Timestamp finish) {
        String sql = "SELECT TIMESTAMPADD(SQL_TSI_DAY, 2, '" + finish.toString() + "');";
        Date current = new Date();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return current.after(rs.getTimestamp(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    //Tuan
    public String GetNameSkillByRequestID(int request_id) {
        List<Request> list1 = new ArrayList<>();
        String sql = "select b.skill_name from request_skill a join skill b on a.skill_id=b.skill_id where a.request_id= " + request_id + ";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {

        }
        return null;
    }

    public MentorRequestStats getStatisticByMentorId(int mentor_id) {

        String sql = "SELECT \n"
                + "  COUNT(CASE WHEN r.request_status IN (2, 4) THEN 1 END) AS num_accepted_requests,\n"
                + "  COUNT(CASE WHEN r.request_status IN (1,2,3, 4) THEN 1 END) AS num_total_requests,\n"
                + "  COUNT(CASE WHEN r.request_status = 3 THEN 1 END) AS num_canceled_requests,\n"
                + "  CONCAT(ROUND(COUNT(CASE WHEN r.request_status = 3 THEN 1 END) * 100 / COUNT(CASE WHEN r.request_status IN (1,2,3,4) THEN 1 END), 2), '%') AS cancel_percentage,\n"
                + "  CONCAT(ROUND(COUNT(CASE WHEN r.request_status = 4 THEN 1 END) * 100 / COUNT(CASE WHEN r.request_status IN (1,2,3,4) THEN 1 END), 2), '%') AS completed_percentage\n"
                + "FROM request r \n"
                + "LEFT JOIN feedback f ON r.mentee_id = f.user_id AND r.mentor_id = f.mentor_id \n"
                + "LEFT JOIN request_status rs ON r.request_status = rs.status_id \n"
                + "WHERE r.mentor_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int numAcceptedRequests = rs.getInt("num_accepted_requests");
                int numTotalRequests = rs.getInt("num_total_requests");
                int numCanceledRequests = rs.getInt("num_canceled_requests");
                String cancelPercentage = rs.getString("cancel_percentage");
                String completedPercentage = rs.getString("completed_percentage");
                MentorRequestStats mrs = new MentorRequestStats(numAcceptedRequests,
                        numTotalRequests, numCanceledRequests, cancelPercentage, completedPercentage);
                return mrs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public List<MentorRequest> getListRequestByMentorId(int mentor_id) {
        List<MentorRequest> list = new ArrayList<>();
        String sql = "SELECT ROW_NUMBER() OVER(ORDER BY r.created_date) AS STT,\n"
                + "u.full_name AS name_mentee, r.title,\n"
                + " r.request_content, r.created_date, r.finish_date, rs.status_name AS request_status\n"
                + "FROM request r\n"
                + "INNER JOIN user u ON r.mentee_id = u.user_id\n"
                + "INNER JOIN request_status rs ON r.request_status = rs.status_id\n"
                + "WHERE r.mentor_id = ?\n"
                + "ORDER BY r.created_date ASC;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int stt = rs.getInt("STT");
                String menteeName = rs.getString("name_mentee");
                String title = rs.getString("title");
                String requestContent = rs.getString("request_content");
                Date createdDate = rs.getDate("created_date");
                Date finishDate = rs.getDate("finish_date");
                String requestStatus = rs.getString("request_status");
                MentorRequest mr = new MentorRequest(stt,
                        menteeName, title, requestContent, createdDate, finishDate, requestStatus);
                list.add(mr);
            }
            return list;

        } catch (SQLException ex) {
        }
        return null;
    }

    public int getTopRateAVGStarByMentorId(int mentor_id) {
        int topRank = 0;
        String sql = "Select TOP from  (SELECT\n"
                + "ROW_NUMBER() OVER (ORDER BY AVG(f.rate_start) DESC) AS TOP,\n"
                + "u.user_id,\n"
                + "CONCAT(u.full_name) AS name_mentor,\n"
                + "ROUND(AVG(f.rate_start),1) AS Rate_start\n"
                + "FROM\n"
                + "user u\n"
                + "LEFT JOIN feedback f ON u.user_id = f.mentor_id\n"
                + "LEFT JOIN role r ON u.role = r.role_id\n"
                + "WHERE\n"
                + "r.role_id = 2\n"
                + "GROUP BY\n"
                + "u.user_id\n"
                + "ORDER BY\n"
                + "Rate_start DESC) as Toplist WHERE Toplist.user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                topRank = rs.getInt("TOP");
            }
        } catch (SQLException ex) {

        }
        return topRank;
    }

    public List<MentorRatingStats> getListTopRankStar() {
        List<MentorRatingStats> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "ROW_NUMBER() OVER (ORDER BY AVG(f.rate_start) DESC) AS TOP,\n"
                + "u.user_id,\n"
                + "CONCAT(u.full_name) AS name_mentor,\n"
                + "ROUND(AVG(f.rate_start),1) AS Rate_start\n"
                + "FROM\n"
                + "user u\n"
                + "LEFT JOIN feedback f ON u.user_id = f.mentor_id\n"
                + "LEFT JOIN role r ON u.role = r.role_id\n"
                + "WHERE\n"
                + "r.role_id = 2\n"
                + "GROUP BY\n"
                + "u.user_id\n"
                + "ORDER BY\n"
                + "Rate_start DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int rank = rs.getInt("TOP");
                int userId = rs.getInt("user_id");
                String fullName = rs.getString("name_mentor");
                double averageRating = rs.getDouble("Rate_start");
                MentorRatingStats mrs = new MentorRatingStats(rank, userId, fullName, averageRating);
                list.add(mrs);
            }
            return list;

        } catch (SQLException ex) {
        }
        return null;
    }

    public Request listbyRequest_ID(int request_id) {

        String sql = "SELECT * FROM swp391_group5.request where request_id=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, request_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Request(
                        rs.getInt("request_id"),
                        rs.getString("title"),
                        rs.getString("request_content"),
                        rs.getInt("time_study"),
                        rs.getTimestamp("time_begin"),
                        rs.getTimestamp("created_date"),
                        rs.getTimestamp("finish_date")
                );
            }

        } catch (Exception e) {

        }
        return null;

    }

    public List<skill_Request> listRequest_SkillByID(int request_id) {
        List<skill_Request> list = new ArrayList<>();
        String sql = "SELECT request_skill.request_id,request_skill.skill_id,skill.skill_name "
                + "FROM swp391_group5.request_skill JOIN skill ON request_skill.skill_id = skill.skill_id "
                + "where request_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, request_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new skill_Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3)
                ));

            }

        } catch (Exception e) {
            System.out.println("listRequest_SkillByID : " + e.getMessage());
        }
        return list;

    }

    public boolean update_request(int request_id, String tieude, Timestamp batdau1, Timestamp ketthuc1, String sogiohoc, String noidung, String[] skills)
            throws SQLException {
        // Lấy thời gian hiện tại
        LocalDateTime currentTime = LocalDateTime.now();
        // Cộng thêm 12 giờ
        LocalDateTime newTime = currentTime.plusHours(12);
        // Định dạng lại chuỗi thời gian
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
        String currentFormatted = currentTime.format(formatter);
        String newFormatted = newTime.format(formatter);
        LocalDateTime currentDateTime = LocalDateTime.parse(currentFormatted, formatter);
        LocalDateTime newDateTime = LocalDateTime.parse(newFormatted, formatter);
        // In ra kết quả
        System.out.println("Thời gian hiện tại: " + currentDateTime);
        System.out.println("Thời gian sau khi cộng 12 giờ: " + newDateTime);
        // Chuyển đổi LocalDateTime thành Timestamp
        Timestamp timestamp = Timestamp.valueOf(newDateTime);
        //******************************************************
        try {
            String sql = "UPDATE `swp391_group5`.`request` SET `title` = ?, `request_content` = ?, `time_study` = ?, "
                    + "`time_begin` = ?, `created_date` = ?, `finish_date` = ? WHERE (`request_id` = ?);";
            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, tieude);
            ps.setString(2, noidung);
            ps.setInt(3, Integer.parseInt(sogiohoc));
            ps.setTimestamp(4, timestamp);
            ps.setTimestamp(5, batdau1);
            ps.setTimestamp(6, ketthuc1);
            ps.setInt(7, request_id);
            ps.executeUpdate();

            String sql2 = "DELETE FROM `swp391_group5`.`request_skill`\n"
                    + "WHERE request_id = ? ;";
            PreparedStatement ps1 = connection.prepareStatement(sql2);
            ps1.setInt(1, request_id);
            ps1.executeUpdate();

            String sql3 = "INSERT INTO `swp391_group5`.`request_skill`\n"
                    + "(`skill_id`,\n"
                    + "`request_id`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?);";

            PreparedStatement ps2 = connection.prepareStatement(sql3);

            for (String id : skills) {
                int value_id = Integer.parseInt(id);

                // Thiết lập các giá trị trong Prepared Statement
                ps2.setInt(1, value_id);
                ps2.setInt(2, request_id);

                // Thực hiện câu lệnh chèn vào cơ sở dữ liệu
                ps2.executeUpdate();

            }

            connection.commit();  // Áp dụng thay đổi vào cơ sở dữ liệu
            return true;
        } catch (Exception e) {
            connection.rollback();  // Hủy bỏ giao dịch nếu có lỗi
            return false;
        } finally {
            connection.setAutoCommit(true);  // Bật lại tự động xác nhận giao dịch
        }

    }

    public int getNumberOfRequest(int mentor_id) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(request_id) AS count FROM swp391_group5.request WHERE mentor_id = ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, mentor_id); // Thay mentorId bằng giá trị cụ thể của mentor_id mà bạn quan tâm
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt("count");
                // Xử lý số lượng count tương ứng với mentor_id
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;

    }

    /**
     * tính tổng của số giờ học
     *
     * @param sessionUser_id
     * @return sum
     */
    public int sumTime_Study(String sessionUser_id) {
        int sum = 0;
        try {
            String sql = "SELECT SUM(time_study) As sum FROM swp391_group5.request where mentee_id=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(sessionUser_id)); // Thay mentorId bằng giá trị cụ thể của mentor_id mà bạn quan tâm
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                sum = resultSet.getInt("sum");
                // Xử lý số lượng count tương ứng với mentor_id
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sum;
    }

    /**
     * đếm số mentor mà mentee đã gửi yêu cầu
     *
     * @param sessionUser_id
     * @return count_Mentor
     */
    public int count_Mentor(String sessionUser_id) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(DISTINCT mentor_id) As count FROM swp391_group5.request where mentee_id=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(sessionUser_id)); // Thay mentorId bằng giá trị cụ thể của mentor_id mà bạn quan tâm
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                count = resultSet.getInt("count");
                // Xử lý số lượng count tương ứng với mentor_id
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

//    public String getmailmentor(int id_temp) {
//        String email = "";
//        String sql = "select email from swp391_group5.user where user_id= ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            
//            st.setInt(1, id_temp);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//               email = rs.getString("email");
//            }
//           ps.executeQuery();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return email; 
//    }
    public String getmailmentor(int id_temp) {

        String sql = "select email from swp391_group5.user where user_id= " + id_temp + ";";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {

        }
        return null;
    }

    public String getEmailToSend(String requestId_yes) {
        String sql = "select user.email from  swp391_group5.user join swp391_group5.request on user.user_id = mentee_id where request_id = " + requestId_yes + " ;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {

        }
        return null;
    }

}
