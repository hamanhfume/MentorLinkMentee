/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class MentorRequestStats {
   private int numAcceptedRequests;
   private int numTotalRequests;
   private int numCanceledRequests;
   private String cancelPercentage;
   private String completedPercentage;

    public MentorRequestStats() {
    }

   
  public MentorRequestStats(int numAcceptedRequests, int numTotalRequests, int numCanceledRequests, String cancelPercentage, String completedPercentage) {
    this.numAcceptedRequests = numAcceptedRequests;
    this.numTotalRequests = numTotalRequests;
    this.numCanceledRequests = numCanceledRequests;
    this.cancelPercentage = cancelPercentage;
    this.completedPercentage = completedPercentage;
  }

    public int getNumAcceptedRequests() {
        return numAcceptedRequests;
    }

    public void setNumAcceptedRequests(int numAcceptedRequests) {
        this.numAcceptedRequests = numAcceptedRequests;
    }

    public int getNumTotalRequests() {
        return numTotalRequests;
    }

    public void setNumTotalRequests(int numTotalRequests) {
        this.numTotalRequests = numTotalRequests;
    }

    public int getNumCanceledRequests() {
        return numCanceledRequests;
    }

    public void setNumCanceledRequests(int numCanceledRequests) {
        this.numCanceledRequests = numCanceledRequests;
    }

    public String getCancelPercentage() {
        return cancelPercentage;
    }

    public void setCancelPercentage(String cancelPercentage) {
        this.cancelPercentage = cancelPercentage;
    }

    public String getCompletedPercentage() {
        return completedPercentage;
    }

    public void setCompletedPercentage(String completedPercentage) {
        this.completedPercentage = completedPercentage;
    }
  
}
