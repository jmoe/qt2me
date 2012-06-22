class Order < ActiveRecord::Base
  validates_presence_of :sender_email, :sender_name, :recipient_name, :recipient_address,
    :recipient_city, :recipient_state, :recipient_postal

  validates_email_format_of :sender_email, :message => "Is that an email address?"
  
  before_create :process_payment
  
  POSTCARD_PRICE = 200 # amount in cents
  
protected

  def process_payment
    if self.payment_token && self.amount_charged.nil?
      charge = Stripe::Charge.create(
        :amount => self.amount_charged = POSTCARD_PRICE,
        :currency => "usd",
        :card => self.payment_token,
        :description => self.sender_email
      )
    end
  end
  
end