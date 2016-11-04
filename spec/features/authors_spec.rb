require 'rails_helper'

describe "Authors new page", :type => :feature do
  
  it "should display text input for first name" do
    visit '/authors/new'
    expect(page).to have_field('First name')
  end

  it "should display text input for last name" do
    visit '/authors/new'
    expect(page).to have_field('Last name')
  end

  it "should display text input for homepage" do
    visit '/authors/new'
    expect(page).to have_field('Homepage')
  end

  it "should display button to submit form labeled with 'Create Author'" do
    visit '/authors/new'
    expect(page).to have_button('Create Author')
  end

  it "should exist a database entry for a author which was submitted via the new author form" do
    author = FactoryGirl.create(:author)
    visit '/authors/new'
	fill_in 'First name', with: author.first_name
	fill_in 'Last name', with: author.last_name
	fill_in 'Homepage', with: author.homepage
	click_button 'Create Author'
	expect(Author.where(first_name: author.first_name, last_name: author.last_name)).to exist
  end

end

describe "Authors show page", :type => :feature do

  it "should show details of an author" do
    author = FactoryGirl.create(:author)
    visit "/authors/#{author.id}"
    expect(page).to have_text(author.first_name)
    expect(page).to have_text(author.last_name)
    expect(page).to have_text(author.homepage)
  end

  it "should show details of an author" do
    author = FactoryGirl.create(:author)
    visit '/authors'
    expect(page).to have_text(author.name)
    expect(page).to have_text(author.homepage)
  end

end
