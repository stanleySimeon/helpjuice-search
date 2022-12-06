require 'rails_helper'

RSpec.describe 'User', type: :system do
  before(:each) do
    driven_by(:rack_test)
    @user = User.create(email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
    @user.save
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'can login' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
    end
    find_button('Log In').click
    expect(page).to have_content('Signed in successfully.')
  end
end
