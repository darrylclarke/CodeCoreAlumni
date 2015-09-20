// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

  $('.modaltest').on("click", "#skills", function(){
      $('#target').html("").append("values");
    });

  $('.modaltest').on("click", "#education", function(){
      $('#target').html("").append("other");
    });

  $('.modaltest').on("click", "#experiences", function(){
      $('#target').html("").append("diff");
    });

  $('.modaltest').on("click", "#projects", function(){
      $('#target').html("").append("works?");
    });

});
