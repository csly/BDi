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





$( ".main-nav li" ).hover(
  function() {
    $( this ).addClass( "active" );
  }, function() {
    $( this ).removeClass( "active" );
  }
);
$(function(){ /* to make sure the script runs after page load */

  $('.item').each(function(event){ /* select all divs with the item class */
  
    var max_length = 1400; /* set the max content length before a read more link will be added */
    
    if($(this).html().length > max_length){ /* check for content length */
      
      var short_content   = $(this).html().substr(0,max_length); /* split the content in two parts */
      var long_content  = $(this).html().substr(max_length);
      
      $(this).html(short_content+
            
             '<span class="more_text" style="display:none;">'+long_content+'<br class="something"> <br class="something"> </span>'); /* Alter the html to allow the read more functionality */
             
      $(this).find('a.read_more').click(function(event){ /* find the a.read_more element within the new html and bind the following code to it */
 
        event.preventDefault(); /* prevent the a from changing the url */
        $(this).hide(); /* hide the read more button */
        $(this).parents('.item').find('.more_text').show(); /* show the .more_text span */
        $('.button-holderart').css('display', 'none'); 
        $('.center-content').css('display', 'none'); 
        $('br.something').css('display', 'none'); 
      });
      
    }
    
  });
 
 
});

