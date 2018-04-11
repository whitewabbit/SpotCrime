<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../lib/Chart.js"></script>
        <script src="../lib/utils.js"></script>
        <style>
            * {
                padding: 0;
                margin: 0;
            }
            body {
                background: rgb(235,235,235);
            }
            #container {
                width: 1240px;
                height: calc(100% - 50px);
                position: fixed;
                left: 0;
                right: 0;
                margin: 40px auto;
            }
            #summary {
                width: 935px;
                height: 90px;
                margin-bottom: 20px;
            }
            #graph {
                background: #FFF;
                width: 890px;
                height: 360px;
                padding: 15px;
                border-bottom: 1px solid rgb(220,220,220);
            }
            #profile {
                background: #FFF;
                width: 285px;
                height: 470px;
                float: right;
                padding: 15px 10px;
                margin-top: -500px;
                border-bottom: 1px solid rgb(220,220,220);
            }
            .info {
                display: inline-block;
                background: #FFF;
                width: 180px;
                height: 65px;
                padding: 15px 20px;
                margin-right: 10px;
                border-bottom: 1px solid rgb(220,220,220);
            }
            .con-info, .img {
                display: inline-block;
                vertical-align: middle;
            }
            .img {
                width: 65px;
                height: 65px;
                border-radius: 50%; 
                margin-right: 8px;
            }
            .con-info {
                width: 100px;
            }
            .data {
                font: bold 22px Arial;   
            }
            .des {
                font: 12px Arial;
                color: rgb(50,50,50);
            }
            .titleContainer {
                width: 100%;
                border-bottom: 1px solid rgb(220,220,220);
                margin-left: -15px;
                margin-top: -15px;
                padding: 10px 15px 4px;
            }
            .titleContainer * {
                display: inline-block;
            }
            .titleContainer h1 {
                font: 16px Arial;
                color: rgb(255,0,100);
            }
            .titleContainer select {
                float: right;
            }
            #filterCrime {
                border: none;
                border-left: 1px solid rgb(230,230,230);
                height: 32px;
                margin-top: -10px;
                margin-right: -5px;
                padding: 0 10px;
                width: 250px;
            }
            #mainContainer {
                width: 70%;
                left: 0;
                right: 0;
                margin: 15px auto 0;
            }
            #mainContainer canvas {
                
            }
        </style>     
        <script src="../lib/jquery-3.2.1.min.js"></script>
        <script>
            $(document).ready(function(){
                var date = new Date();
                var idx = date.getMonth();
                var M = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                document.getElementsByClassName('des')[0].innerHTML = M[idx] + " Cases";
                document.getElementsByClassName('des')[3].innerHTML = "Year " +  (date.getYear()+1900) + " Cases";
            });
        </script>
    </head>
    <body>
        <div id="container">
            <div id="summary">
                <div class="info">
                    <div class="img" style="background: #2bb1ff"></div>
                    <div class="con-info">
                        <p class="data">15</p>
                        <p class="des">Total Crime</p>
                    </div>
                </div>
                <div class="info">
                    <div class="img" style="background: #ff237f"></div>
                    <div class="con-info">
                        <p class="data">6</p>
                        <p class="des">Solved Cases</p>
                    </div>
                </div>
                <div class="info">
                    <div class="img" style="background: #8930ff"></div>
                    <div class="con-info">
                        <p class="data">9</p>
                        <p class="des">Unsolved Cases</p>
                    </div>
                </div>
                <div class="info">
                    <div class="img" style="background: #ffde0c"></div>
                    <div class="con-info">
                        <p class="data">63</p>
                        <p class="des">Total Crime</p>
                    </div>
                </div>
            </div>
            <div id="graph">
                <div class="titleContainer">
                    <h1>Crime Statistics</h1>
                    <select id="filterCrime">
                        <option>All Crimes</option>
                        <option>Indexed and Non-indexed Crimes</option>
                        <option>Indexed Crimes</option>
                        <option>Non-indexed Crimes</option>
                    </select>
                </div>
                <div id="mainContainer">
                    <canvas id="crimestat">
                </div>
            </div>
            <div id="profile"></div>
        </div>
        <script>
            var datapoints = [0, 20, 20, 60, 60, 120, 0, 135, 120, 125, 105, 110];
            var config = {
                type: 'line',
                data: {
                    labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
                    datasets: [{
                        label: ' All Crimes',
                        data: datapoints,
                        borderColor: window.chartColors.blue,
                        backgroundColor: window.chartColors.blue,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: false
                    },
                    tooltips: {
                        mode: 'index'
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Month',
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Count'
                            },
                            ticks: {
                                suggestedMin: 0,
                                suggestedMax: 150
                            }
                        }]
                    }
                }
            };
            window.onload = function() {
                var ctx = document.getElementById('crimestat').getContext('2d');
                window.myLine = new Chart(ctx, config);
            };
        </script>
    </body>
</html>
