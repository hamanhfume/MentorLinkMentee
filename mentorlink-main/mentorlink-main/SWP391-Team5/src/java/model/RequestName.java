/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author damtu
 */
public class RequestName {
    private int request_id;
    private int mentor_id;
    private int mentee_id;
    private String title;
    private String request_content;
    private int time_study;
    private Timestamp time_begin;
    private Timestamp created_date;
    private Timestamp finish_date;
    private int request_status;
    private List<Skill> Skill_name;

    public RequestName() {
    }

    public RequestName(int request_id, int mentor_id, int mentee_id, String title, String request_content, int time_study, Timestamp time_begin, Timestamp created_date, Timestamp finish_date, int request_status) {
        this.request_id = request_id;
        this.mentor_id = mentor_id;
        this.mentee_id = mentee_id;
        this.title = title;
        this.request_content = request_content;
        this.time_study = time_study;
        this.time_begin = time_begin;
        this.created_date = created_date;
        this.finish_date = finish_date;
        this.request_status = request_status;
    }
    
    
    
    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public int getMentee_id() {
        return mentee_id;
    }

    public void setMentee_id(int mentee_id) {
        this.mentee_id = mentee_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequest_content() {
        return request_content;
    }

    public void setRequest_content(String request_content) {
        this.request_content = request_content;
    }

    public int getTime_study() {
        return time_study;
    }

    public void setTime_study(int time_study) {
        this.time_study = time_study;
    }

    public Timestamp getTime_begin() {
        return time_begin;
    }

    public void setTime_begin(Timestamp time_begin) {
        this.time_begin = time_begin;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public Timestamp getFinish_date() {
        return finish_date;
    }

    public void setFinish_date(Timestamp finish_date) {
        this.finish_date = finish_date;
    }

    public int getRequest_status() {
        return request_status;
    }

    public void setRequest_status(int request_status) {
        this.request_status = request_status;
    }

    public List<Skill> getSkill_name() {
        return Skill_name;
    }

    public void setSkill_name(List<Skill> Skill_name) {
        this.Skill_name = Skill_name;
    }
    
}
