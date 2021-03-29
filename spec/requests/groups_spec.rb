require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { User.create(name: 'Foo Bar', email: 'foo@bar.com', password: '12345678') }
  scenario 'Create Category' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    click_on 'Categories'
    click_on 'New Category'
    fill_in 'group[name]', with: 'Test Payment'
    fill_in 'group[icon]', with: 'https://d25dk4h1q4vl9b.cloudfront.net/bundles/front/media/images/favicons/favicon-512.png'
    click_on 'Save Category'
    expect(page).to have_content('Test Payment')
  end

  scenario 'Category with invalid inputs' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log In'
    click_on 'Categories'
    click_on 'New Category'
    fill_in 'group[name]', with: ''
    fill_in 'group[icon]', with: 'https://d25dk4h1q4vl9b.cloudfront.net/bundles/front/media/images/favicons/favicon-512.png'
    click_on 'Save Category'
    expect(page).to have_content("Name can't be blank")
  end
end
