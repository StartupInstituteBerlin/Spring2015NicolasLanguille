$(document).ready(function(){
  $(".reserv_form").validate(
    {
      debug: false,
      success: "valid",
      rules: {
        reservation_last_name: {required: true },
        reservation_no_people: {required: true,
                                number:   true},
        reservation_email:     {required: true,
                                email:    true },
        reservation_datetime:  {required: true }
      }
    });
});
