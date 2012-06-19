module OrdersHelper
  def order_recipient_full_address(order)
    content_tag :div, :class => "recipient-full-address" do
      html = content_tag :p, :class => "address" do
        order.recipient_address
      end 
      html + content_tag(:p, :class => "city-state-zip") do
        "#{order.recipient_city}, #{order.recipient_state} #{order.recipient_postal}"
      end
    end
  end
end