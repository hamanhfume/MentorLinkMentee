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
public class CV_Mentor {
    private int mentor_id;
    private String profession;
    private String profession_introduction;
    private String service_description;
    private String achievements;
    private String achievements_des;
    private String language;
    private int skill_id;
    private Date created_date;
    private User infor;
    private int numberRequest;
    private float rating;

    public User getInfor() {
        return infor;
    }

    public int getNumberRequest() {
        return numberRequest;
    }

    public void setNumberRequest(int numberRequest) {
        this.numberRequest = numberRequest;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public void setInfor(User infor) {
        this.infor = infor;
    }

    public CV_Mentor() {
    }
    
    public CV_Mentor(int mentor_id, String profession, String profession_introduction, String service_description, String achievements,int numberRequestSuccess ,User infor) {
        this.mentor_id = mentor_id;
        this.profession = profession;
        this.profession_introduction = profession_introduction;
        this.service_description = service_description;
        this.achievements = achievements;
        this.numberRequest = numberRequestSuccess;
        this.infor = infor;
    }

    public CV_Mentor(int mentor_id, String profession, String profession_introduction, String service_description,String achievements,User infor) {
        this.mentor_id = mentor_id;
        this.profession = profession;
        this.profession_introduction = profession_introduction;
        this.service_description = service_description;
        this.achievements = achievements;
        this.infor = infor;
    }

    public CV_Mentor(int mentor_id, String profession, String profession_introduction, String service_description, String achievements, String achievements_des, String language, User infor) {
        this.mentor_id = mentor_id;
        this.profession = profession;
        this.profession_introduction = profession_introduction;
        this.service_description = service_description;
        this.achievements = achievements;
        this.achievements_des = achievements_des;
        this.language = language;
        this.infor = infor;
    }

    public CV_Mentor(int mentor_id, String profession, User infor) {
        this.mentor_id = mentor_id;
        this.profession = profession;
        this.infor = infor;
    }
    
    public CV_Mentor(int mentor_id, String profession, String profession_introduction, String service_description, String achievements, String language, int skill_id, Date created_date) {
        this.mentor_id = mentor_id;
        this.profession = profession;
        this.profession_introduction = profession_introduction;
        this.service_description = service_description;
        this.achievements = achievements;
        this.language = language;
        this.skill_id = skill_id;
        this.created_date = created_date;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getProfession_introduction() {
        return profession_introduction;
    }

    public void setProfession_introduction(String profession_introduction) {
        this.profession_introduction = profession_introduction;
    }

    public String getService_description() {
        return service_description;
    }

    public void setService_description(String service_description) {
        this.service_description = service_description;
    }

    public String getAchievements() {
        return achievements;
    }

    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getAchievements_des() {
        return achievements_des;
    }

    public void setAchievements_des(String achievements_des) {
        this.achievements_des = achievements_des;
    }
    
    
    
}
