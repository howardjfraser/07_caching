require 'test_helper'
require 'capybara/poltergeist'

class PeopleFilterTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.current_driver = :poltergeist
  end

  test 'filter people' do
    visit '/people'
    page.has_content? 'David'
    page.has_content? 'Michael'
    filter 'zz'
    page.has_content? 'David'
    page.has_content? 'Michael'
    filter 'av'
    page.has_content? 'David'
    !(page.has_content? 'Michael')
  end

  private

  def filter(string)
    fill_in('filter', with: string)
    find('#filter').native.send_key(:Enter)
  end
end
