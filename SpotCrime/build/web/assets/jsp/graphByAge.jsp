<!DOCTYPE html>
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
            #container {
                width: 60%;
                left: 0;
                right: 0;
                margin: 35px auto 0;
            }
        </style>
    </head>
    <body>
        <div id='container'>
            <canvas id='canvas'></canvas>
        </div>
        <script>
            var datapoints = [0, 20, 20, 60, 60, 120, 0, 180, 120, 125, 105, 110];
            var config = {
                type: 'bar',
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
                        display: true,
                        text: 'Cases by Age'
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
                                suggestedMax: 200
                            }
                        }]
                    }
                }
            };
            window.onload = function() {
                var ctx = document.getElementById('canvas').getContext('2d');
                window.myLine = new Chart(ctx, config);
            };
	</script>
    </body>
</html>
