Given 'I visit the new order page' do
  visit new_order_path
end

Then 'I should see the logo' do
  page.should have_selector("#logo")
end

And /I should see the message "(.*)"/ do |message|
  page.should have_content(message)
end

Then /^I should see a confirmation page with the following:$/ do |table|
  # table is a Cucumber::Ast::Table  
  table.each_cells_row do |row|
    page.should have_content(row[1])
  end
end

Then /^I should see the recipients full address$/ do
  page.should have_content("Your Friend's Address :")
  page.should have_content("123 Hamster Rd.")
  page.should have_content("San Francisco, CA 94110")
end

Then /^I should see the postcard image$/ do
  page.should have_selector("img#postcard-image")
end
