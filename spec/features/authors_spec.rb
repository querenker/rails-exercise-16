require 'rails_helper'

describe "Authors new page", :type => :feature do
  
  it "should display text input for first name" do
    visit "/authors/new"
    expect(page).to have_field("First name")
  end

  it "should display text input for last name" do
    visit "/authors/new"
    expect(page).to have_field("Last name")
  end

end
