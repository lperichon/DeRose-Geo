function loadCurrentPosition() {
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      document.getElementById('location_latitude').value = position.coords.latitude;
      document.getElementById('location_longitude').value = position.coords.longitude;
    }, function() {
      alert('We couldn\'t find your position.');
    });
  } else {
    alert('Your browser doesn\'t support geolocation.');
  }
}

function showCurrentPosition() {
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var myLatlng = new google.maps.LatLng(position.coords.latitude - 0.01, position.coords.longitude - 0.01)
      var myLatlng2 = new google.maps.LatLng(position.coords.latitude + 0.01, position.coords.longitude + 0.01)


      // Initialize the bounds container
      var bounds = new google.maps.LatLngBounds(myLatlng, myLatlng2);

      // Fit to bounds
      map.setZoom(16);
      map.fitBounds(bounds);
    }, function() {
      alert('We couldn\'t find your position.');
    });
  } else {
    alert('Your browser doesn\'t support geolocation.');
  }
}