/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

import java.math.BigDecimal;

/**
 *
 * @author DELL
 */
public class BookDTO {

    private String bookID, bookName;
    private int quantity;
    private BigDecimal price;
    private String bookType;
    private String author;
    private int statusID;
    private String image;

    public BookDTO() {
    }

    public BookDTO(String bookID, String bookName, int quantity, BigDecimal price, String bookType, String author, int statusID, String image) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.quantity = quantity;
        this.price = price;
        this.bookType = bookType;
        this.author = author;
        this.statusID = statusID;

        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

}
