require_relative 'test_helper.rb'
require 'capybara/rspec'


feature "searching a term" do
  before do
    Capybara.current_driver = :selenium
    Capybara.app_host = 'http://www.google.com'
    Capybara.run_server = false
  end

  scenario "brings me to a results page" do
    #when I fill in the search bar with a term and hit Google Search, I expect to be taken to a results page
    Capybara.run_server = false
    visit '/'
    fill_in 'RNNXgb', with: 'Trunk Club'
    click_button 'Google Search'
    expect(page).to have_content 'results'
  end

  scenario "should lead me to relevant results" do
    #upon searching for something I expect the results page matches what I searched
    Capybara.run_server = false
    visit '/'
    fill_in 'RNNXgb', with: 'Trunk Club'
    click_button 'Google Search'
    expect(page).to have_content 'Trunk Club'
  end

end