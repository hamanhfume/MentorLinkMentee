/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author damtu
 */
public class skill_Request {
   
       
       private int request_id;
       private int skill_id;
       private String skill_name;

    @Override
    public String toString() {
        return "skill_Request{" + "request_id=" + request_id + ", skill_id=" + skill_id + ", skill_name=" + skill_name + '}';
    }

    public skill_Request() {
    }

    public skill_Request(int request_id, int skill_id, String skill_name) {
        this.request_id = request_id;
        this.skill_id = skill_id;
        this.skill_name = skill_name;
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(String skill_name) {
        this.skill_name = skill_name;
    }

   

  
     
}
