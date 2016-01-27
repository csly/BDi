// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets 
//= require moment
//= require bootstrap-datetimepicker
//= require audiojs
//= require jquery.jcrop  

//= require ckeditor/init
     $(window).scroll(function() {
      if ($(document).scrollTop() > 27) {
        $('.navbar').addClass('shrink');
        
      }
      else {
        $('.navbar').removeClass('shrink');
        
      }
      });

      /* affix the navbar after scroll below header */
 

  



 jQuery(function ($) {

    var filter;
    $('.filter').click(function () {

       
    $(this).addClass("fcurrent").siblings().removeClass("fcurrent");
       
        if (filter == this.id) {
            $('tr').show()
            filter = undefined;
        } else {
            $('tr:not(.' + this.id + ')').hide();
            $('tr.' + this.id).show(); 
            filter = this.id;
        }

    });

});






 

$(document).ready(function(){
  $( ".nav li a" ).hover(
    function() {
      $( this ).addClass( "active" );
    }, function() {
      $( this ).removeClass( "active" );
    }
  );

  var filter;
  $('.filter').click(function () {   
  $(this).addClass("fcurrent").siblings().removeClass("fcurrent");   
    if (filter == this.id) {
      $('tr').show()
      filter = undefined;
    } else {
        $('tr:not(.' + this.id + ')').hide();
        $('tr.' + this.id).show(); 
        filter = this.id;
    }

  });
});



