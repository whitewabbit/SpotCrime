<html>
    <head>
        <style>
            * {
                padding: 0;
                margin: 0;
            }
            #googleMap {
                position: fixed;
                z-index: 1;
                margin-top: 45px;
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
            .searchBox, #searchBtn{
                height: 45px;
                border: none;
                padding: 0 15px;
                float: right;
            }
            .searchBox {
                width: 250px;
                border-left: 1px solid rgb(220,220,220);
            }
            #searchBtn {
                background: #21e8ff;
                cursor: pointer;
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
        </style>
        <script src="../lib/jquery-3.2.1.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".filterBtn").click(function(){
                    $(this).toggleClass("active");
                });
            });
        </script>
    </head>
    <body>
        <script> var address = []; </script>
        <jsp:useBean id="Location" class="bean.Location" />
        <%
            String loc[] = Location.getCrimeLocations();
            for (int i = 0; i < loc.length; i++) { 
        %>
            <script>
                var add = "<%= loc[i] %>";
                address.push(add);
                
            </script>
        <% } %>
        <div id='filterContainer'>
            <button class="filterBtn">Pinpoint by Address</button>
            <button class="filterBtn">Pinpoint by Crime</button>
            <button class="filterBtn" onclick="toggleHeatmap()">Heatmap</button>
            <button id="searchBtn" onclick="search()">Search</button>
            <input id="searchAddress" class="searchBox" type='text' placeholder="Search">
        </div>
        <div id="googleMap" style="width:100%;height:calc(100% - 45px);"></div>
        
        <script>
            var points = [];
    function myMap() {
        var mapProp= {
            center:new google.maps.LatLng(6.7575,125.3524),
            zoom:12,
        };
        var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
        var geocoder = new google.maps.Geocoder();

        var L = ["Aplaya","Balabag","Binaton","Cogon","Colorado","Dawis","Dulangan","Goma","Igpit","Kiagot","Lungag","Matti","Kapatagan","Ruparan","San Agustin","San Jose","San Miquel","San Roque","Sinawilan","Soong","Tiguman","Zone 1","Zone 2", "Zone 3"];
        for(var i = 0; i < address.length; i++){
            geocodeAddress(geocoder, map, address[i]);
        }   
    }

    function geocodeAddress(geocoder, resultsMap, address) {
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
            var infowindow = new google.maps.InfoWindow({
                content:address
            });

            google.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(resultsMap,marker);
            });
            google.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            var lat = results[0].geometry.location.lat();
            var lng = results[0].geometry.location.lng();
            points.push(new google.maps.LatLng(lat,lng));
            createHotspot(resultsMap);
          } else {
            setTimeout(function(){
                geocodeAddress(geocoder, resultsMap, address);
            },1000);
          }
        });
      }
      
      function createHotspot(map){
        var heatmap = new google.maps.visualization.HeatmapLayer({
          data: points,
          map: map
        });
        heatmap.setMap(map);
        heatmap.set('radius',80);
        heatmap.set('opacity',0.01);
      }
      
    
    </script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=visualization&key=AIzaSyALHurn-A-W94HdnbZAVjhJA0-RU_PI_lY&callback=myMap"></script>
    </body>
</html>