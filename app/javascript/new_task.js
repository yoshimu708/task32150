document.addEventListener("turbolinks:load", function() {
$(function(){
  $("#task-create-btn").click(function(){
    $("#new-task-create").fadeIn();
  });

  $(".close-btn").click(function(){
    $("#new-task-create").fadeOut();
  });
});
})
