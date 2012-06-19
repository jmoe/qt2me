Feature: Order a postcard

  In order to send a postcard to a physical address
  As a gift giver
  I want to submit the recipient's address and payment info
  
  Scenario: user orders a postcard
    Given I visit the new order page
    Then I should see the logo
    And I should see the message "blah"
    When I fill in the following:
      | order_sender_email      | foo@bar.com     |
      | order_sender_name       | Mary Smith      |
      | order_recipient_name    | Beth Chang      |
      | order_recipient_address | 123 Hamster Rd. |
      | order_recipient_city    | San Francisco   |
      | order_recipient_state   | CA              |
      | order_recipient_postal  | 94110           |
    And I submit the form "Submit Order"
    Then I should see the message "Thank you!"