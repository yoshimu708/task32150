$(function(){
  $("#task-create-btn").click(function(){
    $("#new-task-create").fadeIn();
  });

  $(".close-btn").click(function(){
    $("#task-create-btn").fadeOut();
    $("#new-task-create").fadeOut();
  });
});

