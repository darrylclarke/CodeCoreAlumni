// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require admin
//= require_tree .

$(document).ready(function() {
  //For Experiences
  $(".experience-form").on('click',"div #exp-present-day-checkbox", function() {
    var value = $(this).is(":checked");
    $(".experience-end-date").attr("disabled",value);
  });
 
  //==========================admin=======================================
  //-------------Active Users---------------------------------------------
  $("#pending-user-list").on('click',"tbody tr td .user-state-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    current_activity_state = $(this).data("active-state");
    //console.log(target_id);
    //console.log(current_activity_state);
    $.ajax({
      method: "PATCH",
      url: "/admin/" + target_id + ".json",
      data: {active_state: current_activity_state},
      success: function(response) { 
        alert("We changed the status! result is " + response.result); 
      }
    })
  });

  $("#active-user-list").on('click',"tbody tr td .user-state-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    current_activity_state = $(this).data("active-state");
    //console.log(target_id);
    //console.log(current_activity_state);
    $.ajax({
      method: "PATCH",
      url: "/admin/" + target_id + ".json",
      data: {active_state: current_activity_state},
      success: function(response) { 
        console.log(response); 
        alert("We changed the status! result is " + response.result); 
      }
    });
  });
  //-------------Delete Users---------------------------------------------
  $("#pending-user-list").on('click',"tbody tr td .user-delete-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    $.ajax({
      method: "DELETE",
      url: "/admin/" + target_id + ".json",
      success: function(response) { 
        console.log(response); 
        alert("We changed the status! result is " + response.result); 
      }
    });
  });
  $("#active-user-list").on('click',"tbody tr td .user-delete-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    $.ajax({
      method: "DELETE",
      url: "/admin/" + target_id + ".json",
      success: function(response) { 
        console.log(response); 
        alert("We changed the status! result is " + response.result); 
      }
    });
  });


  //==========================END admin=======================================
});
