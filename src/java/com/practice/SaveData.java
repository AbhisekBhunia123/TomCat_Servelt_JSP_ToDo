package com.practice;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Random;

public class SaveData extends HttpServlet {

    public String createId() {
        Random rd = new Random();
        String str = "";
        for (int i = 0; i < 9; i++) {
            int number = rd.nextInt(100);
            str += number;
        }
        return str;
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            //first load jdbc driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //get a connection object
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "root");

            //get data from user
            String task = req.getParameter("task");
            String id = createId();

            //prepare for query
            String q = "insert into todo(id,task) values(?,?)";

            //prepare a statement
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, id);
            pstmt.setString(2, task);

            //commit data
            pstmt.executeUpdate();
            
            res.sendRedirect("home.jsp");
            
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
