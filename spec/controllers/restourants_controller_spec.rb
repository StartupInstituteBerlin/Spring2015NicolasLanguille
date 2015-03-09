require 'rails_helper'

RSpec.describe RestourantsController, type: :controller do




  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns each Restaurant’s Show path"
    it "returns the New Restaurant path"

  end

  describe "#show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "returns the Restaurant’s Edit path"
    it "returns the Restaurant’s Destroy path"

  end

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "display a form for creating a new Restaurant"

  end

  describe "#edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "should create a Restaurant"
    it "redirect to the Show"
  end

  describe "#edit" do

    it "display a form for editing a Restaurant"


  end

  describe "#destroy" do

    it "delete the Restaurant"
    it "redirect to the Index"


  end

  describe "#update" do

    it "display a form for editing a Restaurant"


  end


end
