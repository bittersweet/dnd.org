module HelperMethods
  # Put helper methods you need to be available in all tests here.
end

RSpec.configuration.include HelperMethods, :type => :acceptance

def admin_login
  @user = User.make!
  visit user_login

  fill_in 'user_email', :with => @user.email
  fill_in 'user_password', :with => @user.password
  click 'user_submit'

  page.should have_content("Signed in successfully.")
end
