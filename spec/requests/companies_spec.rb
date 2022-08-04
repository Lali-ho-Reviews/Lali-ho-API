require 'rails_helper'


RSpec.describe "/companies", type: :request do

  before(:each) do
    FactoryBot.create(:company, id: 1, name: "Company1", ff_id: "999", slogan: "Test Slogan", server: "Server")
    FactoryBot.create(:company, id: 2, name: "Company2", ff_id: "111", slogan: "Test", server: "Server")
  end

  describe "get all companies at /companies" do
    it "returns all companies" do
      get "/companies"
      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "get company at /companies/:id" do
    it "returns company from param" do
      get "/companies/1"
      expect(response).to have_http_status(200)
      expect(response.body).to include("Test Slogan")
    end
  end
end
