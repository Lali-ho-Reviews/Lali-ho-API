require 'rails_helper'


RSpec.describe "/reviews", type: :request do

    before(:each) do
        FactoryBot.create(:company, id: 1, name: "Company1", ff_id: "999", slogan: "Test Slogan", server: "Server")
        FactoryBot.create(:user, id: 1, username: "user", email: "email@email.com", password: "123", password_confirmation: "123")
        FactoryBot.create(:review, id: 1, text: "Test Text", rating: 5, user_id: 1, company_id: 1)
        FactoryBot.create(:review, id: 2, text: "Test2", rating: 1, author: "Anonymous", company_id: 1)
    end

    describe "get all reviews at company/:id" do
        it "returns all companies via company reviews page" do
            get "/companies/1/reviews"
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe "get review at /companies/:id/reviews/:id" do
        # it "returns review from param" do
        #     get "/companies/1/reviews/1"
        #     expect(response).to have_http_status(200)
        # end
    
        it "returns a not found due to wrong param" do
            get "/companies/1/reviews/99"
            expect(response).to have_http_status(:not_found)
        end
    
        it "cannot edit review of another user without auth" do
            patch "/companies/1/reviews/1", :params => { :review => { :text => "Changed Text"}}
            expect(response).to have_http_status(401)
        end
    
        it "cannot delete review of another user without auth" do
            delete "/companies/1/reviews/1"
            expect(response).to have_http_status(401)
        end
    end
end
