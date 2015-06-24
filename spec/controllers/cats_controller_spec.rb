require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  let(:cat) { Cat.create(name: "Cars") }

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
      expect(response).to_not have_http_status(:success)
    end
  end #descibe GET #show

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: cat.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates cat correctly" do
      put :update, id: cat.id, cat => {name: 'edwardo'}
      expect(response).to have_http_status(:redirect)
      expect(cat.reload.name).to eq('edwardo')
      expect(flash[:notice]).to be_present
    end

    it "does't update correctly" do 
      put :update, id: cat.id, cat => {name: nil}
      expect(flash[:error]).to be_present
    end
  end #describe put #update endtag
end
