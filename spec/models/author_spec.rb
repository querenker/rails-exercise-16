require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should create an instance of author" do
    @author = build(:author)
    expect(@author).to_not be_nil
  end
end
