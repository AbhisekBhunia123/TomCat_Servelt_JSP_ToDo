
package com.practice;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class DeleteData extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
        //first load jdbc driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            //get a connection object
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "root");
            
            String id=req.getParameter("id");
            
            String q="delete from todo where id="+id;
            
            Statement stmt=con.createStatement();
            stmt.execute(q);
            
            res.sendRedirect("home.jsp");
            con.close();
            
        
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}
