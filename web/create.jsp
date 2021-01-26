<%-- 
    Document   : create
    Created on : Jul 12, 2020, 10:11:51 PM
    Author     : DELL
--%>

<%@page import="sample.dtos.ErrorBookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Book Page</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("ADMIN");
            if (user == null) {
                response.sendRedirect("index.html");

            }
        %>
        <%
            ErrorBookDTO errorBook = (ErrorBookDTO) request.getAttribute("ERRORBOOK");
            if (errorBook == null) {
                errorBook = new ErrorBookDTO("", "", "", "", "", "", "", "");
            }
        %>
        <form action="MainController" method="POST">
            Book ID:<input type="text" name="txtBookID"/></br>
            <%=errorBook.getBookIDError()%></br>

            Book Name<input type="text" name="txtBookName"/></br>
            <%=errorBook.getBookNameError()%></br>
            Quantity<input type="text" name="txtQuantity"/></br>
            <%=errorBook.getQuantityError()%></br>
            Price<input type="text" name="txtPrice"/></br>
            <%=errorBook.getPriceError()%></br>
            Book Type<input type="text" name="txtBookType"/></br>
            <%=errorBook.getBookTypeError()%></br>
            Author<input type="text" name="txtAuthor"/></br>
            <%=errorBook.getAuthorError()%></br>
            Status ID<input type="text" name="txtStatusID"/></br>
            <%=errorBook.getStatusIDError()%></br>
            Image:<input type="text" name="txtImage"/></br>
            <%=errorBook.getImageError()%></br>

            <input type="submit" name="btnAction" value="Create"/></br>
        </form>
    </body>
</html>
