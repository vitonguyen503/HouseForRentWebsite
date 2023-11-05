package h503.roomforrent.model;

public class room {
    int ID;
    int userID;
    String heading, address, description;
    double area, price;
    byte image;

    public room() {
    }

    public room(int ID, int userID, String heading, String address, double area, double price, String description, byte image) {
        this.ID = ID;
        this.userID = userID;
        this.heading = heading;
        this.address = address;
        this.area = area;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public byte getImage() {
        return image;
    }

    public void setImage(byte image) {
        this.image = image;
    }
}
