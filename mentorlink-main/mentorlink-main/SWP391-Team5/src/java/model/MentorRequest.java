/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class MentorRequest {
    private int stt;
    private String menteeName;
    private String title;
    private String requestContent;
    private Date createdDate;
    private Date finishDate;
    private String requestStatus;

    public MentorRequest() {
    }

    public MentorRequest(int stt, String menteeName, String title, String requestContent, Date createdDate, Date finishDate, String requestStatus) {
        this.stt = stt;
        this.menteeName = menteeName;
        this.title = title;
        this.requestContent = requestContent;
        this.createdDate = createdDate;
        this.finishDate = finishDate;
        this.requestStatus = requestStatus;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequestContent() {
        return requestContent;
    }

    public void setRequestContent(String requestContent) {
        this.requestContent = requestContent;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public String getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
        this.requestStatus = requestStatus;
    }
    
    
}
