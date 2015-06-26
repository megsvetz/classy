require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  let(:cat){create(:cat)}

  describe "GET #index" do
    it "returns http success" do
      cat
      get :index
      expect(response).to have_http_status(:success)
    end
  end #describe GET #index

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
   end #describe GET #new

  describe "GET #show" do
    it "returns http success" do
      get :show, id: cat.id
      expect(response).to have_http_status(:success)
    end

    it "does not return http success" do 
      get :show, id: '1234'
      expect(response).to have_http_status(:not_found)
    end
  end #descibe GET #show

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: cat.id
      expect(response).to have_http_status(:success)
    end
  end #describe GET edit endtag

  describe "PUT #update" do
    it "updates cat correctly" do
      new_name = 'edwardo'
      put :update, id: cat.id, cat: {name: new_name}
      expect(response).to have_http_status(:redirect)
      expect(cat.reload.name).to eq(new_name)
      expect(flash[:notice]).to be_present
    end

    it "doesn't update" do 
      put :update, id: cat.id, cat: {name: nil}
      should set_flash[:error]
      expect(response).to render_template(:edit)
    end
  end #describe PUT #update endtag

  describe "POST #create" do
    it "Creates Category into database correctly" do
      post :create, cat: {name: 'Cars'} 
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to be_present
    end

    it "doesn't create correctly" do
      post :create, cat: {name: nil}
      expect(response).to render_template(:new)
      should set_flash[:error]
    end
  end #describe POST #create endtag

  describe "DELETE #destroy" do
    it "deletes" do
      delete :destroy, id: cat.id
      expect(Cat.all.count).to eq(0)
      # expect(flash[:alert]).to be_present
      expect(response).to have_http_status(:redirect)
      should set_flash[:alert]
    end
    
    it "does not delete" do
      delete :destroy, id: '5432'
      expect(response).to have_http_status(:not_found)
    end
  end #describe DELETE #destroy endtag
end
