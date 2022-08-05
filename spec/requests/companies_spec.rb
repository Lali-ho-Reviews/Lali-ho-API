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

    it "returns a not found due to wrong param" do
      get "/companies/99"
      expect(response).to have_http_status(:not_found)
    end

    it "edits name of company and returns 200" do
      patch "/companies/1", :params => { :company => { :name => "Changed Name"}}
      expect(response).to have_http_status(200)
    end

    it "deletes company and returns 204" do
      delete "/companies/1"
      expect(response).to have_http_status(204)
    end
  end

  # describe "post company to /companies" do
  #   it "returns success when posting new company" do
  #     post "/companies", :params => { :company => { name: "test", ff_id: "333", slogan: "test", server: "test server" } }
  #     expect(response).to have_http_status(201)
  #   end
  # end
end
