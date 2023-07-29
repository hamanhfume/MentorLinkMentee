/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Skill {
    private int skill_id;
    private String skill_name;
    private String skill_img;
    private int skill_status;
    

    public Skill() {
    }

    public Skill(String skill_name) {
        this.skill_name = skill_name;
    }    

    public Skill(int skill_id, String skill_name, String skill_img, int skill_status) {
        this.skill_id = skill_id;
        this.skill_name = skill_name;
        this.skill_img = skill_img;
        this.skill_status = skill_status;
    }
        public Skill(int mentor_id, int skill_id, String skill_name, int skill_status) {
        
        this.skill_id = skill_id;
        this.skill_name = skill_name;
        this.skill_status = skill_status;
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

    public String getSkill_img() {
        return skill_img;
    }

    public void setSkill_img(String skill_img) {
        this.skill_img = skill_img;
    }

    public int getSkill_status() {
        return skill_status;
    }

    public void setSkill_status(int skill_status) {
        this.skill_status = skill_status;
    }

    @Override
    public String toString() {
        return "Skill{" + "skill_id=" + skill_id + ", skill_name=" + skill_name + ", skill_img=" + skill_img + ", skill_status=" + skill_status + '}';
    }

    
}
