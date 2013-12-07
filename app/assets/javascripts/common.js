$(function() {
  $("a.non-redirect").click(function(event){
      event.preventDefault();
  });

  $('.edit_micropost_btn').click(function() {
    $(this).parent().hide();
    $(this).parent().next('.edit_micropost_wrap').show();
  });

  $('.update_micropost_btn').click(function() {
    $(this).parent().hide();
    $(this).parent().prev('.micropost-display').show();
  });

  $('.edit_comment_btn').click(function() {  
    $(this).parent().siblings('.comment-display').show();
    $(this).parent().hide();
    $(this).parent().siblings('.edit_comment_wrap').hide();
    $(this).parent().next('.edit_comment_wrap').show();
  });

  $('.update_comment_btn').click(function() {
    $(this).parent().hide();
    $(this).parent().prev('.comment-display').show();
  });
})