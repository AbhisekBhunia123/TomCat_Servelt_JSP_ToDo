

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles/style1.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="container maincontent">
            <p id="heading">Store Your Memories</p>

            <div class="formclass mt-5" >
                <hr id="hr"/>
                <form action="storedata" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="task" aria-describedby="emailHelp" name="task">

                    </div>
                    <button type="submit" class="btn btn-outline-success submitBtn">Add Task</button>
                </form>
            </div>
            <div class="formclass mt-4 taskDivClass">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "root");

                        String q = "select * from todo";

                        Statement stmt = con.createStatement();
                        ResultSet set = stmt.executeQuery(q);
                %>
                <%
                    while (set.next()) {
                %>
                <div style="width:60% ;margin:auto;margin-top:5px;">
                <input type="text" class="taskPara" value="<%= set.getString(2)%>" /><button type="button" class="btn btn-danger" id="<%= set.getString(1)%>" >Delete</button> 
                </div>
                <% }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>

        </div>

        <script src="./all_js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
