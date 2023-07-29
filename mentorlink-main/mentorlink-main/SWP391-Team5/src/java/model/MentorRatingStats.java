/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class MentorRatingStats {
    private int rank;
    private int userId;
    private String fullName;
    private double averageRating;

    public MentorRatingStats() {
    }

    public MentorRatingStats(int rank, int userId, String fullName , double averageRating) {
        this.rank = rank;
        this.userId = userId;
        this.fullName = fullName;
        this.averageRating = averageRating;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }
    
    
}
