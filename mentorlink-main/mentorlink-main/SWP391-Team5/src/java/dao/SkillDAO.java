/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Skill;

public class SkillDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //Lay ra doi tuong cua skill theo id
    public Skill getSkillById(String id) {
        String query = "select * from swp391_group5.skill where skill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Skill(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    /**
     *
     * @return
     */
    public List<Skill> getAllSkillByStatus() {

        List<Skill> list = new ArrayList<>();
        String query = "SELECT * FROM swp391_group5.skill where skill_status = 1;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //Lay het doi tuong skill
    public List<Skill> getAllSkill() {
        List<Skill> list = new ArrayList<>();
        String query = "SELECT * FROM swp391_group5.skill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4))
                );
            }
        } catch (Exception e) {

        }
        return list;
    }

    //Xoa theo id
    public void deleteSkill(String kid) {
        String query = "delete from swp391_group5.skill where skill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, kid);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void insertSkill(String nameS, String imgS, int statusS) {
        String query = "INSERT INTO swp391_group5.skill (`skill_name`, `skill_img`, `skill_status`) VALUES (?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, nameS);
            ps.setInt(3, statusS);
            ps.setString(2, imgS);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    //update
    public void updateSkill(String id, String nameS, int statusS, String imgS) {
        String query = "UPDATE swp391_group5.skill SET skill_name = ?, skill_img = ?, skill_status = ? WHERE skill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, nameS);
            ps.setString(2, imgS);
            ps.setInt(3, statusS);
            ps.setString(4, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateStatus(int id, int s) {

        String query = "UPDATE swp391_group5.skill SET  skill_status = ? WHERE skill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, s);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    /**
     *
     * @return
     */
    public List<Skill> getTop3Skill() {

        List<Skill> list = new ArrayList<>();
        String query = "SELECT * FROM swp391_group5.skill where skill_status = 1 limit 3;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    /**
     * Lấy ra tất cả các skill mà hệ thống có
     *
     * @return list
     */
    public ArrayList<Skill> getAllSkillInfo() {
        ArrayList<Skill> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM swp391_group5.skill";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt("skill_id"), rs.getString("skill_name"), rs.getString("skill_img"), rs.getInt("skill_status")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getSkillByMentor_id(int mentor_id) {
        List<String> listSkill = new ArrayList<>();
        String sql = "select s.skill_name from cv_of_mentor as cv join cv_skill as sk \n"
                + "	on cv.mentor_id = sk.mentor_id\n"
                + "    join skill as s on s.skill_id = sk.skill_id  \n"
                + "    where cv.mentor_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, mentor_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                listSkill.add(rs.getString("skill_name"));
            }
        } catch (Exception e) {
        }
        return listSkill;
    }

//    public static void main(String[] args) {
//        SkillDAO dao = new SkillDAO();
//        List<String> list = dao.getSkillByMentor_id(2);
//        for (String sk : list) {
//            System.out.println(sk);
//        }
//    }
}
