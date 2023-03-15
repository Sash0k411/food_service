
require 'rails_helper'

RSpec.describe OrdersController do
  describe 'GET #index' do
    before { get :index }

    it 'returns success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'returns success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'saves a new order in the database' do
      expect { post :create, params: { order: { rejected_ingredients: [1] } } }.to change(Order, :count).by(1)
    end

    it 'redirects to root' do
      post :create, params: { order: { rejected_ingredients: [1] } }

      expect(response).to redirect_to(root_path)
    end
  end
end