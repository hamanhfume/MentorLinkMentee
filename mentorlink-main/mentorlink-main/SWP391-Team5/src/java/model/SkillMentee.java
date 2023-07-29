
package model;

/**
 *
 * @author 84911
 */
public class SkillMentee {
    // skill_name, skill_status, skill_img, mentee_id
    private int menteeId;
    private String skillName;
    private byte skillStatus;
    private String skillImage;

    public SkillMentee() {
    }

    public SkillMentee(int menteeId, String skillName, byte skillStatus, String skillImage) {
        this.menteeId = menteeId;
        this.skillName = skillName;
        this.skillStatus = skillStatus;
        this.skillImage = skillImage;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public void setSkillStatus(byte skillStatus) {
        this.skillStatus = skillStatus;
    }

    public void setSkillImage(String skillImage) {
        this.skillImage = skillImage;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public String getSkillName() {
        return skillName;
    }

    public byte getSkillStatus() {
        return skillStatus;
    }

    public String getSkillImage() {
        return skillImage;
    }
    
    
}
