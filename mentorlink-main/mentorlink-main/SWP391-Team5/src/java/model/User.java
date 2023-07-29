/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.*;

/**
 *
 * @author admin
 */
public class User {

    private String user_id;
    private String username;
    private String password;
    private int gender;
    private String avatar;
    private String full_name;
    private Date date_of_birth;
    private String email;
    private String address;
    private String phone;
    private int role;
    private int user_status;
    private Date create_date;
    private int cv_status;

    public User() {
    }

    public User(String email) {
        this.email = email;
    }
    
    
    public User(String user_id, String avatar, String full_name, String email) {
        this.user_id = user_id;
        this.avatar = avatar;
        this.full_name = full_name;
        this.email = email;
    }

    public User(String user_id, String username, String password, int gender, String avatar, String full_name, Date date_of_birth, String email, String address, String phone, int role, int user_status, Date create_date, int cv_status) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.avatar = avatar;
        this.full_name = full_name;
        this.date_of_birth = date_of_birth;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.role = role;
        this.user_status = user_status;
        this.create_date = create_date;
        this.cv_status = cv_status;
    }
    
    public User(String username, int gender, String full_name, Date date_of_birth, String email, String address) {
        this.username = username;
        this.gender = gender;
        this.full_name = full_name;
        this.date_of_birth = date_of_birth;
        this.email = email;
        this.address = address;
    }

    
    public User(String avatar, String full_name, String email, String username, String phone) {
        this.avatar = avatar;
        this.full_name = full_name;
        this.email = email;
        this.username = username;
        this.phone = phone;
    }
    
    
    
    public User(String username,int gender, String avatar, String full_name, Date date_of_birth, String email, String address, String phone) {
        this.username = username;
        this.gender = gender;
        this.avatar = avatar;
        this.full_name = full_name;
        this.date_of_birth = date_of_birth;
        this.email = email;
        this.address = address;
        this.phone = phone;
    }

    public User(String username,String email) {
        this.email = email;
          this.username = username;
    }

    public User(String avatar, String full_name, String email) {
        this.avatar = avatar;
        this.full_name = full_name;
        this.email = email;
    }
    

    
    
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getUser_status() {
        return user_status;
    }

    public void setUser_status(int user_status) {
        this.user_status = user_status;
    }


    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getCv_status() {
        return cv_status;
    }

    public void setCv_status(int cv_status) {
        this.cv_status = cv_status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", username=" + username + ", password=" + password + ", gender=" + gender + ", avatar=" + avatar + ", full_name=" + full_name + ", date_of_birth=" + date_of_birth + ", email=" + email + ", address=" + address + ", phone=" + phone + ", role=" + role + ", user_status=" + user_status + ", create_date=" + create_date + ", cv_status=" + cv_status + '}';
    }

}
