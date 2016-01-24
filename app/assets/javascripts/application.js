// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
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
//= require turbolinks
//= require typed
//= require_tree .


var ready;
ready = function() {

  $(function(){
    $("#situation").typed({
      strings: ["I encounter a problem", "I perform a task", "situation"],
      typeSpeed: 10,
      startDelay: 3000,
      backSpeed: 10,
      backDelay: 8000,
      loop: false,
      showCursor: false
    });
  });

  $(function(){
    $("#motivation").typed({
      strings: ["help right away", "do the job right", "motivation"],
      typeSpeed: 10,
      startDelay: 5000,
      backSpeed: 10,
      backDelay: 10000,
      loop: false,
      showCursor: false
    });
  });

  $(function(){
    $("#outcome").typed({
      strings: ["finish what I started", "complete my tasks", "expected outcome"],
      typeSpeed: 10,
      startDelay: 7000,
      backSpeed: 10,
      backDelay: 12000,
      loop: false,
      showCursor: false
    });
  });


  function resizeInput() {
    var size = $(this).val().length;
    $(this).attr('size', size);
  }

  $('.form-story').keyup(resizeInput).each(resizeInput);

  $('.new_situation').attr('size', 7);
  $('.new_action').attr('size', 5);
  $('.new_outcome').attr('size', 16);

  $('.feature-section').on('click', function(){
    var wrapper = $(this).parent('.feature-section-wrapper')
    var open = wrapper.find(".collapse").hasClass('in')

    if (open) {
      console.log("Closed")
      wrapper.find('.feature-section-caret').addClass('r180')
    } 
    else {
      console.log("Open") 
      $(this).find('.feature-section-caret').removeClass('r180')
    }


  })
  
};

$(document).ready(ready);
$(document).on('page:load', ready);
