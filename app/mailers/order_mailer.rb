class OrderMailer < ActionMailer::Base
  include OrdersHelper
  
  default from: 'Tom Collier <tom@qt2.me>'
  
  def confirmation(order)
    @order = order
    mail(to: order.sender_email, subject: 'Thank you for ordering a Qt2.me postcard')
  end
  
  def notification(order)
    @order = order
    mail(to: 'founders@theminimumviable.com', subject: "New order [#{order.sender_email}]")
  end
end
