require 'capybara/rspec'

SPEC_WP_HOST = ENV.fetch('SPEC_WP_HOST', 'http://app.local:80')
SPEC_DRIVER  = ENV.fetch('SPEC_DRIVER', 'selenium')

describe '', type: :feature, driver: SPEC_DRIVER.to_sym do
  it 'has correct blog title' do
    visit SPEC_WP_HOST

    expect(page).to have_content 'Yet another Wordpres Blog'
  end

  it 'logs in with valid credentials' do
    visit "#{SPEC_WP_HOST}/wp-admin/"

    fill_in 'Username or Email Address', with: 'admin'
    fill_in 'Password', with: 'admin'

    click_button 'Log In'

    expect(page).to have_content 'Dashboard'
  end
end
