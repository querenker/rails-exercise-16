require 'rails_helper'

describe "Papers show page", :type => :feature do

  it "should show details of an paper" do
    paper = FactoryGirl.create(:paper)
    visit "/papers/#{paper.id}"
	expect(page).to have_text(paper.title)
	expect(page).to have_text(paper.venue)
	expect(page).to have_text(paper.year)
  end

  it "should show author of an paper" do
    paper = FactoryGirl.create(:paper)
    visit "/papers/#{paper.id}"
	paper.authors.each do |author|
		expect(page).to have_text(author.name)
    end
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

  it "should have for each paper listed a link to the detailed view of that paper" do
    paper = FactoryGirl.create(:paper)
    visit '/papers'
    expect(page).to have_link('Show')
  end

  it "should have for each paper listed a link to delete that paper" do
    paper = FactoryGirl.create(:paper)
    visit '/papers'
    expect(page).to have_link('Destroy')
  end

end

describe "Papers edit page", :type => :feature do

  it "should update the paper database entry" do
    paper = FactoryGirl.create(:paper)
	new_title = 'Hello World'
    visit "/papers/#{paper.id}/edit"
    fill_in 'Title', with: new_title
    click_button 'Edit Paper'
	visit "/papers/#{paper.id}"
	expect(page).to have_text{new_title}
	expect(Paper.where(title: new_title, venue: paper.venue)).to exist
  end

end
