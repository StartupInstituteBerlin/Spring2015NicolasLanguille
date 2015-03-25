$(document).ready(function () {
  $('.restourant_form').validate(
    {
      debug: true,
      rules: {
        restourant_name:         {required: true },
        restourant_description:  {required: true },
        restourant_phone:        {required: true },
        restourant_address:      {required: true }
      }
    });
});
