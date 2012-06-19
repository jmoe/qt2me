class Order < ActiveRecord::Base
  validates_presence_of :sender_email, :sender_name, :recipient_name, :recipient_address,
    :recipient_city, :recipient_state, :recipient_postal

end