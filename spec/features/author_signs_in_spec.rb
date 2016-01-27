require 'rails_helper'

feature 'Author signs in' do
  scenario 'with valid credentials' do
    create(:author)

    visit '/login'
    fill_in 'Email', with: 'name@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid credentials' do
    visit '/login'
    fill_in 'Email', with: 'invalid@domain.com'
    fill_in 'Password', with: 'invalid'
    click_on 'Login'

    expect(page).to have_content('Author Login')
  end
end
