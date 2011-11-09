// https://github.com/jzaefferer/jquery-validation/blob/master/localization/messages_fr.js
jQuery.extend(jQuery.validator.messages, {
  required: "This field is required. Ce champ est requis.",
  email: "Please enter a valid email address. Veuillez entrer une adresse courriel valide."
});

jQuery(function ($) {
  function mce_localize(string) {
    if (string == 'Too many subscribe attempts for this email address. Please try again in about 5 minutes.') {
      return "Too many subscribe attempts for this email. Try again in 5 min.";
    }
    else if (string == 'Almost finished... We need to confirm your email address. To complete the subscription process, please click the link in the email we just sent you.') {
      return "Almost finished! Please click the link in the email we sent you to confirm your email address.";
    }
    // james@opennorth.ca is already subscribed to list Open North Newsletter. <a href="http://opennorth.us2.list-manage.com/subscribe/send-email?u=a602fac79ef3dc584bf1a2743&amp;id=49afb9ad21&amp;e=amFtZXNAb3Blbm5vcnRoLmNh">Click here to update your profile.</a>
    else if (string.match(/is already subscribed to list/)) {
      return string.replace('is already subscribed to list Open North Newsletter', 'is already subscribed to this list');
    }
  }

  $('#mc-embedded-subscribe-form').validate({
    errorClass: 'mce_inline_error',
    errorElement: 'div',
    errorPlacement: function (error, element) {
      error.appendTo('form');
    },
    onkeyup: function () {},
    onfocusout: function () {},
    onblur: function () {},
    invalidHandler: function () {
      $('#mce-success-response').add('#mce-error-response').hide();
    }
  });

  $('#mc-embedded-subscribe-form').ajaxForm({
    url: 'http://opennorth.us2.list-manage.com/subscribe/post-json?u=a602fac79ef3dc584bf1a2743&id=49afb9ad21&c=?',
    type: 'GET',
    dataType: 'json',
    contentType: 'application/json; charset=utf-8',
    success: function (resp) {
      $('#mce-success-response').add('#mce-error-response').hide();
      if (resp.result == 'success') {
        $('#mce-success-response').show().html(mce_localize(resp.msg));
        $('#mc-embedded-subscribe-form').get(0).reset();
      }
      else {
        var msg;
        try {
          var parts = resp.msg.split(' - ', 2);
          if (parts[1] == undefined || parseInt(parts[0]).toString() != parts[0]) {
            msg = resp.msg;
          }
          else {
            msg = parts[1];
          }
        }
        catch (e) {
          msg = resp.msg;
        }
        $('#mce-error-response').show().html(mce_localize(msg));
      }
    }
  });
});
