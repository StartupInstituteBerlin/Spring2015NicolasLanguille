// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.validate
//= require jquery.validate.additional-methods

$(document).ready(function () {
  $(".simple_form").validate(

    {
      debug: true,
      rules: {
        //added this
        "restourant[name]": {required: true},
        "restourant[description]": {required: true },
        "restourant[phone]": {required: true },
        "restourant[address]": {required: true }
        "reservation[last_name]": {required: true},
        "reservation[no_people]": {required: true, min: 1, max: 10 },
        "reservation[phone]": {required: true },
        "reservation[address]": {required: true }

      }
  });

});
