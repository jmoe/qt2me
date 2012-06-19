require 'factory_girl'

FactoryGirl.define do
  factory :order do
    sender_name 'Tom Collier'
    sender_email 'tom@awe.sm'
    recipient_name 'Jereme Monteau'
    recipient_address '153 Townsend'
    recipient_city 'San Francisco'
    recipient_state 'CA'
    recipient_postal '94107'
  end
end