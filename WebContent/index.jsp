<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <title>Restaurant Bucket List</title>
  <meta name="description" content="Free Bootstrap 4 Pingendo Flat template for restaurant and food">
  <meta name="keywords" content="Pingendo restaurant food flat free template bootstrap 4">
  <!-- CSS dependencies -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="flat.css" type="text/css">
  <!-- Script: Make my navbar transparent when the document is scrolled to top -->
  <script src="js/navbar-ontop.js"></script>
  <!-- Script: Animated entrance -->
  <script src="js/animate-in.js"></script>
</head>

<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-md bg-primary navbar-light fixed-top">
    <div class="container">
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar3SupportedContent" aria-controls="navbar3SupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-center" id="navbar3SupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item mx-2">
            <a class="nav-link" href="#About"><b>BucketList</b></a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="#menu">Discover</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link" href="#con">Contact Us</a>
          </li>
        </ul>
        <a class="btn navbar-btn btn-secondary mx-2" href="#top">Search</a>
      </div>
    </div>
  </nav>
  <!-- Cover -->
  <div class="align-items-center d-flex py-5 cover section-primary" id="top" style="background-image: url(&quot;assets/restaurant/cover_light.jpg&quot;);">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 align-self-center text-lg-left text-center">
          <h1 class="mb-0 mt-4 display-4">Restaurant</h1>
          <p class="mb-5">Fill Your Bucket List</p>
        </div>
        <div class="col-lg-5 p-3">
          <form class="p-4 section-light bg-light" method="get" action="#">
            <h4 class="mb-3 text-center">Find Restaurant</h4>
            <div class="form-group"> <label>Name</label>
              <input class="form-control" placeholder="Type here" id="rName"> </div>
            <button type="submit" class="btn mt-4 btn-block p-2 btn-secondary" onclick="findRestaurant()"><b>Search</b></button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row" id = "res_row">
        <div class="col-md-12">
          <h2 class="mb-4 text-primary text-center">Search Results</h2>
          <p class="m-0 text-center" id = "number"></p>
          <div class="row" id = "add">
          
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- JavaScript dependencies -->
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in the same page -->
  <script src="js/smooth-scroll.js"></script>
</body>

</html>
	<script>
        function findRestaurant() {
            var rName = document.getElementById("rName").value;
            var xhttp = new XMLHttpRequest();
            //var link = "https://developers.zomato.com/api/v2.1/search?entity_id=1&entity_type=city&q="+restName+"&start=0&count=10";
            var link = "https://developers.zomato.com/api/v2.1/search?apikey=893206031373df718f410e6d47e9f95f&q="+rName+"&start=0";
            //alert(link);
            
            xhttp.open("GET", link, true);
            //xhttp.setRequestHeader("user-key","893206031373df718f410e6d47e9f95f");
            xhttp.send();
            
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
                    var result = JSON.parse(this.responseText);
                    //var resObj = JSON.stringify(result);
                    //alert(resObj);
                    //var name = result.restaurants[0].restaurant.name;
                    //alert(name);
                    var numberOfResults = result.results_shown;
                    var names = [];
                    for(var i = 0;i<numberOfResults;i++)
                  	  {
                  	  	names.push(result.restaurants[i].restaurant.name);
                  	  	//alert(names[i]);
                  	  }
                    var locations = [];
                    for(var i = 0;i<numberOfResults;i++)
                  	  {
                  	  	locations.push(result.restaurants[i].restaurant.location.address);
                  	  	//alert(locations[i]);
                  	  }
                    
                    var id = [];
                    for(var i = 0;i<numberOfResults;i++)
                	  {
                	  	id.push(result.restaurants[i].restaurant.R.res_id);
                	  	//alert(id[i]);
                	  }
                    
                   /*
                    	for(var i = 0;i<10;i++)
                    	{
                    		document.getElementById("content").innerHTML =
                    	"NAME : "+names[i]+"<br>"+
                    "ADDRESS : "+locations[i]+"<br><hr>";
                    		}
                   
                   */
                   
                   document.getElementById("number").innerHTML = "Showing "+numberOfResults+" results";
                   
                   
                   for(i=0;i<numberOfResults;i++)
                	   {
                	   	  var htmlText = "";
                	      htmlText += '<div class="col-md-4 p-3">';
                	      htmlText += '<img class="img-fluid d-block w-100 mb-3" src="assets/restaurant/event_1_light.jpg">';
                	      htmlText += '<p class="lead text-muted mb-1" id = "res_id">ID : '+id[i]+'</p>';
                	      htmlText += '<h5 class="text-dark" id = "res_name">Name : '+names[i]+' </h5>';
                	      htmlText +=  '<p class="mb-3" id = "res_location">Location : '+locations[i]+'</p>';
                	      htmlText += '<b class=""><input type="submit" onclick="addFav(this) articleElement-obj=" '+data.results[i].title+ 'class="btn btn-outline-primary" value="Add to fav"></b>' ;
                	      //htmlText += '<a href="#" class="btn btn-outline-primary"><b class="">Add</b></a>';
                	      htmlText += '</div>';
                	      document.getElementById('add').insertAdjacentHTML('afterend',htmlText); 
                	   }
                   
                   //document.getElementById('add').insertAdjacentHTML('afterend',htmlText); 
                    
                   //document.getElementById("res_name").innerHTML = "Name : "+names[0]+"<br>"+"ID : "+id[0]+"<br>Location : "+locations[0];
                   //+ document.getElementById("rName").value;
              } 
              /*
              else{
                  alert("State:"+this.readyState);
                  alert("Status:"+this.status);
                  
              }
              */
            };
        }
        
        function addFav(){
            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.onreadystatechange = function(){
                if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                	
                }
    </script>     
  <!-- JavaScript dependencies -->
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Script: Smooth scrolling between anchors in the same page -->
  <script src="js/smooth-scroll.js"></script>   
</body>
</html>