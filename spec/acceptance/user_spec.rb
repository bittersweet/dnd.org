require File.dirname(__FILE__) + '/acceptance_helper'

feature "User", %q{
  In order to use the site
  As an user
  I want to register and login
} do

  scenario "register" do
    visit user_register
    fill_in 'user_email', :with => 'test@test.com'
    fill_in 'user_password', :with => 'testing'
    fill_in 'user_password_confirmation', :with => 'testing'
    click 'user_submit'

    current_path.should == homepage

    page.should have_content('You have signed up successfully.')
  end

  scenario "login" do
    @user = User.make!
    visit user_login
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => @user.password
    click 'user_submit'

    current_path.should == homepage

    page.should have_content('Signed in successfully.')
  end

  scenario "change password" do
    admin_login

    visit user_edit
    fill_in 'user_email', :with => @user.email
    fill_in 'user_password', :with => 'newpass'
    fill_in 'user_password_confirmation', :with => 'newpass'
    fill_in 'user_current_password', :with => @user.password
    click 'user_submit'

    current_path.should == homepage

    page.should have_content('You updated your account successfully.')
  end
end
