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
public class Feedback {

    private int user_id;
    private int mentor_id;
    private int rate_start;
    private String feedback_comment;
    private Date create_date;
    private int fb_status;
    private User infor;

    public Feedback(int user_id, int mentor_id, int rate_start, String feedback_comment, Date create_date, int fb_status) {
        this.user_id = user_id;
        this.mentor_id = mentor_id;
        this.rate_start = rate_start;
        this.feedback_comment = feedback_comment;
        this.create_date = create_date;
        this.fb_status = fb_status;
    }

    public Feedback(int user_id, int mentor_id, int rate_start, String feedback_comment, Date create_date, int fb_status, User infor) {
        this.user_id = user_id;
        this.mentor_id = mentor_id;
        this.rate_start = rate_start;
        this.feedback_comment = feedback_comment;
        this.create_date = create_date;
        this.fb_status = fb_status;
        this.infor = infor;
    }
    
    

    public User getInfor() {
        return infor;
    }

    public void setInfor(User infor) {
        this.infor = infor;
    }

    
    
    
    public Feedback() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public int getRate_start() {
        return rate_start;
    }

    public void setRate_start(int rate_start) {
        this.rate_start = rate_start;
    }

    public String getFeedback_comment() {
        return feedback_comment;
    }

    public void setFeedback_comment(String feedback_comment) {
        this.feedback_comment = feedback_comment;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getFb_status() {
        return fb_status;
    }

    public void setFb_status(int fb_status) {
        this.fb_status = fb_status;
    }
    

}
