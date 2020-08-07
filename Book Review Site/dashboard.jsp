<!DOCTYPE html>

<%@ page import = "java.io.*, java.util.*, java.sql.*"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "assignment2";
    String userId = "root";
    String password = "Arohan051093794";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
    <main>
        <div class="title dashboard">Dashboard</div>
        <div class="nav">
            <a class="navitem item1" href="create.html">Create a Review</a>
            <a class="navitem item2 highlighted" href="dashboard.jsp">Your Reviews</a>
            <a class="navitem item3" href="search.html">Search</a>
            <a class="navitem item4" href="signout.html">Sign Out</a>
        </div>
        <div class="dash content">
            <div class="help">
                On this page, you can look at all of the reviews that you have written!<br>
                Click on one of the reviews to view it in greater detail!
            </div>
            <div class="view">
                <div class="all_reviews">
                    <!--
                        <div class="single_review">
                            <span class="type">Book Title:</span>
                            <span class="input book_title">Example Book 1</span> <br>
                            <span class="type">Author:</span>
                            <span class="input author">Example Author</span> <br>
                            <span class="type">Rating:</span>
                            <span class="input rating">9/10</span> <br>
                            <span class="type">Review by:</span>
                            <span class="input by">Username10</span>
                            <p class="description">This book was very good. I would recommend to other people.</p>
                            <a class="full_review" href="view.html">View Review In Detail</a>
                        </div>
                    -->
                    <%
                        try {
                            connection = DriverManager.getConnection(
                                    connectionUrl + dbName, userId, password);
                            statement = connection.createStatement();
                            String sql = "select * from users,reviews where users.uID = reviews.writtenby and reviews.writtenby = " + session.getAttribute("uID");
                            resultSet = statement.executeQuery(sql);

                            while(resultSet.next()) {
                                try {
                                    out.println("<div class=\"single_review\">\n" +
                                            "<span class=\"type\">Book Title:</span>\n" +
                                            "<span class=\"input book_title\">" + resultSet.getString("bookname") + "</span> <br>\n" +
                                            "<span class=\"type\">Author:</span>\n" +
                                            "<span class=\"input author\">" + resultSet.getString("author") + "</span> <br>\n" +
                                            "<span class=\"type\">Rating:</span>\n" +
                                            "<span class=\"input rating\">" + resultSet.getString("rating") + "/10</span> <br>\n" +
                                            "<span class=\"type\">Review by:</span>\n" +
                                            "<span class=\"input by\">" + resultSet.getString("username") + "</span>\n" +
                                            "<p class=\"description\">" + resultSet.getString("review") + "</p>\n" +
                                            "<a class=\"full_review\" href=\"view.html\">View Review In Detail</a>\n" +
                                            "</div>");
                                } catch (SQLException throwables) {
                                    throwables.printStackTrace();
                                }
                            }
                            connection.close();
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
    </main>
</body>
</html>