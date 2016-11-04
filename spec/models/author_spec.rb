require 'rails_helper'

RSpec.describe Author, type: :model do

  it "should create an instance of author" do
    @author = build(:author)
    expect(@author).to_not be_nil
  end

  it "should return the full name of an author" do
    @author = build(:author)
	expect(@author.name).to eq("Alan Turing")
  end

  it "should not be invalid without last name" do
	@author = build(:author, last_name: nil)
	expect(@author).to be_invalid
  end

end
