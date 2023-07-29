/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import controller.author.securityProcessorCore;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {

    public void changepass(int id, String password) {

        try {
            String sql = "UPDATE `swp391_group5`.`user` SET `password` = ? WHERE (`user_id` = ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getUserIDByUserAndPass(String user, String pass) {
        String sql = "SELECT * FROM swp391_group5.user where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("user_id");

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     * Lấy thông tin của một người dùng từ cơ sở dữ liệu dựa trên user_id.
     *
     * @param id
     * @return Đối tượng User chứa thông tin của người dùng hoặc null nếu không
     * tìm thấy
     */
    public User getUserById(int id) {
        String sql = "SELECT username, gender, avatar, full_name, date_of_birth, email, address, phone FROM swp391_group5.user where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString("username"), rs.getInt("gender"), rs.getString("avatar"), rs.getString("full_name"), rs.getDate("date_of_birth"),
                        rs.getString("email"), rs.getString("address"), rs.getString("phone"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Update thông tin của một người dùng vào cơ sở dữ liệu dựa trên user_id.
     *
     * @param username
     * @param gender
     * @param full_name
     * @param date_of_birth
     * @param email
     * @param address
     * @param phone
     * @param user_id
     * @return Đối tượng User chứa thông tin của người dùng hoặc null.
     */
    public boolean UpdateUser(String username, int gender, String full_name, String date_of_birth, String email, String address, String phone, int user_id) {
        String sql = " UPDATE User SET \n"
                + "    username = ?,\n"
                + "    gender = ?,\n"
                + "    full_name = ?,\n"
                + "    date_of_birth = ?,\n"
                + "    email = ?,\n"
                + "    address = ?,\n"
                + "    phone = ?\n"
                + "    WHERE user_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, gender);
            ps.setString(3, full_name);
            ps.setDate(4, java.sql.Date.valueOf(date_of_birth));
            ps.setString(5, email);
            ps.setString(6, address);
            ps.setString(7, phone);
            ps.setInt(8, user_id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean UpdateUser2(int gender, String full_name, String date_of_birth, String email, String address, int user_id) {
        String sql = " UPDATE User SET \n"
                + "    gender = ?,\n"
                + "    full_name = ?,\n"
                + "    date_of_birth = ?,\n"
                + "    email = ?,\n"
                + "    address = ?\n"
                + "    WHERE user_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, gender);
            ps.setString(2, full_name);
            ps.setDate(3, java.sql.Date.valueOf(date_of_birth));
            ps.setString(4, email);
            ps.setString(5, address);
            ps.setInt(6, user_id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Update thông tin đường dẫn ảnh vào database
     *
     * @param avatar
     * @param user_id
     */
    public void UpdateUserAvatar(String avatar, int user_id) {
        String sql = " UPDATE User SET \n"
                + "    avatar = ?\n"
                + "WHERE user_id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, avatar);
            ps.setInt(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User Login(String user, String pass) throws SQLException {
        String query = "select * from user"
                + " where username = ?"
                + "and password = ?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getDate(13),
                        rs.getInt(14));
            }
        } catch (Exception e) {

        }
        return null;
    }

    /**
     *
     * @param username
     * @return
     */
    public User checkUserExisted(String username) {
        String sql = "SELECT * FROM swp391_group5.user where username = ? and user_status = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new User(rs.getString("avatar"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("phone"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//    public static void main(String[] args) {
//        UserDAO dt = new UserDAO();
//        User a = dt.checkUserExisted("mentor1");
//        System.out.println(a.getUsername());
//    }

    /**
     *
     * @param username
     * @param newpassword
     */
    public void updatePassword(String username, String newpassword) {
        String sql = "UPDATE user \n"
                + "SET `password` = ? \n"
                + "WHERE `username` = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newpassword);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getAccByUName(String username) {
        User acc = null;
        String sql = "SELECT * FROM swp391_group5.user where username   =?  ;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc = new User(
                        rs.getString("username"), rs.getString("email")
                );

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return acc;
    }

    public User getAccByEmail(String email) {
        User acc = null;
        String sql = "SELECT * FROM swp391_group5.user where email  = ?   ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc = new User(
                        rs.getString("username"), rs.getString("email")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return acc;
    }

    public void insert(String username, String password, String email, String role, String name, String date, String address, String gender, String phone) {
        String sql = "INSERT INTO `swp391_group5`.`user` (`username`, `password`, `gender`, `avatar`, `full_name`, `date_of_birth`, `email`, `address`, `phone`, `role`, `user_status`)\n"
                + " VALUES (?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?);";
        // chuye sang date
        Date birthdate = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthdate = dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        java.sql.Date sqlBirthdate = new java.sql.Date(birthdate.getTime());
        //:
        String avatar = "avatar.jpg";
        int user_status = 1;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setBoolean(3, Boolean.parseBoolean(gender));
            ps.setString(4, avatar);
            ps.setString(5, name);
            ps.setDate(6, sqlBirthdate);
            ps.setString(7, email);
            ps.setString(8, address);
            ps.setString(9, phone);
            ps.setInt(10, Integer.parseInt(role));
            ps.setInt(11, user_status);
            ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
