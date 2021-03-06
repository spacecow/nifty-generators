Given /^I am logged in as "([^"]*)"$/ do |user|
  Given %(I go to the login page)
  And %(I fill in "Username" with "#{user}")
  And %(I fill in "Password" with "abc123")
  And %(I press "Log in")
end

Given /^I am logged in as #{capture_model}$/ do |mdl|
  Given %(I am logged in as "#{model(mdl).username}")
end

Given /^I am logged in as admin/ do
  Given %(a user exists with roles_mask: 2)
  And %(I am logged in as that user)
end
