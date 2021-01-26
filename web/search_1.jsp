<%-- 
    Document   : search
    Created on : Jun 2, 2020, 4:31:43 PM
    Author     : DELL
--%>

<%@page import="sample.dtos.BookDTO"%>
<%@page import="sample.dtos.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min_1.css" rel="stylesheet">
        <title>Search Page</title>
    </head>
    <body>
        <% String user = (String) session.getAttribute("ADMIN");
            if (user == null) {
                response.sendRedirect("index.html");
            }
        %>
        <h1>Welcome admin : <%=session.getAttribute("ADMIN")%> </h1>      
        <%--<%
            String searchBook = request.getParameter("txtSearchBook");
            if (searchBook == null) {
                searchBook = "";
            }
        %>--%>
        <form action="MainController" >
            <%--  Search Book <input type="text" name="txtSearchBook" value="<%=searchBook%>"/>
            <input value="SearchBook" name="btnAction"/>--%>


        </form>
        <%
            List<BookDTO> listBook = (List<BookDTO>) request.getAttribute("LIST_BOOK");
            if (listBook != null) {

                if (!listBook.isEmpty()) {
        %>
        <table class="table" border="1">
            <thead class="thead-dark">
                <tr>
                    <th>No</th>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Book Type</th>
                    <th>Author</th>
                    <th>Status ID</th>
                    <th>Image Link</th>
                    <th>Delete</th>
                    <th>Update</th>

                </tr>
            </thead>
            <tbody>
                <% int count = 1;
                    for (BookDTO dto : listBook) {
                %>

                <tr>
                    <td><%= count++%></td>
                    <td><%= dto.getBookID()%></td>
                    <td><%= dto.getBookName()%></td>
                    <td><%= dto.getQuantity()%></td>
                    <td><%= dto.getPrice()%></td>
                    <td><%= dto.getBookType()%></td>
                    <td><%= dto.getAuthor()%></td>
                    <td><%= dto.getStatusID()%></td>

                    <td><%= dto.getImage()%> </td>
                    <td>
                        <a href="MainController?btnAction=Delete&txtBookID=<%=dto.getBookID()%>" >Delete</a>

                    </td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="txtBookID" value="<%= dto.getBookID()%>"/>
                            <input type="hidden" name="txtBookName" value="<%= dto.getBookName()%>"/>
                            <input type="hidden" name="txtQuantity" value="<%= dto.getQuantity()%>"/>
                            <input type="hidden" name="txtPrice" value="<%= dto.getPrice()%>"/>
                            <input type="hidden" name="txtBookType" value="<%= dto.getBookType()%>"/>
                            <input type="hidden" name="txtAuthor" value="<%= dto.getAuthor()%>"/>
                            <input type="hidden" name="txtStatusID" value="<%= dto.getStatusID()%>"/>
                            <input type="hidden" name="txtImage" value="<%= dto.getImage()%>"/>
                            <%--<input type="hidden" name="txtSearchBook" value="<%=searchBook%>"/>--%>
                            <input type="submit" name="btnAction" value="Update_Page"/>



                        </form>
                    </td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>

        <%
                }
            }
        %>
        <a href="create.jsp">Create new book</a>
        <a href="MainController?btnAction=Logout">Logout</a>
    </body>
</html>
