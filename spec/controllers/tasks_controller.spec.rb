require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new task" do
      expect {
        post :create, params: { task: attributes_for(:task) }
      }.to change(Task, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the task" do
      new_name = "Updated Task"
      patch :update, params: { id: task.id, task: { name: new_name } }
      task.reload
      expect(task.name).to eq(new_name)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the task" do
      task
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end
  end
end
