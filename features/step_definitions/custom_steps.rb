require 'selenium-cucumber'

# Do Not Remove This File
# Add your custom steps here
# $driver is instance of webdriver use this instance to write your custom code

Given(/^I open "(.*?)"$/) do |url|
    step %[I navigate to "#{url}"]
end

Given(/^I open homepage$/) do 
    step %[I navigate to "http://someaddress"]
end


#--------------------------------------------------------mOvOm--------

When(/^I login as (\w+)\/(\w+)$/) do |username,password|
    step %[I enter "#{username}" into input field having id "edit-name"]
    step %[I enter "#{password}" into input field having id "edit-pass"]
    step %[I click on element having id "edit-submit--2"]
    #step %[I wait for 5 sec]
end

When(/^I login as administrator$/) do
    step %[I login as admin/admin]
end

When(/^I login with invalid credentials$/) do
    step %[I login as invalid123/invalid123]
end


#--------------------------------------------------------mOvOm--------

When(/^I'm not logged in$/) do
	begin
    	logout = $driver.find_element(:"link" => "Log out" ) 
        logout.click() 
    rescue
    	#print "Log out link not found"
    end

    step %[link having text "Log out" should not be present]
end

Then(/^I should be logged in$/) do
    step %[link having text "Log out" should be present]
end

Then(/^I should NOT be logged in$/) do
    step %[link having text "Log out" should not be present]
end

#--------------------------------------------------------mOvOm--------

Then(/^I can\s*((?:not)?)\s+find partial text "([^"]*)"$/) do |present, partialtext|
	step %[element having css "body" should #{(present)?'':'not'} have partial text as "#{partialtext}"]
end
