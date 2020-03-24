require 'rails_helper'
require 'capybara/rspec'

Capybara.default_max_wait_time = 60
# Capybara.run_server = false

describe '/users', driver: ENV.fetch('FEATURES_DRIVER', 'selenium_headless').to_sym, js: true do
  it 'shows list of users' do
    create(:user, f_name: 'John', l_name: 'Doe')
    create(:user, f_name: 'Jane', l_name: 'Doe')

    visit '/users'

    expect(page).to have_content 'Page: All Users'
    expect(page).to have_content 'John Doe'
    expect(page).to have_content 'Jane Doe'
    expect(all('ul li').size).to eq 2
  end
end
