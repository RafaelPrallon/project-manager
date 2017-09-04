require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #my_projects" do
    it "returns http success" do
      get :my_projects
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
