/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;


public class MentorInfo {
    private int stt;
    private int id;
    private String fullName;
    private String accountName;
    private String occupation;
    private int numberOfCurrently;
    private String percentageCompleted;
    private double averageStarRating;
    private int activeStatusOfAdvisor;

    // Constructor
    public MentorInfo(int stt, int id, String fullName, String accountName, String occupation, int numberOfCurrently, String percentageCompleted, double averageStarRating, int activeStatusOfAdvisor) {
        this.stt = stt;
        this.id = id;
        this.fullName = fullName;
        this.accountName = accountName;
        this.occupation = occupation;
        this.numberOfCurrently = numberOfCurrently;
        this.percentageCompleted = percentageCompleted;
        this.averageStarRating = averageStarRating;
        this.activeStatusOfAdvisor = activeStatusOfAdvisor;
    }

    // Getters and setters
    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public int getNumberOfCurrently() {
        return numberOfCurrently;
    }

    public void setNumberOfCurrently(int numberOfCurrently) {
        this.numberOfCurrently = numberOfCurrently;
    }

    public String getPercentageCompleted() {
        return percentageCompleted;
    }

    public void setPercentageCompleted(String percentageCompleted) {
        this.percentageCompleted = percentageCompleted;
    }

    public double getAverageStarRating() {
        return averageStarRating;
    }

    public void setAverageStarRating(double averageStarRating) {
        this.averageStarRating = averageStarRating;
    }

    public int getActiveStatusOfAdvisor() {
        return activeStatusOfAdvisor;
    }

    public void setActiveStatusOfAdvisor(int activeStatusOfAdvisor) {
        this.activeStatusOfAdvisor = activeStatusOfAdvisor;
    }

    @Override
    public String toString() {
        return "MentorInfo{" + "stt=" + stt + ", id=" + id + ", fullName=" + fullName + ", accountName=" + accountName + ", occupation=" + occupation + ", numberOfCurrently=" + numberOfCurrently + ", percentageCompleted=" + percentageCompleted + ", averageStarRating=" + averageStarRating + ", activeStatusOfAdvisor=" + activeStatusOfAdvisor + '}';
    }
    
    
    
}
