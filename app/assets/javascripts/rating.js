$(document).ready(function(){
  $('.rate_it_btn').click(function(e){
    e.preventDefault();
    url = $(this).attr('href');
    $.ajax({
      type: "GET",
      url: url,
      success: function(data){
         $(".ratings").html(data);

      }
    });
  });
});
