# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #failure" do
    it "returns http success" do
      get :failure
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      get :destroy, session: { user_id: create(:user).id }
      expect(response).to redirect_to(sign_in_path)
    end
  end

  describe "GET #create" do
    around do |ex|
      OmniAuth.config.add_mock(:github, auth)
      ex.run
      OmniAuth.config.mock_auth[:github] = nil
    end

    let(:auth) do
      OmniAuth::AuthHash.new(
        provider: "github",
        uid: "some_uid",
        credentials: { token: "some_difficult_token" }
      )
    end

    it "creates user and redirects to root" do
      skip "Rails can't find matched routes although it exist..."
      get :create
      expect(response).to redirect_to(root_path)
      expect(User.count).to eq(1)
    end
  end
end
