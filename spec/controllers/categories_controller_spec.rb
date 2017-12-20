# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:user) do
    create(:user)
  end

  let(:valid_attributes) do
    { name: "Study" }
  end

  let(:invalid_attributes) do
    { name: "" }
  end

  let(:valid_session) do
    { user_id: user.id }
  end

  describe "GET #index" do
    it "returns a success response" do
      create(:category, user: user)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      category = create(:category, user: user)
      get :show, params: { id: category.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      category = create(:category, user: user)
      get :edit, params: { id: category.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect do
          post :create, params: { category: valid_attributes }, session: valid_session
        end.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post :create, params: { category: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { category: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: "Play" }
      end

      it "updates the requested category" do
        category = create(:category, user: user)
        put :update, params: { id: category.to_param, category: new_attributes }, session: valid_session
        category.reload
        expect(category.name).to eq("Play")
      end

      it "redirects to the category" do
        category = create(:category, user: user)
        put :update, params: { id: category.to_param, category: valid_attributes }, session: valid_session
        expect(response).to redirect_to(category)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        category = create(:category, user: user)
        put :update, params: { id: category.to_param, category: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = create(:category, user: user)
      expect do
        delete :destroy, params: { id: category.to_param }, session: valid_session
      end.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = create(:category, user: user)
      delete :destroy, params: { id: category.to_param }, session: valid_session
      expect(response).to redirect_to(categories_url)
    end
  end
end
