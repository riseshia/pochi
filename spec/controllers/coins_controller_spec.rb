# frozen_string_literal: true

require "rails_helper"

RSpec.describe CoinsController, type: :controller do
  let(:user) do
    create(:user)
  end

  let(:task) do
    category = create(:category, user: user)
    create(:task, user: user, category: category)
  end

  let(:valid_session) do
    { user_id: user.id }
  end

  describe "POST #create" do
    let(:valid_attributes) do
      { task_id: task.id }
    end

    context "with valid params" do
      it "creates a new Coin" do
        expect do
          post :create, params: { coin: valid_attributes }, session: valid_session
        end.to change(Coin, :count).by(1)
      end

      it "redirects to the created coin" do
        post :create, params: { coin: valid_attributes }, session: valid_session
        expect(response).to redirect_to(tasks_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested coin" do
      coin = create(:coin, task: task)
      expect do
        delete :destroy, params: { id: coin.to_param }, session: valid_session
      end.to change(Coin, :count).by(-1)
    end

    it "redirects to the coins list" do
      coin = create(:coin, task: task)
      delete :destroy, params: { id: coin.to_param }, session: valid_session
      expect(response).to redirect_to(tasks_path)
    end
  end
end
