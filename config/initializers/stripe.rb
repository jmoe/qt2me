class Stripe
  if Rails.env.production?
    SECRET_KEY = 'Er2TK2jpkUlHUlbrEz9F3chWsSXkXXX7'
    PUBLISHABLE_KEY = 'pk_IjWWzmaZZlkx9IuWNMuy6Cp0AHdfs'
  else
    SECRET_KEY = '0AZDKsXnQowhbcwrSz3p7zckAR9zicrM'
    PUBLISHABLE_KEY = 'pk_V7y4CjCQrnh6J0LOd6fcTjuKjQ8Lp'
  end
end