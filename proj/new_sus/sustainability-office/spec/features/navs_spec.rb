require 'rails_helper'

RSpec.feature "Navs", type: :feature do
  scenario "User is on the homepage" do
    visit "/"
    if page.respond_to? :should
      page.should have_content("Welcome!")
    else
      assert page.has_content?("Welcome!")
    end
  end
end
