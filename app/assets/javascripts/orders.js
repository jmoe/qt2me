(function(window, document, undefined) {

  var stripeResponseHandler = function(status, response) {
    if (response.error) {
      // show the errors on the form
      $('.form-errors').text('One or more errors prevent us from processing your order. Please update the form below and try again');
      $(".payment-errors").text(response.error.message);
      $(".submit-button").removeAttr("disabled");
    } else {
      var form$ = $("#new_order");
      // token contains id, last4, and card type
      var token = response['id'];
      // insert the token into the form so it gets submitted to the server
      form$.append("<input type='hidden' name='order[payment_token]' value='" + token + "'/>");
      form$.append("<input type='hidden' name='last4' value='" + response.card.last4 + "'/>");
      // and submit
      form$.get(0).submit();
    }
  };
  
  $(document).ready(function() {
    $('#order-form').find("#new_order").submit(function(event) {
      // disable the submit button to prevent repeated clicks
      $('.submit-button').attr("disabled", "disabled");
      $('.error-message').text('');
      
      $.ajax({
        type: 'get',
        url: '/orders/validate',
        data: $(this).serialize(),
        success: function(data) {
          var field;
          if (data.valid) {
            Stripe.createToken({
                number: $('.card-number').val(),
                cvc: $('.card-cvc').val(),
                exp_month: $('.card-expiry-month').val(),
                exp_year: $('.card-expiry-year').val()
            }, stripeResponseHandler);
          } else {
            $('.form-errors').text('One or more errors prevent us from processing your order. Please update the form below and try again');
            for (field in data.errors) {
              if (data.errors.hasOwnProperty(field)) {
                $('.' + field + '-errors').text(data.errors[field].join(', '));
              }
            }

            $(".submit-button").removeAttr("disabled");
          }
        },
        error: function(data) {
          $('.form-errors').text('An unknown error occurred, please try again later');
          $(".submit-button").removeAttr("disabled");
        }
      })

      // prevent the form from submitting with the default action
      return false;
    });
  });
  
})(this, this.document);
