$(document).ready(function () {
  $('.reserv_form').validate(
    {
      debug: true,
      rules: {
        reservation_last_name: {required: true },
        reservation_no_people: {required: true },
        reservation_email:     {required: true },
        reservation_datetime:  {required: true }
      }
    });
});
