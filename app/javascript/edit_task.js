$(function(){
  $(".task-edit-btn").click(function(){
    $("#edit-task").fadeIn();
  });

  $(".close-btn").click(function(){
    $("#edit-task").fadeOut();
  });
});