require 'rails_helper'

describe "Papers show page", :type => :feature do

  it "should show details of an paper" do
    paper = FactoryGirl.create(:paper)
    visit "/papers/#{paper.id}"
	expect(page).to have_text(paper.title)
	expect(page).to have_text(paper.venue)
	expect(page).to have_text(paper.year)
  end

end


describe "Papers index page", :type => :feature do

  it "should show details of an paper" do
    paper = FactoryGirl.create(:paper)
    visit '/papers'
	expect(page).to have_text(paper.title)
	expect(page).to have_text(paper.venue)
	expect(page).to have_text(paper.year)
  end

end
