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
//= require autocomplete-rails
//= require jquery-fileupload
//= require bootstrap
//= require_tree .


jQuery(function() {
  $("a.fancybox").fancybox();
});

$(document).ready(function() {
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
    var max_slides = $('#image_container').data('slidecount');
    var interval = 7000;
    setInterval( function(){
	var pos =  (s++ % max_slides) + 1;
	var nextpos =  (s % max_slides) + 1;
	console.log(pos+'   '+nextpos)
	$('#slide_'+pos).fadeOut(800);
	$('#slide_'+nextpos).fadeIn(3000);
    }, interval);
}

function showLargePhoto() {
    $('#large-photo').slideToggle();
    if ($('#hider').text() == 'show large') {
	$('#hider').text('hide large');
    } else {
	$('#hider').text('show large');
    }
}


$(document).ready(function(){
    slideShow();


    $('.tag-li-div').mouseenter(function(){
	var el = $(this).find('span')[1];
	$(el).show();
    });

    $('.tag-li-div').mouseleave(function(){
	var el = $(this).find('span')[1];
	$(el).hide();
    });

});
