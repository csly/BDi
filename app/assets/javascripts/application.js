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
//= require_tree .
//= require ckeditor/init




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


$(document).ready(function() {
    // Configure/customize these variables.
    var showChar = 1400;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = " Show More ";
    var lesstext = " Show Less ";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
             var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<div class="button-holderart"><a href="" class="morelink">' + moretext + '</a></div></span>';
 
            $(this).html(html);


           
        
        }
 
    });
  

    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
            $(".moreellipses").removeClass("nodots");

        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
            $(".moreellipses").addClass("nodots");
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();

        return false;
    });
});



$( ".main-nav li" ).hover(
  function() {
    $( this ).addClass( "active" );
  }, function() {
    $( this ).removeClass( "active" );
  }
); 



  