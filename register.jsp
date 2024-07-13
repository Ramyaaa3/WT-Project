<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store Data</title>
</head>
<body>
    <% 
    String regNo = request.getParameter("regNo");
    String emailId = request.getParameter("emailId");
    String linkedIn = request.getParameter("linkedIn");
    String password = request.getParameter("password");
    
    // Perform validation and ensure the password matches confirmPassword
    
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumni", "root", "root");
        
        String insertQuery = "INSERT INTO users (registration_no, email, linkedin_id, password) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertQuery);
        stmt.setString(1, regNo);
        stmt.setString(2, emailId);
        stmt.setString(3, linkedIn);
        stmt.setString(4, password);
        stmt.executeUpdate();
        
        response.sendRedirect("login.html");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException se) {
            out.println("Error closing database resources: " + se.getMessage());
        }
    }
    %>
</body>
</html>
