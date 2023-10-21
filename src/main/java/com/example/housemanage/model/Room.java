package com.example.housemanage.model;

public class Room {
    int ID, userID;
    String heading, address, description, name, city;
    double area, price;
    byte[] image;

    public Room() {
    }

    public Room(int ID, String heading, double price, double area, String address, String description, byte[] image) {
        this.ID = ID;
        this.heading = heading;
        this.price = price;
        this.area = area;
        this.address = address;
        this.description = description;
        this.image = image;
    }

    public Room(int ID, String heading, String address, double area, double price, String description, byte[] image, String name, int userID) {
        this.ID = ID;
        this.name = name;
        this.heading = heading;
        this.address = address;
        this.area = area;
        this.price = price;
        this.description = description;
        this.image = image;
        this.userID = userID;
    }


    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}

