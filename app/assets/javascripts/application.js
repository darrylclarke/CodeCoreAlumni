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
  
  //INPUT: id
  //       destinationList is either "pending" or "active"
  var swapUserList = function(user_id) {
    //Find out what list the user is currently in.
    var userSelector = "#user_" + user_id;
    var listName = $(userSelector).parent().parent().attr("id");
    console.log(listName);
    var targetList;
    if (listName === "active-user-list") {
      targetList = "pending-user-list";
    } else {
      targetList = "active-user-list";
    };
    var htmlCode = $(userSelector).html();
    //Hide element from User list
    $(userSelector).hide();
    //Put a copy of this element into the other list
    //Also, modify it to update state
    setTimeout(function() {
      $(userSelector).remove();
      setTimeout(function(){
        //TIMER1 This will append the user htmlCode to the new list
        //Move it to the Target List
        console.log("TIMER1");
        console.log(userSelector);
        console.log(targetList);
        console.log(htmlCode);
        $("#" + targetList + " tbody").append(htmlCode);
        setTimeout(function(){
          //TIMER2 This will grab HTML tag data fields
          var currentActiveState = $(userSelector + " .user-actions .user-state-btn").data("active-state");
          var newActiveState;
          var newButtonLabel;
          console.log("TIMER2");
          console.log(userSelector);
          console.log(currentActiveState);
          //Edit the properties to display correctly
          if (currentActiveState === true) {
            //Set state to inactive, relabel to Activate
            newActiveState = false;
            newButtonLabel = "Activate";
          } else if (currentActiveState === false) {
            //Set state to active, relabel to Deactivate
            newActiveState = true;
            newButtonLabel = "Deactivate";
          } else {
            console.log("ERROR: Something odd happened");
          }; 
          console.log(currentActiveState);
          console.log(newActiveState);
          console.log(newButtonLabel);

          setTimeout(function() {
            console.log("TIMER3");
            console.log(userSelector);
            console.log(newActiveState);
            console.log(newButtonLabel);
            console.log($(userSelector + " .user-actions .user-state-btn").html(newButtonLabel));
            $(userSelector + " .user-actions .user-state-btn").data("active-state",newActiveState);
            $(userSelector + " .user-actions .user-state-btn").html(newButtonLabel);
          }.bind(userSelector,newActiveState,newButtonLabel),100);

        }.bind(userSelector), 100);
        
      }.bind(userSelector,targetList,htmlCode),100);
    }.bind(userSelector,targetList,htmlCode),100);//TIMER0    
  }
  $("#pending-user-list").on('click',"tbody tr td .user-state-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    current_activity_state = $(this).data("active-state");
    $.ajax({
      method: "PATCH",
      url: "/admin/" + target_id + ".json",
      data: {active_state: current_activity_state},
      success: function(response) { 
        swapUserList(response.id);
      }
    })
  });

  $("#active-user-list").on('click',"tbody tr td .user-state-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    current_activity_state = $(this).data("active-state");
    $.ajax({
      method: "PATCH",
      url: "/admin/" + target_id + ".json",
      data: {active_state: current_activity_state},
      success: function(response) { 
        swapUserList(response.id);
      }
    });
  });
  //-------------Delete Users---------------------------------------------
  var fadeOutUser = function(user_id){
    $("#user_" + user_id).fadeOut(1000)
  }

  $("#pending-user-list").on('click',"tbody tr td .user-delete-btn", function() {
    event.preventDefault();
    target_id = $(this).parent().parent().attr("id").split("_")[1];
    $.ajax({
      method: "DELETE",
      url: "/admin/" + target_id + ".json",
      success: function(response) { 
        fadeOutUser(response.id);
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
        fadeOutUser(response.id);
      }
    });
  });


  //==========================END admin=======================================
});
