package com.book;
public class BookData {
    private String name = null;
    private String ID = null;
    private String author = null;
    private String press = null;
    private int totalQuantity = -1;
    private int realQuantity = -1;
    private String time = null;

    public BookData(String ID) {
        this.ID = ID;
    }

    public BookData() {
    }

    public BookData(String ID, String name, String author, String press, int totalQuantity, int realQuantity) {
        this.name = name;
        this.ID = ID;
        this.author = author;
        this.press = press;
        this.totalQuantity = totalQuantity;
        this.realQuantity = realQuantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public int getRealQuantity() {
        return realQuantity;
    }

    public void setRealQuantity(int realQuantity) {
        this.realQuantity = realQuantity;
    }

    public String getTime(){
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
