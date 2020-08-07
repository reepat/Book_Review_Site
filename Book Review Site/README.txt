
1. Make sure this project directory is in this directory:
Tomcat 9.0/webapps/ROOT/

2. Please make sure to initialize the database using the script found in:
sql/initDBscript.sql

3. Please make sure to change the database urls, usernames, and passwords in each of the JSPs
You will find code that looks like this:

    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "assignment2";
    String userId = "root";
    String password = "Arohan051093794";

This will coneect to a database at: jdbc:mysql://localhost:3306/assignment2
Change the url and password to your specific database and password or this will not run.