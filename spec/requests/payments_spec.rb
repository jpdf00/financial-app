require 'rails_helper'

RSpec.describe 'Create new Expense', type: :feature do
  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Create Expense' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    click_on 'All My Expenses'
    click_on 'Add Expense'
    fill_in 'payment[name]', with: 'Test Payment'
    fill_in 'payment[amount]', with: 123.45
    click_on 'Save Expense'
    expect(page).to have_content('Test Payment')
  end

  scenario 'Expenses with invalid inputs' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    click_on 'All My Expenses'
    click_on 'Add Expense'
    fill_in 'payment[name]', with: ''
    fill_in 'payment[amount]', with: '123,45'
    click_on 'Save Expense'
    expect(page).to have_content("Name can't be blank")
  end
end
