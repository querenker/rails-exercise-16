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

  it "should display text input for homepage" do
    visit "/authors/new"
    expect(page).to have_field("Homepage")
  end

  it "should display button to submit form labeled with 'Create Author'" do
    visit "/authors/new"
    expect(page).to have_button("Create Author")
  end
end
