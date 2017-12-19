# frozen_string_literal: true

require "rails_helper"

RSpec.describe TopController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index, session: { user_id: create(:user).id }
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
