require 'rails_helper'

RSpec.describe Paper, type: :model do

  it "should be invalid without last name" do
	@paper = build(:paper, title: nil)
	expect(@paper).to be_invalid
  end

  it "should be invalid without venue" do
	@paper = build(:paper, venue: nil)
	expect(@paper).to be_invalid
  end

  it "should be invalid without venue" do
	@paper = build(:paper, year: nil)
	expect(@paper).to be_invalid
  end

  it "should be invalid with non-integer year" do
	@paper = build(:paper, year: 'nineteen-fifty')
	expect(@paper).to be_invalid
  end

end
