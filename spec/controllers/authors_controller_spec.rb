require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      author = FactoryGirl.create(:author)
      get :show, id: author.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http sucess" do
      author = FactoryGirl.create(:author)
      get :edit, id: author.id
	  expect(response).to have_http_status(:success)
    end
  end

end
