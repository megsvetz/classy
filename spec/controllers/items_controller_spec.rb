require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:item) { Item.create(name: "Buick", price: 2345.80, description: "1987 Buick Skylark in great condition!", cat_id: 1) }

  describe "GET #index" do
    it "returns http success" do
      item
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
    it "shows item" do
      get :show, id: item.id
      expect(response).to have_http_status(:success)
    end

    # it "does not show item" do 
    #   get :show, id: '1234'
    #   expect(response).to_not have_http_status(:success)
    # end
  end #descibe GET #show

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates item correctly" do
      put :update, id: item.id, item => {name: "Buick Skylark", price: 2345.80, description: "1989 Buick Skylark in great condition!", cat_id: 1}
      expect(response).to have_http_status(:redirect)
      expect(item.reload.name).to eq('Buick Skylark')
      expect(flash[:notice]).to be_present
    end

    it "does't update correctly" do 
      put :update, id: item.id, item => {name: nil}
      expect(flash[:error]).to be_present
    end
  end #describe put #update endtag

  describe "POST #create" do
    it "creates successfully" do
      post :create, item: {name: "Nissan Sentra", price: 1500.99, description: "Black 1999 Nissan Sentra with 187,000 miles!", cat_id: 2}
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to be_present
    end
    it "does not create" do
      post :create, item: {name: nil, price: 1500.99, description: "Black 1999 Nissan Sentra with 187,000 miles!", cat_id: 2}
      expect(response).to have_http_status(:redirect)
      expect(flash[:error]).to be_present
    end
  end

  describe "DELETE #destroy" do
    it "deletes" do
      delete :destroy, id: item.id
      expect(Item.all.count).to eq(0)
      expect(flash[:alert]).to be_present
      expect(response).to have_http_status(:redirect)
    end

    it "does not delete" do
      delete :destroy, id: '5432'
      expect(flash[:error]).to be_present
      expect(response).to have_http_status(:not_found)
    end
  end
end
