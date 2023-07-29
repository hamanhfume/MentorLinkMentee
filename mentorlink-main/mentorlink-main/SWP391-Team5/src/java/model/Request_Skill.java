/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Tuan Vinh
 */
public class Request_Skill {

    private int request_id;
    private ArrayList<Integer> itg;

    @Override
    public String toString() {
        return "Request_Skill{" + "request_id=" + request_id + ", itg=" + itg + '}';
    }

    public Request_Skill() {
    }

    public Request_Skill(int request_id, ArrayList<Integer> itg) {
        this.request_id = request_id;
        this.itg = itg;
    }

    public Request_Skill(ArrayList<Integer> itg) {
        this.itg = itg;
    }

    public ArrayList<Integer> getItg() {
        return itg;
    }

    public void setItg(ArrayList<Integer> itg) {
        this.itg = itg;
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

}
