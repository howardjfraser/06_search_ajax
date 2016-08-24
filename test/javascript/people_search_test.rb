require 'test_helper'
require 'capybara/poltergeist'

class PeopleSearchTest < ActionDispatch::IntegrationTest
  # TODO: does this need to be :poltergeist?
  def setup
    Capybara.current_driver = :poltergeist
  end

  test 'search people' do
    visit '/people'
    assert page.has_content? 'David'
    assert page.has_content? 'Michael'
    search_for 'zz'
    assert page.has_no_content? 'David'
    assert page.has_no_content? 'Michael'
    search_for 'av'
    assert page.has_content? 'David'
    assert page.has_no_content? 'Michael'
  end

  private

  def search_for(string)
    fill_in('search', with: string)
    find('#search').native.send_key(:Enter)
  end
end
