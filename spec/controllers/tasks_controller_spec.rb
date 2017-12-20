# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasksController, type: :controller do
  let(:user) do
    create(:user)
  end

  let(:category) do
    create(:category, user: user)
  end

  let(:valid_attributes) do
    { name: "Valid name", category_id: category.id }
  end

  let(:invalid_attributes) do
    { name: "" }
  end

  let(:valid_session) do
    { user_id: user.id }
  end

  describe "GET #index" do
    it "returns a success response" do
      create(:task, category: category, user: user)
      get :index, params: {}, session: valid_session
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
      task = create(:task, category: category, user: user)
      get :edit, params: { id: task.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect do
          post :create, params: { task: valid_attributes }, session: valid_session
        end.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { task: valid_attributes }, session: valid_session
        expect(response).to redirect_to(tasks_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { task: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: "Updated name" }
      end

      it "updates the requested task" do
        task = create(:task, category: category, user: user)
        put :update, params: { id: task.to_param, task: new_attributes }, session: valid_session
        task.reload
        expect(task.name).to eq("Updated name")
      end

      it "redirects to the task" do
        task = create(:task, category: category, user: user)
        put :update, params: { id: task.to_param, task: valid_attributes }, session: valid_session
        expect(response).to redirect_to(tasks_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        task = create(:task, category: category, user: user)
        put :update, params: { id: task.to_param, task: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = create(:task, category: category, user: user)
      expect do
        delete :destroy, params: { id: task.to_param }, session: valid_session
      end.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = create(:task, category: category, user: user)
      delete :destroy, params: { id: task.to_param }, session: valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end
end
