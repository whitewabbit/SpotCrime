<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spot Crime</title>
        <style>

            * {
                padding: 0;
                margin: 0;
                font: 12px Arial;
            }

            body {
                background: url('assets/img/bg.jpg');
                background-size: 100% auto; 
            }

            #loginContainer {
                position: absolute;
                background: #FFF;
                width: 250px;
                height: 215px;
                right: 17%;
                top: 0;
                bottom: 0;
                margin: auto 0;
                box-shadow: 1px 3px 5px #000;
                padding: 45px 20px 20px;
            }
            #loginContainer h1 { 
                font: 16px Arial;
                color: rgb(255,0,100);
                text-align: center;
            }
            #loginContainer p {
                font: italic 12px Arial;
                color: rgb(80,80,80);
                text-align: center;
                margin-bottom: 20px;
            }
            #loginContainer form {
                width: 100%;
                height: 100%;
            }
            #loginContainer form input {
                background: rgb(220,220,220);
                width: calc(100% - 20px);
                padding: 10px 10px 8px;
                margin-bottom: 10px;
                font: 14px Arial;
                border: none;
            }
            #loginButton{
                background: rgb(255,0,100) !important;
                color: #FFF;
                width: 100% !important;
                padding: 10px 0 7px !important;
                font: 16px Arial;
                border: none;
                cursor: pointer;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        
        <%
            if(session.getAttribute("name") != null){
                response.sendRedirect("home.jsp");
            }
            if(request.getAttribute("message") != null){
                String status = request.getAttribute("status").toString();
                if(status.equals("true")){
                    User user = (User)request.getAttribute("user");
                    session.setAttribute("name", user.getName());
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("location", user.getLocation());
                    response.sendRedirect("home.jsp");
                }
            }
        %>  
        
        <div id="loginContainer">
            <h1>Login Account</h1>
            <p>Digos City Community Crime Map</p>
            <form action="${pageContext.request.contextPath}/LoginProcess" method="POST">
                <input type="text" name="username" placeholder="Email or Username" required autocomplete="off">
                <input type="password" name="password" placeholder="Password" required autocomplete="off">
                <br>
                <input id="loginButton" type="submit" value="Continue">
                
                <% if(request.getAttribute("message") != null){ 
                    String status = request.getAttribute("status").toString();
                    String message = request.getAttribute("message").toString();
                    if(status.equals("false")){ %>
                        <br>
                        <p> <%= message %> </p>
                <%    }
                }%>
            </form>
        </div>
                      
    </body>
</html>
