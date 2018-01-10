# frozen_string_literal: true

require "rails_helper"

RSpec.describe CoinsController, type: :controller do
  let(:user) do
    create(:user)
  end

  let(:task) do
    create(:task, user: user)
  end

  let(:valid_session) do
    { user_id: user.id }
  end

  describe "POST #create" do
    let(:valid_attributes) do
      { task_id: task.id }
    end

    context "with valid params" do
      it "creates a new coin" do
        expect do
          post :create, params: valid_attributes, session: valid_session
        end.to change(Coin, :count).by(1)
      end

      it "redirects to the created coin" do
        post :create, params: valid_attributes, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested coin" do
      coin = create(:coin, task: task)
      expect do
        delete :destroy, params: { task_id: task.id }, session: valid_session
      end.to change(Coin, :count).by(-1)
    end

    it "redirects to the coins list" do
      coin = create(:coin, task: task)
      delete :destroy, params: { task_id: task.id }, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end
end
