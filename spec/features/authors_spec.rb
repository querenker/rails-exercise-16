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

  it "should report that last name can't be blank" do
    author = FactoryGirl.create(:author)
	visit '/authors/new'
	fill_in 'First name', with: author.first_name
	fill_in 'Homepage', with: author.homepage
	click_button 'Create Author'
	expect(page).to have_text("Last name can't be blank")
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

end


describe "Authors index page", :type => :feature do

  it "should show details of an author" do
    author = FactoryGirl.create(:author)
    visit '/authors'
    expect(page).to have_text(author.name)
    expect(page).to have_text(author.homepage)
  end

  it "should have a link to the new author page" do
    visit '/authors'
	expect(page).to have_link('Add author')
  end

  it "should have for each author listed a link to the detailed view of that author" do
    author = FactoryGirl.create(:author)
    visit '/authors'
    expect(page).to have_link('Show')
  end

  it "should have for each author listed a link to the detailed view of that author" do
    author = FactoryGirl.create(:author)
    visit '/authors'
    expect(page).to have_link('Edit')
  end

end


describe "Authors edit page", :type => :feature do

  it "should update the author database entry" do
    author = FactoryGirl.create(:author)
	new_first_name = 'Alan Mathison'
    visit "/authors/#{author.id}/edit"
    fill_in 'First name', with: new_first_name
    click_button 'Edit Author'
	visit "/authors/#{author.id}"
	expect(page).to have_text{new_first_name}
	expect(Author.where(first_name: new_first_name, last_name: author.last_name)).to exist
  end

end
