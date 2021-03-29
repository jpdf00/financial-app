require 'rails_helper'

RSpec.describe 'Siggin Up', type: :feature do
  scenario 'Sign up with valid inputs' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'Foo Bar'
    fill_in 'user[email]', with: 'foo@bar.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_on 'Create Account'
    expect(page).to have_content('Foo Bar')
  end

  scenario 'Sign up with invalid inputs' do
    visit new_user_registration_path
    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: 'foo@bar.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_on 'Create Account'
    expect(page).to have_content("Name can't be blank")
  end
end

RSpec.describe 'Sign In', type: :feature do
  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    expect(page).to have_content('Foo Bar')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    expect(page).to have_content('Invalid Email or password.')
  end
end

RSpec.describe 'Loggin Out', type: :feature do
  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Log Out' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    click_on 'Log Out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
