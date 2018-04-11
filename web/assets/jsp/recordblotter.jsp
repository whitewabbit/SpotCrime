<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<head>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        form {
            left: 0;
            right: 0;
            margin: 40px auto 0;
            position: absolute;
            width: 820px;
            height: 85%;
            background: white;
            box-shadow: 1px 3px 5px #000;
        }
        h1{
            font: 18px Arial;
            background: rgb(230,230,230);
            padding: 10px 20px 6px;
        }
        .container {
            margin-left: 10px;
            padding: 20px 20px 20px 30px;
            height: calc(100% - 100px);
        }
        .scrollable-container {
            height: 100%;
            overflow: scroll;
        }
        div > p {
            font: 12px Arial;
        }
        .label {
            font: bold 10px Arial;
            color: rgb(255,0,100);
        }
        input, select {
            border: none;
            border-bottom: 1px solid rgb(200,200,200);
            padding: 13px 10px 2px;
            font: 16px Arial;
            background: none;
        }
        .label-3, .input-3 {
            display: inline-block;
            width: 230px;
            margin-right: 15px;
        }
        .label-4, .input-4 {
            display: inline-block;
            width: 168px;
            margin-right: 15px;
        }
        .label-2, .input-2 {
            display: inline-block;
            width: 355px;
            margin-right: 15px;
        }
        .label-1, .input-1 {
            width: calc(100% - 20px);
        }
        h2 {
            font: bold 12px Arial;
            margin-bottom: 8px;
        }
        .cancelBtn, .saveBtn {
            border: none;
            background: rgb(180,180,180);
            padding: 10px 0 8px;
            font: bold 12px Arial;
            cursor: pointer;
        }
        .saveBtn {
            background: rgb(255,0,100);
            color: #FFF;
        }
        ::-webkit-scrollbar {
            width: 6px;
            height: 0;      
        }
        ::-webkit-scrollbar-track {
            background: #FFF;
        }
        ::-webkit-scrollbar-thumb {
            background: #399BFF;
            border-radius: 3px;
        }
    </style>
    <script>
        
        function resetForm(){
            location.reload();
        }
        
    </script>
</head>
<body>
    <%
        String D[] = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
        Date date = new Date(Calendar.getInstance().getTimeInMillis());
        Time time = new Time(Calendar.getInstance().getTimeInMillis());
        String day = D[date.getDay()];
        
    %>
    <form action="process/recordBlotterProcess.jsp" method="POST">
        <h1>Record a Blotter</h1>
        <div class='container'>
            <p>Please review blotter information below. Click 'Save' to record the blotter, or click 'Cancel' to return back without saving the information.</p>
            <div class='scrollable-container'>
                <br>
                <p class="label label-3">DATE</p>
                <p class="label label-3">TIME</p>
                <p class="label label-3">DAY OF THE WEEK</p>
                <br>
                <input class="input-3" name="date" type='date' value="<%=date%>">
                <input class="input-3" name="time" type='time' value="<%=time%>">
                <select class="input-3" name="day">
                    <option>Sunday</option>
                    <option>Monday</option>
                    <option>Tuesday</option>
                    <option>Wednesday</option>
                    <option>Thursday</option>
                    <option>Friday</option>
                    <option>Saturday</option>
                </select>
                <br><br>
                <p class="label">ADDRESS</p>
                <input class="input-3" type='text' name="addressLine" placeholder="Address Line 1">
                <select class="select-tab input-3" name="brgy">
                    <option>Aplaya</option>
                    <option>Balabag</option>
                    <option>Binaton</option>
                    <option>Cogon</option>
                    <option>Colorado</option>
                    <option>Dawis</option>
                    <option>Dulangan</option>
                    <option>Goma</option>
                    <option>Igpit</option>
                    <option>Kiagot</option>
                    <option>Lungag</option>
                    <option>Mahayahay</option>
                    <option>Matti</option>
                    <option>Kapatagan</option>
                    <option>Ruparan</option>
                    <option>San Agustin</option>
                    <option>San Jose</option>
                    <option>San Miguel</option>
                    <option>San Roque</option>
                    <option>Sinawilan</option>
                    <option>Soong</option>
                    <option>Tiguman</option>
                    <option>Zone 1</option>
                    <option>Zone 2</option>
                    <option>Zone 3</option>
                </select>
                <input class="input-3" type='text' placeholder="<%=session.getAttribute("location").toString()%>" disabled>
                <br><br>
                <p class="label label-1">LAW VIOLATED</p>
                <input class="input-1" type="text" name="lawviolated" list="list">
                <br><br><br><br>
                <h2> VICTIM'S INFORMATION </h2>
                <p class="label label-3">AGE</p>
                <p class="label label-3">GENDER</p>
                <p class="label label-3">MARITAL STATUS</p>
                <br>
                <input class="input-3" type='number' name="vAge" placeholder="">
                <select class="select-tab input-3" name="vSex">
                    <option>Male</option>
                    <option>Female</option>
                </select>
                <select class="select-tab input-3" name="vStat">
                    <option>Single</option>
                    <option>Married</option>
                    <option>Widowed</option>
                    <option>Separated</option>
                    <option>Live-in</option>
                </select>
                <br><br><br><br>
                <h2> SUSPECT'S INFORMATION </h2>
                <p class="label label-4">USE OF DRUG</p>
                <p class="label label-4">USE OF ALCOHOL</p>
                <p class="label label-4">USE OF UNC</p>
                <p class="label label-4">USE OF FA</p>
                <br>
                <select class="select-tab input-4" name="sDrug">
                    <option>No</option>
                    <option>Yes</option>
                </select>
                <select class="select-tab input-4" name="sAlcohol">
                    <option>No</option>
                    <option>Yes</option>
                </select>
                <select class="select-tab input-4" name="sUnc">
                    <option>No</option>
                    <option>Yes</option>
                </select>
                <select class="select-tab input-4" name="sFa">
                    <option>No</option>
                    <option>Yes</option>
                </select>
                <br><br>
                <p class="label label-3">AGE</p>
                <p class="label label-3">GENDER</p>
                <p class="label label-3">NATIONALITY</p>
                <br>
                <input class="input-3" type='number' name="sAge" placeholder="">
                <select class="input-3" name="sSex">
                    <option>Male</option>
                    <option>Female</option>
                </select>
                <input class="input-3" type='text' name="sNat" placeholder="Filipino" value="Filipino">
                <br><br>
                <p class="label label-1">STATUS</p>
                <input class="input-1" type='text' placeholder="" name="sStat">
                <br><br>
                <p class="label label-1">ACTION TAKEN</p>
                <input class="input-1" type='text' placeholder="" name="sAction">
                <br><br><br><br>
                <button type="button" class='input-2 cancelBtn' onclick="resetForm();">RESET</button>
                <button class='input-2 saveBtn'>SAVE</button>
            </div>
        </div>
    </form>
    
</body>
