When /^I fill in the following:$/ do |table|
  table.each_cells_row do |row|
    fill_in row[0].value, :with => row[1].value
  end
end

When /^I submit the form "(.*?)"$/ do |button|
  click_button button
end

