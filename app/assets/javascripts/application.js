// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require ckeditor/init
//= require jquery
//= require fancybox
//= require jquery_ujs
//= require jquery-ui
//= require jquery-fileupload
//= require_tree .


jQuery(function() {
  $("a.fancybox").fancybox();
});

jQuery(function() {
  $("a.fancydiv").fancybox();
});

$(function() {
    $( "#workshop_start_date" ).datepicker({
	dateFormat: "dd/MM/yy",
	firstDay: 1
    });
});

function slideShow() {
    var s=0;
    max_slides = $('#image_container').data('slidecount');
    interval = 7000;
    setInterval( function(){
	pos =  (s++ % max_slides) + 1;
	nextpos =  (s % max_slides) + 1;
	console.log(pos+'   '+nextpos)
	$('#slide_'+pos).fadeOut(1000);
	$('#slide_'+nextpos).fadeIn(2000);
    }, interval);
}

$(document).ready(function(){
    slideShow();    
});
