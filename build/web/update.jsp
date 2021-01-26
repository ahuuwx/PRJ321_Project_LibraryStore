<%-- 
    Document   : update
    Created on : Jun 9, 2020, 4:13:01 PM
    Author     : DELL
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="sample.dtos.ErrorBookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("ADMIN");
            if (user == null) {
                response.sendRedirect("index.html");

            }
        %>
        <%
            String bookID = request.getParameter("txtBookID");
            if (bookID == null) {
                bookID = "";
            }
            String bookName = request.getParameter("txtBookName");
            if (bookName == null) {
                bookName = "";
            }
            String quantity = request.getParameter("txtQuantity");

            if (quantity == null) {
                quantity = "";
            }
            String price = request.getParameter("txtPrice");

            if (price == null) {
                price = "";
            }
            String bookType = request.getParameter("txtBookType");

            if (bookType == null) {
                bookType = "";
            }
            String author = request.getParameter("txtAuthor");

            if (author == null) {
                author = "";
            }
            String statusID = request.getParameter("txtStatusID");

            if (statusID == null) {
                statusID = "";
            }
            String image = request.getParameter("txtImage");

            if (image == null) {
                image = "";
            }
            String search = request.getParameter("txtSearchBook");

            if (search == null) {
                search = "";
            }
            ErrorBookDTO error = (ErrorBookDTO) request.getAttribute("ERRORBOOK");
            if (error == null) {
                error = new ErrorBookDTO("", "", "", "", "", "", "", "");
            }
        %>
        <form action="MainController" method="POST">
            Book ID<input type="text" name="txtBookID" value="<%=bookID%>" readonly="true"/></br>
            <%= error.getBookIDError()%> </br>
            Book Name<input type="text" name="txtBookName" value="<%=bookName%>"/></br>
            <%= error.getBookNameError()%> </br>
            Quantity<input type="text" name="txtQuantity" value="<%=quantity%>"/></br>
            <%= error.getQuantityError()%> </br>
            Price<input type="text" name="txtPrice" value="<%=price%>"/></br>
            <%= error.getQuantityError()%> </br>
            Book Type<input type="text" name="txtBookType" value="<%=bookType%>"/></br>
            <%= error.getBookTypeError()%> </br>
            Author<input type="text" name="txtAuthor" value="<%=author%>"/></br>
            <%= error.getAuthorError()%> </br>
            Status ID<input type="text" name="txtStatusID" value="<%= statusID%>"/></br>
            <%= error.getStatusIDError()%> </br>
            Image Link<input type="text" name="txtImage" value="<%=image%>"/></br>
            <%= error.getImageError()%> </br>
            <input type="hidden" name="txtSearchBook" value="<%= search%>"/>
            <input type="submit" name="btnAction" value="Update"/>

        </form>
    </body>
</html>
