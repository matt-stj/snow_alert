require 'test_helper'

class UserCanBrowseAndSearchMountainsTest < ActionDispatch::IntegrationTest
  def setup
    states = ["CO", "CA", "WY"]
    3.times do |i|
      Mountain.create(name: "Mountain - #{i}", latitude: "90.#{i}", longitude: "10.#{i}", state: states[i])
    end
  end

  test "user can browse mountains by state" do
    mountain = Mountain.first

    visit mountains_path

    within(".browse") do
      assert page.has_content?("CO")
      assert page.has_content?("Mountain - 0")
      assert page.has_content?("CA")
      assert page.has_content?("Mountain - 1")
      assert page.has_content?("WY")
      assert page.has_content?("Mountain - 2")
    end

    click_link("Mountain - 0")

    assert_equal mountain_path(mountain), current_path
  end


    test "user can search mountains" do
      skip
      mountain = Mountain.first

      visit search_path

      within(".search-results") do
        assert page.has_content?("CO")
        assert page.has_content?("Mountain - 0")
        assert page.has_content?("CA")
        assert page.has_content?("Mountain - 1")
        assert page.has_content?("WY")
        assert page.has_content?("Mountain - 2")
        refute page.has_css?("hidden")
      end

       fill_in('search', :with => 'CO')


       within(".search-results") do
         assert page.has_content?("CO")
         assert page.has_content?("Mountain - 0")
         assert find_link("Mountain - 0").visible?
        #  refute find_link("Mountain - 1").visible?
       end

       click_link("Mountain - 0")

      assert_equal mountain_path(mountain), current_path
    end

end
