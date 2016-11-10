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

  it "should filter the papers listed by year" do
     paper = FactoryGirl.create(:paper)
	 new_paper = FactoryGirl.create(:new_paper)
	 visit papers_path(year: 1950)
	 expect(page).to have_text(paper.title)
	 expect(page).not_to have_text(new_paper.title)
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
  
  it "should allow to select 5 authors from 5 seperate drop downs" do
    paper = FactoryGirl.create(:paper)
	visit "/papers/#{paper.id}/edit"
	(1..5).each do |i|
		expect(page).to have_select("paper_author_id_#{i}")
    end
  end

  it "should pre-select the actual author in the top down" do
    paper = FactoryGirl.create(:paper)
	visit "papers/#{paper.id}/edit"
	expect(page).to have_select('paper_author_id_1', selected: paper.authors.first.name)
  end

  it "should save author changes" do
    paper = FactoryGirl.create(:paper)
	new_author = FactoryGirl.create(:new_author)
	visit "papers/#{paper.id}/edit"
	select new_author.name, from: 'paper_author_id_1'
	click_button 'Edit Paper'
	expect(Paper.find(paper.id).authors).to include(new_author)
  end

end
