<!DOCTYPE html>
<%@ page import = "java.io.*, java.util.*, java.sql.*"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "assignment2";
    String userId = "root";
    String password = "Arohan051093794";

    String login = " '" + request.getParameter("username") + "' ";
    String passwd = " '" + request.getParameter("password") + "' ";

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
    <title>Signed Out</title>
    <link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<main class="transition">
    <div class="tr_view">
        <%
            try {
                connection = DriverManager.getConnection(
                        connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                String sql = "select * from users where username = " + login +
                        "and pass = " + passwd;
                resultSet = statement.executeQuery(sql);
                int x = 0;
                if(resultSet.last())    {
                    x = resultSet.getRow();
                }
                if(x == 1) {
                    out.println("<h1>Login Success!</h1>");
                    out.println("<h2>Proceed to Dashboard:</h2>");
                    out.println("<a href=dashboard.jsp><h2>Dashboard</h2></a>");
                    session.setAttribute("uID", resultSet.getString("uID"));
                    session.setAttribute("uname", resultSet.getString("username"));
                    out.println("<h2>You have logged in as " + session.getAttribute("uname") + " <h2>");
                }
                else {
                    out.println("<h1>Login Failure!</h1>");
                    out.println("<p>Go back to Main Page:</p>");
                    out.println("<a href=index.html>Main Page</a>");
                }
                connection.close();
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</main>
</body>
</html>