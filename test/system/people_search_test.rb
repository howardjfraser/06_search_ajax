require 'application_system_test_case'

class PeopleSearchTest < ApplicationSystemTestCase
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
    find('#search').send_keys:return
  end
end
