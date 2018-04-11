<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                padding: 0;
                margin: 0;
            }
            body {
                background: rgb(245,245,245);
            }
            #container { 
                width: 65%;
                height: 300px;
                left: 0;
                right: 0;
                margin: 60px auto;
            }
            #filterContainer {
                position: fixed;
                z-index: 2;
                top: 0;
                width: 100%;
                height: 45px;
                background: #FFF;
                box-shadow: 1px 1px 3px rgb(80,80,80);
                overflow: hidden;
            }
            #filterContainer * {
                display: inline-block;
            }
            select {
                height: 45px;
                border: none;
                padding: 0 15px;
                float: right;
                width: 250px;
                border-left: 1px solid rgb(220,220,220);
            }
            
            .filterBtn {
                height: 45px;
                padding: 0 20px;
                border:none;
                margin: 0 0 0 -4px;
                background: #FFF;
                border-right: 1px solid rgb(220,220,220);
                cursor: pointer;
            }
            .filterBtn:first-child {
                margin: 0 0 0 0 !important;
            }
            .filterBtn:hover {
                background: rgb(245,245,245);
            }
            .active {
                background: #21e8ff;
            }
            .active:hover {
                background: #21e8ff !important;
            }
            #graphContainer {
                width: 100%;
                height: calc(100% - 45px);
                background: #FFF;
                margin-top: 45px;
            }
            iframe {
                border: none;
            }
            
        </style>
        <script src="../lib/jquery-3.2.1.min.js"></script>
        <script>
            var view = "graph";
            $(document).ready(function(){
                $(".filterBtn").click(function(){
                    $(".filterBtn").removeClass("active");
                    $(this).toggleClass("active");
                    if(view === "tabular"){
                        view = "graph";
                        $('#graphContainer').attr('src','graphByMonth.jsp');
                    }
                    else {
                        view = "tabular";
                        $('#graphContainer').attr('src','tabularByMonth.jsp');
                    }
                });
            });
            function redirect(sel){
                var path = view + sel.value;
                $('#graphContainer').attr('src',path);
                console.log(path);
            }
        </script>
    </head>
    <body>
        <div id='filterContainer'>
            <button class="filterBtn active">Graph View</button>
            <button class="filterBtn">Tabular View</button>
            <select onchange="redirect(this)">
                <option value="ByMonth.jsp">Cases in Digos City</option>
                <option value="ByBrgy.jsp">Cases by Barangay</option>
                <option value="ByGender.jsp">Cases by Gender</option>
                <option value="ByAge.jsp">Cases by Age</option>
            </select>
        </div>
        <iframe id='graphContainer' src='graphByMonth.jsp' name='view'>
            
        </iframe>
    </body>
</html>
