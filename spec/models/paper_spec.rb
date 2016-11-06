require 'rails_helper'

RSpec.describe Paper, type: :model do

  it "should be invalid without last name" do
	@paper = build(:paper, title: nil)
	expect(@paper).to be_invalid
  end

end
