require 'rails_helper'

RSpec.describe RegisteredappsController, type: :controller do
  let(:my_registeredapp) { create(:registeredapp) }
  
  context "user" do
   before do 
      user = FactoryGirl.create(:user)
    
    
   
   
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: my_registeredapp.id }
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #show view" do
        get :show, params: { id: my_registeredapp.id }
        expect(response).to render_template :show
      end
      
      it "assigns my_registeredapp to @registeredapp" do
        get :show, params: { id: my_registeredapp.id }
        expect(assigns(:registeredapp)).to eq(my_registeredapp)
      end      
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
   end 
  end
end
