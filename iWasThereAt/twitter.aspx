<%@ Page Language="C#" AutoEventWireup="true" CodeFile="twitter.aspx.cs" Inherits="twitter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>i Was There At - Twitter</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="all">

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript">
    var map;
    var marker;
    var infowindow;
    var geocoder = new google.maps.Geocoder();

    function geocodePosition(pos) {
        geocoder.geocode({
            latLng: pos
        }, function (responses) {
            if (responses && responses.length > 0) {
                updateMarkerAddress(responses[0].formatted_address);
            } else {
                updateMarkerAddress('Cannot determine address at this location.');
            }
        });
    }

    
    function updateMarkerPosition(latLng) {
        document.getElementById('HiddenField1').value = latLng.lat();
        document.getElementById('HiddenField2').value = latLng.lng();
    }

    function updateMarkerAddress(str) {
        document.getElementById('address').innerHTML = str;
    }

    function initialize() {
        var latLng = new google.maps.LatLng(28.633946908650433, 77.21962255859376);
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 7,
            center: latLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        marker = new google.maps.Marker({
            position: latLng,
            title: "Point A",
            map: map,
            draggable: true
        });
        updateMarkerPosition(latLng);
        geocodePosition(latLng);
        google.maps.event.addListener(marker, 'dragend', function () {
            updateMarkerPosition(marker.getPosition());
            geocodePosition(marker.getPosition());
        });
    }
    </script>
    <script type="text/javascript">
        function autocom() {
            var acOptions = {
                types: ['geocode']
            };
            var autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'), acOptions);
            autocomplete.bindTo('bounds', map);
            infoWindow = new google.maps.InfoWindow();


            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                infoWindow.close();
                var place = autocomplete.getPlace();
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    
                }
                marker.setPosition(place.geometry.location);
                updateMarkerPosition(marker.getPosition());
                geocodePosition(marker.getPosition());

            });
        }
    
    // Onload handler to fire off the app.
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
    <style type="text/css">
        #autocomplete
        {
            height: 24px;
            width: 231px;
        }
    </style>
</head>
<body onload="initialize()">
    <form id="form1" runat="server">
    
            <div id="mapinfo">
            <h1>IWasThereAt</h1>
            <asp:Label ID="Label2" runat="server" Text="Search a Place"></asp:Label>
            <br />

                <input type="text" id="autocomplete" onfocus="autocom()"><br/><br/>
            <asp:Label ID="address" runat="server" Text=""></asp:Label>
            <br /><br /><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Post a Tweet" Height="75px"
            TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1"
            runat="server" Text="Tweet" onclick="Button1_Click" BackColor="#00CC00" 
            Font-Bold="True" Font-Size="Large" ForeColor="White" Height="40px" 
            Width="96px" />
        <br />
        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
        
        
        </ContentTemplate>
    </asp:UpdatePanel>
    
        
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:HiddenField ID="HiddenField2" runat="server" />
        </div>
    <div id="map"></div>
    </form>
</body>
</html>
