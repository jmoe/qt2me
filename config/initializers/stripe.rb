require 'stripe'

module Stripe
  def self.publishable_key=(key)
    @@publishable_key = key
  end

  def self.publishable_key
    @@publishable_key
  end
end

Stripe.api_key = if Rails.env.production?
  'Er2TK2jpkUlHUlbrEz9F3chWsSXkXXX7'
else
  '0AZDKsXnQowhbcwrSz3p7zckAR9zicrM'
end

Stripe.publishable_key = if Rails.env.production?
  'pk_IjWWzmaZZlkx9IuWNMuy6Cp0AHdfs'
else
  'pk_V7y4CjCQrnh6J0LOd6fcTjuKjQ8Lp'
end
