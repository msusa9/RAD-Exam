// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require jquery-ui/widgets/sortable
//= require rails_sortable
//= require activestorage
//= require turbolinks
//= require_tree .


function tfHour(){
    var twelve = document.getElementsByClassName("twelve");
    var twentyfour = document.getElementsByClassName("twentyfour");

    for(var i=0; i<twelve.length; i++){
        if(twentyfour[i].style.display == "none"){
            twentyfour[i].style.display = "inline";
            twelve[i].style.display = "none";
        }
        else{
            twentyfour[i].style.display = "none";
            twelve[i].style.display = "inline"
        }
    }
}

function changeColour(colour){
    if(colour=='pink'){
        document.cookie = "colour=; expires= Thu, 01 Jan 1970 00:00:00 UTC;";
        document.cookie="colour=pink;";
        document.body.style.backgroundColor = 'pink';
        document.body.style.color = 'green';
    }
    else if(colour=='black'){
        document.cookie = "colour=; expires= Thu, 01 Jan 1970 00:00:00 UTC;";
        document.cookie="colour=black;";
        document.body.style.backgroundColor = 'black';
        document.body.style.color = 'white';
    }
    else{
        document.cookie = "colour=; expires= Thu, 01 Jan 1970 00:00:00 UTC;";
        document.cookie="colour=white;";
        document.body.style.backgroundColor = 'white';
        document.body.style.color = 'black';
    }
}
function keepColour(){
    var colour = getCookie("colour")
    if(colour=='pink'){
        document.body.style.backgroundColor = 'pink';
        document.body.style.color = 'green';
    }
    else if(colour=='black'){
        document.body.style.backgroundColor = 'black';
        document.body.style.color = 'white';
    }
    else{
        document.body.style.backgroundColor = 'white';
        document.body.style.color = 'black';
    }
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }

var ready;

ready = function(){
    $('#clocks_wrapper').sortable();
}

$(document).ready(ready);

$(document).on('page:load',ready);