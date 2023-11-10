package com.example.housemanage.model;

public class user {
    int ID;
    String username, password, name, email, number, address;
    byte[] avatar;

    public user() {
    }

    public user(String password, String email, String number, String address, byte[] avatar){
        this.password = password;
        this.email = email;
        this.number = number;
        this.address = address;
        this.avatar = avatar;
    }

    public user(int ID, String username, String password, String name, String email, String number, byte[] avatar, String address) {
        this.ID = ID;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.number = number;
        this.avatar = avatar;
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
