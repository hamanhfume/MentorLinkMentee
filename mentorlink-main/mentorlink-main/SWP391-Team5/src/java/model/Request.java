/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.*;
/**
 *
 * @author admin
 */
public class Request {
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
    private ArrayList<String> skill_name;
    
    public Request() {
        
    }

    public Request(int request_id, String title, String request_content, int time_study, Timestamp time_begin, Timestamp created_date, Timestamp finish_date) {
        this.request_id = request_id;
        this.title = title;
        this.request_content = request_content;
        this.time_study = time_study;
        this.time_begin = time_begin;
        this.created_date = created_date;
        this.finish_date = finish_date;
    }
    
    public Request(int request_id, int mentor_id, int mentee_id,  String title, String request_content, int time_study, Timestamp time_begin, 
            Timestamp created_date, Timestamp finish_date, int request_status) {
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

    
    public Request(int request_id, int mentor_id, int mentee_id,  String title, String request_content, int time_study, Timestamp time_begin, 
            Timestamp created_date, Timestamp finish_date, int request_status, ArrayList<String> skill_name) {
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
        this.skill_name = skill_name;
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
    
//    public String getSkill_name() {
//        return Skill_name;
//    }
//
//    public void setSkill_name(String Skill_name) {
//        this.Skill_name = Skill_name;
//    }

    public Request(ArrayList<String> skill_name) {
        this.skill_name = skill_name;
    }

    public ArrayList<String> getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(ArrayList<String> skill_name) {
        this.skill_name = skill_name;
    }
      
    
    @Override
    public String toString() {
        return "Request{" + "request_id=" + request_id + ", mentor_id=" + mentor_id + ", mentee_id=" + mentee_id + ", title=" + title + ", request_content=" + request_content + ", time_study=" + time_study + ", time_begin=" + time_begin + ", created_date=" + created_date + ", finish_date=" + finish_date + ", request_status=" + request_status + '}';
    }

    
    
}
