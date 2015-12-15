require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

describe  "Users", :type => :feature do

  describe "Create new user" do

    it  "Create new user with correct data" do
      visit new_user_path
      fill_in 'user_email', :with => 'example@example.com'
      fill_in 'user_password', :with => '123123321321'
      fill_in 'user_password_confirmation', :with => '123123321321'
      click_button 'Зарегистрироваться'
      expect(page).to have_text 'Вы успешно зарегестрированы!'
    end
  end

  describe  "Login user" do

    it  "Login user with invalid data" do
      visit new_user_session_path
      fill_in 'email', :with => '123123321321'
      fill_in 'password', :with => '123123321321'
      click_button 'Login'
      expect(page).to have_content 'Вы не смогли зайти'
    end


    it "Login user with correct data" do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'email', :with => user.email
      fill_in 'password', :with => 'nix'
      click_button 'Login'
      expect(page).to have_content 'Успешно зашли'
    end
  end
  

end