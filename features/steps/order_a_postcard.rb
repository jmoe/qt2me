Given 'I visit the new order page' do
  visit new_order_path
end

Then 'I should see the logo' do
  page.should have_content('Qt2Me')
end

And /I should see the message "(.*)"/ do |message|
  page.should have_content(message)
end
