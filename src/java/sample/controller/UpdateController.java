/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.daos.BookDAO;
import sample.dtos.BookDTO;
import sample.dtos.ErrorBookDTO;

/**
 *
 * @author DELL
 */
public class UpdateController extends HttpServlet {

    private static final String ERROR = "update.jsp";
    private static final String SUCCESS = "SearchBookController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ErrorBookDTO errorBook = new ErrorBookDTO("", "", "", "", "", "", "", "");
        try {
            String bookID = request.getParameter("txtBookID");
            String bookName = request.getParameter("txtBookName");
            String quantity = request.getParameter("txtQuantity");
            String price = request.getParameter("txtPrice");
            String bookType = request.getParameter("txtBookType");
            String author = request.getParameter("txtAuthor");
            String statusID = request.getParameter("txtStatusID");
            String image = request.getParameter("txtImage");
            boolean check = true;

            if (bookName == "") {
                errorBook.setBookNameError("Book Name is not null");
                check = false;
            }
            if (quantity == "" || !quantity.matches("\\d+$")) {
                errorBook.setQuantityError("Quantity is an integer and not null");
                check = false;
            }

            if (price == "" || !price.matches("^\\d+(\\.\\d+)?")) {
                errorBook.setPriceError("Price is a number and not null");
                check = false;
            }
            if (bookType == "") {
                errorBook.setBookTypeError("Book type is not null");
                check = false;
            }
            String regexName = "\\p{Upper}(\\p{Lower}+\\s?)";
            String patternName = "(" + regexName + "){2,3}";
            if (author == "" || !author.matches(patternName)) {
                errorBook.setAuthorError("Author is not null and must be a true name ");
                check = false;
            }
            if (statusID == "" || !statusID.matches("[1-2]+")) {
                errorBook.setStatusIDError("Status ID is not null and from 1 to 2 ");
                check = false;
            }
            if (image == "") {
                errorBook.setImageError("Image is not null");
                check = false;
            }
            BookDAO dao = new BookDAO();
            if (check) {

                BookDTO dto = new BookDTO(bookID, bookName, Integer.parseInt(quantity), new BigDecimal(price), bookType, author, Integer.parseInt(statusID), image);
                dao.update(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERRORBOOK", errorBook);
            }
//           
        } catch (Exception e) {
//            if (e.toString().contains("duplicate")) {
//
//                request.setAttribute("ERROR", errorBook);
//                 errorBook.setBookIDError("User ID is existed");
//
//            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
