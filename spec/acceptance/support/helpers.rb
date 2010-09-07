module HelperMethods
  # Put helper methods you need to be available in all tests here.
end

RSpec.configuration.include HelperMethods, :type => :acceptance

def admin_login
  User.create(:email => 'test@test.com', :password => 'testing')
  visit user_login

  fill_in 'user_email', :with => 'test@test.com'
  fill_in 'user_password', :with => 'testing'
  click 'user_submit'

  page.should have_content("Signed in successfully.")
end
