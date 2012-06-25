class Order < ActiveRecord::Base
  validates_presence_of :sender_email, :sender_name, :recipient_name, :recipient_address,
    :recipient_city, :recipient_state, :recipient_postal

  validates_email_format_of :sender_email, :message => "Is that an email address?"
  
  before_create :process_payment
  
  POSTCARD_PRICE = 300 # amount in cents
  
  def recipient_full_address
    "#{self.recipient_address}, #{self.recipient_city}, #{self.recipient_state} #{self.recipient_postal}"
  end

protected

  def process_payment
    if self.payment_token && self.amount_charged.nil?
      Stripe::Charge.create(
        :amount => self.amount_charged = POSTCARD_PRICE,
        :currency => "usd",
        :card => self.payment_token,
        :description => self.sender_email
      )
      
      OrderMailer.confirmation(self).deliver
      OrderMailer.notification(self).deliver
    end
  end
  
end