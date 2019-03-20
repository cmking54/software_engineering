require 'rails_helper'

RSpec.describe "index page", type: :feature do
  let(:title_sort) {["abhorrent", "gorgeous", "lovely", "stinky"]}
  let(:price_sort) {["lovely", "abhorrent", "stinky", "gorgeous"]}
  let(:details_sort) {["stinky", "lovely", "gorgeous", "abhorrent"]}
  let(:distance_sort) {["abhorrent", "gorgeous", "stinky", "lovely"]}

  before :each do
    RentalProperty.create!(:title => "abhorrent", :price => 1.50, :maxpersons => 10, :lat => 7.698744, :lng => -0.593262)
    RentalProperty.create!(:title => "gorgeous", :price => 3.50, :maxpersons => 8, :lat => 6.434036, :lng => 16.501465)
    RentalProperty.create!(:title => "lovely", :price => 0.50, :maxpersons => 6, :lat => 51.692139, :lng => -3.317871)
    RentalProperty.create!(:title => "stinky", :price => 2.30, :maxpersons => 4, :lat => 35.807790, :lng => -5.559082)

    visit "/rental_properties"
  end

  it "should show the rental properties in title order by default" do
    names = []
    page.all(".title").each { |x| names << x.text }
    expect(names).to match_array(names.sort)
  end

  it "should show the rental properties in correct price order when sorting by price" do
    names = []
    click_link("Price per night")
    page.all(".title").each { |x| names << x.text }
    expect(names).to match_array(price_sort)
  end

  it "should show the rental properties maxpersons order when sorting by details" do
    names = []
    click_link("Details")
    page.all(".title").each { |x| names << x.text }
    expect(names).to match_array(details_sort)
  end

  it "should show the rental properties in correct order when sorting by distance" do
    names = []
    click_link("Distance from you")
    page.all(".title").each { |x| names << x.text }
    expect(names).to match_array(distance_sort)
  end
end
