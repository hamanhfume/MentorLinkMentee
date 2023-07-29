package model;

public class Mentee {
    //mentee_id, name, account, avatar,gender, status, sum of hours, 
    // sum of skills: get from skill model 
    // sum of mentee: calculate mentee

    //attribute
    private int mentee_id;
    private String mentee_name;
    private String mentee_account;
    private String mentee_avatar_img;
    private byte mentee_gender;
    private byte mentee_status;
    private int mentee_hours;
    private String[] mentee_skill;
    private int time_study;
    private int total_skill;
    
    public Mentee() {
    }

    public Mentee(int mentee_id, String mentee_name, String mentee_account, int time_study, int total_skill) {
        this.mentee_id = mentee_id;
        this.mentee_name = mentee_name;
        this.mentee_account = mentee_account;
        this.time_study = time_study;
        this.total_skill = total_skill;
    }

          
    public Mentee(int mentee_id, String mentee_name, String mentee_account, String mentee_avatar_img, byte mentee_gender, byte mentee_status, int mentee_hours) {
        this.mentee_id = mentee_id;
        this.mentee_name = mentee_name;
        this.mentee_account = mentee_account;
        this.mentee_avatar_img = mentee_avatar_img;
        this.mentee_gender = mentee_gender;
        this.mentee_status = mentee_status;
        this.mentee_hours = mentee_hours;
    }

    //setter
    public void setMentee_id(int mentee_id) {
        this.mentee_id = mentee_id;
    }

    public void setMentee_name(String mentee_name) {
        this.mentee_name = mentee_name;
    }

    public void setMentee_account(String mentee_account) {
        this.mentee_account = mentee_account;
    }

    public void setMentee_avatar_img(String mentee_avatar_img) {
        this.mentee_avatar_img = mentee_avatar_img;
    }

    public void setMentee_gender(byte mentee_gender) {
        this.mentee_gender = mentee_gender;
    }

    public void setMentee_status(byte mentee_status) {
        this.mentee_status = mentee_status;
    }

    public void setMentee_hours(int mentee_hours) {
        this.mentee_hours = mentee_hours;
    }
    
    //getter
    public int getMentee_id() {
        return mentee_id;
    }

    public String getMentee_name() {
        return mentee_name;
    }

    public String getMentee_account() {
        return mentee_account;
    }

    public String getMentee_avatar_img() {
        return mentee_avatar_img;
    }

    public byte getMentee_gender() {
        return mentee_gender;
    }

    public byte getMentee_status() {
        return mentee_status;
    }

    public int getMentee_hours() {
        return mentee_hours;
    }

    public String[] getMentee_skill() {
        return mentee_skill;
    }

    public void setMentee_skill(String[] mentee_skill) {
        this.mentee_skill = mentee_skill;
    }

    public int getTime_study() {
        return time_study;
    }

    public void setTime_study(int time_study) {
        this.time_study = time_study;
    }

    public int getTotal_skill() {
        return total_skill;
    }

    public void setTotal_skill(int total_skill) {
        this.total_skill = total_skill;
    }
    
    
}
