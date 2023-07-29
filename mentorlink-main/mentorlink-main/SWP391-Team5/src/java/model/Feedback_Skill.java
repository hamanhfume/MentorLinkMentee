/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tuan Vinh
 */
public class Feedback_Skill {
    private int skill_id;  
    private float star_rate_skill;
    private Skill skill;

    public Feedback_Skill() {
    }

    public Feedback_Skill(int skill_id) {
        this.skill_id = skill_id;
    }

    
    
    public Feedback_Skill(float star_rate_skill, Skill skill) {
        this.star_rate_skill = star_rate_skill;
        this.skill = skill;
    }
    
    
    
    public Feedback_Skill(int skill_id, float star_rate_skill,  Skill skill) {
        this.skill_id = skill_id;
        this.skill = skill;
        this.star_rate_skill = star_rate_skill;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public float getStar_rate_skill() {
        return star_rate_skill;
    }

    public void setStar_rate_skill(float star_rate_skill) {
        this.star_rate_skill = star_rate_skill;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    
    
    
}
