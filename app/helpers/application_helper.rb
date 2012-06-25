module ApplicationHelper
  def format_price(price_in_cents)
    if price_in_cents % 100 == 0
      "$#{price_in_cents / 100}"
    else
      "$#{"%.2f" % (price_in_cents.to_f / 100.0)}"
    end
  end
end
