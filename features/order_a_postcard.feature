Feature: Order a postcard

  In order to send a postcard to a physical address
  As a gift giver
  I want to submit the recipient's address and payment info
  
  Scenario: user orders a postcard
    Given I visit the new order page
    Then I should see the logo
    And I should see the message "blah"
    When I fill in the following:
      | order_sender_email      | foo@bar.com      |
      | order_sender_name       | Mary Smith       |
      | order_recipient_name    | Beth Chang       |
      | order_recipient_address | 123 Hamster Rd.  |
      | order_recipient_city    | San Francisco    |
      | order_recipient_state   | CA               |
      | order_recipient_postal  | 94110            |
      | credit_card             | 4242424242424242 |
      | cvc                     | 123              |
      | expiration_month        | 11               |
      | expiration_year         | 2012             |
    And I submit the form "Next"
    Then I should see the message "Check it out!"    
    And I should see the message "You : Mary Smith"
    And I should see the message "Your Email : foo@bar.com"
    And I should see the message "Your Friend : Beth Chang"
    And I should see the recipients full address
    And I should see the postcard image
    # When I submit the form "Looks good, send it!"
    # Then I should see the message "Thank you!"
