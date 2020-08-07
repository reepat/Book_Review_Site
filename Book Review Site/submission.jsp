<!DOCTYPE html>
<%@ page import = "java.io.*, java.util.*, java.sql.*"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "assignment2";
    String userId = "root";
    String password = "Arohan051093794";

    String writtenby = " " + session.getAttribute("uID") + " ";
    String booKTitle = " '" + request.getParameter("book_title") + "' ";
    String author = " '" + request.getParameter("author_name") + "' ";
    String rating = " " + request.getParameter("rate") + " ";
    String review = " '" + request.getParameter("review") + "' ";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        connection = DriverManager.getConnection(
                connectionUrl + dbName, userId, password);
        statement = connection.createStatement();
        String sql = "insert into reviews(writtenby, bookname, author, rating, review) " +
                "values(" + writtenby + "," + booKTitle + "," + author + "," + rating + "," + review + ")";
        int i = statement.executeUpdate(sql);
        connection.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signed Out</title>
    <link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<main class="transition">
    <div class="tr_view">
        <%
            out.println("<h1>Submission successful</h1>");
            out.println("Written by: " + session.getAttribute("uname") + "<br>");
            out.println("Book title: " + request.getParameter("book_title") + "<br>");
            out.println("Author: " + request.getParameter("author_name") + "<br>");
            out.println("Rating: " + request.getParameter("rate") + "<br>");
            out.println("Review: " + request.getParameter("review") + "<br>");
            out.println("<h2>Proceed to Dashboard:</h2>");
            out.println("<a href=dashboard.jsp><h2>Dashboard</h2></a>");
        %>
    </div>
</main>
</body>
</html>