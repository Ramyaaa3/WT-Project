<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
<%
    String registration_no = request.getParameter("registration_no");
    String password = request.getParameter("password");

    // Database Connection Information
    String jdbcUrl = "jdbc:mysql://localhost:3306/alumni";
    String dbUser = "root";
    String dbPassword = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String query = "SELECT * FROM users WHERE registration_no = ? AND password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, registration_no);
        preparedStatement.setString(2, password);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Successful login
            response.sendRedirect("myhomepage.html");
        } else {
            // Invalid login
            out.println("<p>Invalid login credentials!</p");
        }

        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    }
%>
</body>
</html>
