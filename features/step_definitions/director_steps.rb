Given /^the following movies exist:$/ do |table|
  table.hashes.each do |hash|
    Movie.create(hash)
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  page.should have_content(arg2)
end
