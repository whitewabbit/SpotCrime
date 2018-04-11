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
                background: #FFF;
            }
            header {
                background: rgb(0,20,48);
                padding: 20px 50px 5px;
            }
            header img, header ul {
                display: inline-block;
            }
            .logo {
                height: 50px;
            }
            ul {
                list-style-type: none;
                margin-left: 80px;
                width: calc(100% - 220px);
            }
            ul li {
                display: inline-block;
                text-transform: uppercase;
                font: bold 11px Arial;
                color: #FFF;
                cursor: pointer;
                padding: 6px 12px 4px;
            }
            ul li:hover {
                background: linear-gradient(rgba(56,105,138,0.5),rgba(0,0,0,0));
            }
            .myHr {
                height: 3px;
                width: 100%;
                background: linear-gradient(to right, rgb(65,154,255),rgb(255,0,100));
            }
            iframe {
                border: none;
                width: 100%;
                bottom: 0;
                height: calc(100% - 84px);
                position: fixed;
            }
            button {
                float: right;
                margin-top: -60px;
                border: none;
                background: none;
                color: rgb(255,0,100);
                cursor: pointer;
                padding: 5px 10px 4px;
                background: #FFF;
            }
            
        </style>
    </head>
    <body>
        <%
            String name = "", username = "", location = "";
            if(session.getAttribute("name") == null){
                response.sendRedirect("index.jsp");
            }
            else {
                name = session.getAttribute("name").toString();
                username = session.getAttribute("username").toString();
                location = session.getAttribute("location").toString();
            }
        %>
        <header>
            <img class="logo" src="assets/img/spotcrime.png">
            <ul>
                <li>Dashboard</li>
                <li>Record Blotter</li>
                <li>Tabular & Graphical Data</li>
                <li>Mapping</li>
                <li style="float: right;">Manage Accounts</li>
                <li style="float: right;">New Account</li>
            </ul>
            <form action="assets/jsp/LogoutProcess.jsp" method="POST">
                <button>Logout</button>
            </form>
        </header>
        <div class="myHr"></div>
        <iframe src="assets/jsp/mapping.jsp" name="view"></iframe>
    </body>
</html>
