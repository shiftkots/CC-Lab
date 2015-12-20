// var autocomplete = new google.maps.places.Autocomplete($(".searchCity")[0], {});

//             google.maps.event.addListener(autocomplete, 'place_changed', function() {
//                 var place = autocomplete.getPlace();
//                 console.log(place.address_components);
//             });

var city='New York';
var country='New York';
var APIKey='6f206707a93aceba';
var saveTask = function(){
	var taskInput = document.getElementById('submit');
	var newTask = taskInput.value;
	taskArray.push(newTask);
	taskInput.value = "";
}
//loadWeather
var loadWeather = function(response){
	console.log("loadWeather is running");

	if(response.response.error){
		alert(response.response.error.description);
		return;
	}

	var thisCity = response.current_observation.display_location.city;
	var temp = response.current_observation.temp_f;
	var weather = response.current_observation.weather;
	var humi = response.current_observation.icon;

	$('.temperature').text(temp);
	$('.weather').text(weather);
	$('.searchCity').val(thisCity);
	if(humi == "rain"){
		$('.cloud3').html('<img src="images/cloud-03.png" width="800">');
		$('.sun').html('<img src="images/empty-03.png" width="60">');
		$('.cloud2').html('<img src="images/empty-03.png" width="60">');
		$('.cloud1').html('<img src="images/empty-03.png" width="60">');
	}else if(humi == "clear"){
		$('.sun').html('<img src="images/empty-03.png" width="60">');
		$('.cloud1').html('<img src="images/empty-03.png" width="60">');
		$('.cloud2').html('<img src="images/empty-03.png" width="60">');
		$('.cloud3').html('<img src="images/empty-03.png" width="60">');
	}else if(humi == "cloudy"){
		$('.cloud1').html('<img src="images/cloud-01.png" width="600">');
		$('.sun').html('<img src="images/empty-03.png" width="60">');
		$('.cloud2').html('<img src="images/empty-03.png" width="60">');
		$('.cloud3').html('<img src="images/empty-03.png" width="60">');
	}else if(humi != "cloudy" && humi != "clear" && humi != "rain"){
		$('.cloud2').html('<img src="images/cloud-02.png" width="1300">');
		$('.sun').html('<img src="images/empty-03.png" width="60">');
		$('.cloud1').html('<img src="images/empty-03.png" width="60">');
		$('.cloud3').html('<img src="images/empty-03.png" width="60">');
	}
	if(temp >= 65 && temp <= 80){
		$('.city').html('<img src="images/City.gif" width="1000">');
	}else if(temp < 65){
		$('.city').html('<img src="images/City2.gif" width="1000">');
	}else{
		$('.city').html('<img src="images/City.gif" width="1000">');
	}
};

//getWeather function
var getWeather = function(){
    var weatherAPI = 'http://api.wunderground.com/api/'+ APIKey + '/conditions/q/' + country + '/' + city + '.json';

    $.ajax({
        url : weatherAPI,
        dataType : 'jsonp',
        success : function(response){
            loadWeather(response);
        }
    });
};


//setLocation function
var setLocation = function(){
    var locationArray = [];
    locationArray = $('.searchCity').val().split(", ");

    if (locationArray == undefined ) {
    	console.log("bad");
    } else {
    	console.log("good");
    }

    city = locationArray[0];
    country = locationArray[1];

    if(city == null || city == ''){
        alert('Please type in a City, State/Country.');
    };

    $('.searchCity').val(city + ', ' + country);

    getWeather();
};

// $(function() {
//     $.getJSON("https://api.ipify.org?format=jsonp&callback=?",
//       function(json) {
//         document.write("My public IP address is: ", json.ip);
//       }
//     );
//   });

/*
	var getLocation = function(){
		var currentLocation = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + lng + '&key=AIzaSyAC0lGcREbUyRpe07JSNYWa8JACZUt3qTU'

			$.ajax({
				url: currentLocation,
				datatype : 'jsonp',
				success : function(response){
					setLocation(response);
			}
		});

		console.log('get location is running');
	};

*/
// //get currentLocation

// //get lat & lng
// var getlatlng = function(){
//   var output = document.getElementById("out");

//   if (!navigator.geolocation){
//     output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
//     return;
//   }

//   function success(position) {
//     var lat  = position.coords.latitude;
//     var lng = position.coords.longitude;
//     console.log("lat: "+ lat + ", lng: "+ lng);
//     getLocation();
// };

var autoFillTags = function(){
    var availableTags = [
        "Bangkok, Thailand",
        "Boston, Massachusetts",
        "Chicago, Illinois",
        "Las Vegas, Nevada",
        "Los Angeles, California",
        "Miami, Florida",
        "Montreal, Canada",
        "New York, New York",
        "San Francisco, California",
        "Seattle, Washington",
        "Toronto, Canada",
        "Vancouver, Canada",
        "Washington, D.C."
    ];
    $( ".searchCity" ).autocomplete({
        source: availableTags,
        position: { my: "left bottom", at: "left top", collision: "flip" }
    });
};

//init

var init = function(){
	console.log("running");
	$('#submit').click(function(e){
		e.preventDefault();
		setLocation();
	});
	
};

//document ready weith init
$(document).ready(function(){
	init();
	autoFillTags();
	getWeather();
});