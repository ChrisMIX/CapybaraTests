require_relative 'test_helper.rb'
require 'capybara/rspec'


feature "searching a term" do
  before do
    Capybara.app = true
    Capybara.app_host = 'http://www.google.com'
    Capybara.run_server = false
  end

  scenario "brings me to a results page" do
    Capybara.run_server = false
    visit 'http://google.com'
    fill_in 'RNNXgb', with: 'Trunk Club'
    click_button 'Google Search'
    expect(page).to have_content 'results'
  end

  scenario "should lead me to relevant results" do
    Capybara.run_server = false
    visit 'http://google.com'
    fill_in 'RNNXgb', with: 'Trunk Club'
    click_button 'Google Search'
    expect(page).to have_content "Trunk Club"
  end

end