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
public class ErrorBookDTO {
    private String bookIDError, bookNameError;
    private String quantityError;
    private String priceError;
    private String bookTypeError;
    private String authorError;
    private String statusIDError;
     private String imageError;

    public ErrorBookDTO() {
    }

    public ErrorBookDTO(String bookIDError, String bookNameError, String quantityError, String priceError, String bookTypeError, String authorError, String statusIDError, String imageError) {
        this.bookIDError = bookIDError;
        this.bookNameError = bookNameError;
        this.quantityError = quantityError;
        this.priceError = priceError;
        this.bookTypeError = bookTypeError;
        this.authorError = authorError;
        this.statusIDError = statusIDError;
        this.imageError=imageError;
    }

    public String getBookIDError() {
        return bookIDError;
    }

    public void setBookIDError(String bookIDError) {
        this.bookIDError = bookIDError;
    }

    public String getBookNameError() {
        return bookNameError;
    }

    public void setBookNameError(String bookNameError) {
        this.bookNameError = bookNameError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getBookTypeError() {
        return bookTypeError;
    }

    public void setBookTypeError(String bookTypeError) {
        this.bookTypeError = bookTypeError;
    }

    public String getAuthorError() {
        return authorError;
    }

    public void setAuthorError(String authorError) {
        this.authorError = authorError;
    }

    public String getStatusIDError() {
        return statusIDError;
    }

    public void setStatusIDError(String statusIDError) {
        this.statusIDError = statusIDError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

       
}
