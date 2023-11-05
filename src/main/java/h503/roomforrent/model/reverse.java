package h503.roomforrent.model;

public class reverse {
    int roomID;
    String senderName, senderNumber, senderNote;

    public reverse() {
    }

    public reverse(int roomID, String senderName, String senderNumber, String senderNote) {
        this.roomID = roomID;
        this.senderName = senderName;
        this.senderNumber = senderNumber;
        this.senderNote = senderNote;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderNumber() {
        return senderNumber;
    }

    public void setSenderNumber(String senderNumber) {
        this.senderNumber = senderNumber;
    }

    public String getSenderNote() {
        return senderNote;
    }

    public void setSenderNote(String senderNote) {
        this.senderNote = senderNote;
    }
}
