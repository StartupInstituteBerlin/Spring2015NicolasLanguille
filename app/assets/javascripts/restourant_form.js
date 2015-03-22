$(document).ready(function () {
  $(".simple_form").validate(
    {
      debug: true,
      rules: {
        "restourant[name]":         {required: true },
        "restourant[description]":  {required: true },
        "restourant[phone]":        {required: true },
        "restourant[address]":      {required: true }
      }
    });
  });
