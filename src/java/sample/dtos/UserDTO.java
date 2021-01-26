/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

/**
 *
 * @author DELL
 */
//DATA TRANSFER OBJ
public class UserDTO {
        private String userID, password,fullName;
        private int roleID;        
        private String phoneNumber, address;
        private int status;

    public UserDTO() {
    }

    public UserDTO(String userID, String password, String fullName, int roleID, String phoneNumber, String address, int status) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.roleID = roleID;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

   

    
}