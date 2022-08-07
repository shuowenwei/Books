<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv=Expires content=-10 />       
<meta http-equiv=Pragma  content=No-cache />       
<meta http-equiv=Cache-Control, private />    
<style type="text/css">     
  html { height: 50% }
  body { height: 50%; margin: 30px; padding: 100px }
  mapDiv { height: 50% }
 
</style>
<style>
table
{

border-collapse:collapse;
}

</style>
<title>Report an Issue</title>
<link href="./css/map.css" media="screen" rel="Stylesheet" type="text/css"/>
<style type="text/css">
<!--
#apDiv1 {
	position:absolute;
	width:850px;
	height:450px;
	z-index:6;
	left: 0px;
	top: 150px;
}
#mapDiv {
	position:absolute;
	width:750px;
	height:560px;
	z-index:6;
	top: 152px;
	left: 200px;
	border:1px solid #C1B294;
}
#apDiv2 {
	position:absolute;
	width:1000px;
	height:105px;
	z-index:1;
	left: -1px;
	top: 450px;
}
#infoDiv {
	position:absolute;
	width:1087px;
	height:125px;
	z-index:7;
	left: 200px;
	top: 625px;
}
#apDiv3 {
	position:absolute;
	width:250px;
	height:450px;
	z-index:8;
	left: 986px;
	top: 150px;
}
#apDiv3 form p {
	color: #F00;
}
#apDiv3 form h5 {
	color: #F00;
}
.star {
	color: #F00;
}
.star {
	color: #F00;
}
.star {
	color: #F00;
}
.star {
	color: #F00;
}
.star {
	color: #F00;
}
-->
</style>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">
  var geocoder;
  var map;
  
  function initialize() {
	geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(36.0996, -80.24105);//winston-salem
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("mapDiv"),
        myOptions);
   }
  
  function codeAddress(address,city,state) {
 //form verification
 if (document.issueinfo.address.value.length == 0) {

       alert("Please input your Street Address.");

       document.issueinfo.address.focus();

       return;

  }
 if (document.issueinfo.city.value.length == 0) {

     alert("Please input your City.");

     document.issueinfo.city.focus();

     return;

}
 if (document.issueinfo.state.value.length == 0) {

     alert("Please select your State.");
     return;

}
 if (document.issueinfo.sum.value.length == 0) {

     alert("Please input the Summary of your issue.");

     document.issueinfo.sum.focus();

     return;

}
 if (document.issueinfo.descript.value.length < 50) {

     alert("The issue descriptions cannot be less than 50 characters.");

     document.issueinfo.descript.focus();

     return;

}
 if(document.issueinfo.email.value.length != 0) {

	 if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(document.issueinfo.email.value))
	 {
	 alert("Please input the valid Email Address.");
	 return;
	 }
	}
 
    
	var useraddress=address;
	
	var usercity=city;
	var userstate=state;
	
//	var usersum=sum;
    var usersum=document.getElementById("sum").value;
//	var userdescript=descript;
    var userdescript=document.getElementById("descript").value;
 //	var name=username;
    var name=document.getElementById("username").value;
//	var useremail=email;
    var useremail=document.getElementById("email").value;
//    var imagefile=document.getElementById("upload_img").value;

	var lat;
	var lng;
	var latlng; 
	var address = document.getElementById("address").value;
	    var city = document.getElementById("city").value;
//	    var state = document.getElementById("state").value;
	var state = document.getElementById("state").options[window.document.getElementById("state").selectedIndex].text  
   	    var newaddress=address.concat(" ",city," ",state);
         geocoder.geocode( { 'address': newaddress}, function(results, status) {
         if (status == google.maps.GeocoderStatus.OK) {
           map.setCenter(results[0].geometry.location);
           var marker = new google.maps.Marker({
            map: map, 
            position: results[0].geometry.location
        });
           latlng = marker.getPosition();
           lat = latlng.lat();
           lng = latlng.lng();
    //   window.alert(imagefile);
             document.location="datasm.php?action=addData&useraddress=" + address + "&usercity=" + city + "&userstate=" + state + "&lat=" + lat + "&lng=" + lng + "&usersum=" + usersum + "&userdescript=" + userdescript + "&name=" + name + "&useremail=" + useremail;
       //    document.location="report.php?action=report&useraddress=" + address + "&usercity=" + city + "&userstate=" + state + "&lat=" + lat + "&lng=" + lng + "&usersum=" + usersum + "&userdescript=" + userdescript + "&name=" + name + "&useremail=" + useremail;
        } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }

 
</script>
</head>

<body onload="initialize()">
<div id="welcomeDiv" style="position: absolute; left: 200px; top: 0px; width: 750px; height: 150px; z-index: 1; vertical-align: middle" align="center"><p class="message">         
    <p>&nbsp; </p>
    <h2>Welcome to FM 88.5 WFDD's Map! </h2>
     <h2>&nbsp;</h2>
     <h2> Sharing news of Greensboro, High Point, Winston-Salem; North Carolina </h2>
  </div>
  
<div id="logoDiv" style="position: absolute; left: 1000px; top: 0px; width: 200px; height: 150px; z-index: 2; text-align: center; vertical-align: middle" align="center">  
<p>&nbsp;</p>
    <p><a href="http://localhost/WFDDMap/index.php"><img src="http://mapacadabra.s3.amazonaws.com:80/project_logos/mapacadabra1__logo_thumb.jpg" name="wfdd_logo" align="center" /></a></p>
</div>
<div id="apDiv3">
<!--  <form name="issueinfo" action="report.php" method="post" onsubmit="return codeAddress();">  -->
<form name="issueinfo" method="post">
  <h5 font-color="red">* are required fields.</h5>
  <table width="250" style=" border:1px solid black" >
  
    <tr class="header" >
      <td colspan="2" height="20">Street Address<span class="star">*</span></td>
    </tr>
    <tr>
      <td colspan="2" height="30">
         <input type="text" id="address" name="address" style="border-left:none; border-right:none; border-top:none"/>
      </td>
    </tr>
    <tr>
      <td class="header" height="20">City<span class="star">*</span></td>
      <td class="header" height="20">State<span class="star">*</span></td>
    </tr>
    <tr>
      <td height="30">
         <input type="text" id="city" name="city" style="border-left:none; border-right:none; border-top:none"/>
      </td>
      <td height="30">
      <!--   <input type="text" id="state" name="state" style="border-left:none; border-right:none; border-top:none"/>   -->
        <select name="state" size="1" id="state">
<option selected value="">State...</option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option>
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option>
<option value="PA">Pennsylvania</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option>
</select>
        
      </td>
    </tr>
    <tr class="header">
      <td colspan="2" height="20">Summary<span class="star">*</span></td>
    </tr>
    <tr>
      <td colspan="2" height="30">
         <input type="text" id="sum" name="sum" style="border-left:none; border-right:none; border-top:none"/>
      </td>
    </tr>
    <tr class="header">
      <td colspan="2" height="20">Description<span class="star">*</span></td>
    </tr>
    <tr>
      <td colspan="2">
         <textarea cols="35" rows="11" id="descript" name="descript" style="border-left:none; border-right:none; border-top:none">
         </textarea>
      </td>
    </tr>
    
    <tr>
      <td class="header" height="20">Your Name</td>
      <td class="header" height="20">Your Email</td>
    </tr>
    <tr>
    <td height="30">
         <input type="text" id="username" name="username" style="border-left:none; border-right:none; border-top:none"/>
      </td>
      <td height="30">
         <input type="text" id="email" name="email" style="border-left:none; border-right:none; border-top:none" />
      </td>
    </tr>
</table> 
<table width="250">  
   <tr>
     <td colspan="2" height="1">&nbsp;</td>
   </tr> 
    <tr>
       <td align="center">
     <!--   <input type="submit" name="submitbtn" value="submit"/>   -->
     <input type="button" name="btn" value="Submit" onclick="codeAddress(this.address,this.city,this.state)" /></td>
       <td align="center">
          <input type="reset" name="resetbtn" value="Reset" />
       </td>
    </tr>
  
  </table>
</form>
<!--  </form>   -->
</div>
<div id="mapDiv" style="width: 750px; height: 448px"></div>

<div id="infoDiv">
  <p align="center"><strong>88.5 WFDD ·</strong> Your NPR News &amp; Triad Arts Station from     Wake Forest University <strong> · </strong><a href="mailto:wfdd@wfu.edu">wfdd@wfu.edu</a><br />
  1834 Wake Forest Road #8850 <strong> · </strong>Winston-Salem, NC 27109 <strong> · </strong> 336-758-8850</p>
  <p style="font-size:x-small">&nbsp;</p>
  <p style="font-size:x-small">All content ©88.5 WFDD unless otherwise noted<br />
    <br />
    88.5 WFDD, the  NPR® news and Triad Arts station broadcasting from Wake Forest  University, is the only public radio station of its kind located in the  Piedmont Triad. It broadcasts news, information, and public affairs  programming covering the arts, people, and institutions in the area  from both its Winston-Salem and Greensboro studios.<br />
    <br />
    The state's  charter NPR® member, 88.5 WFDD is the longest continuously broadcasting  public radio station in North Carolina. It is a member of the North  Carolina Public Radio Association.<br />
    <br />
  <a href="http://wfdd.org/">Home</a> | <a href="http://wfdd.org/wfddnews/wfddnews.php">News</a> | <a href="http://wfdd.org/support.php">Support WFDD</a> | <a href="http://wfdd.org/listen.php">Listen</a> | <a href="http://wfdd.org/about/about.php">About</a> | <a href="http://wfdd.org/contact.php">Contact</a> | <a href="http://wfdd.org/calendar.php">10 &amp; 2 Calendar</a> | <a href="http://wfdd.org/programs/tauc.php">Triad Arts Up Close</a> | <a href="http://wfdd.org/programs/voices.php">Voices &amp; Viewpoints</a> | <a href="http://wfdd.org/programs/realpeople.php">Real People, Real Stories</a> | <a href="http://wfdd.org/programs/report.php">The Business Report</a> | <a href="http://wfdd.org/programs/sports.php">Sports Commentaries</a></p>
</div>

</body>
</html>
