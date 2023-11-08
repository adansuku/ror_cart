require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { FactoryBot.create(:user) }
  describe 'without user logged in' do
    it 'returns http error if the user is not logged' do
      get '/products/show'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/products/create'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/products/edit'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/products/update'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/products/destroy'
      expect(response).to have_http_status(302)
    end
  end

  describe 'with user logged in' do
    before do
      sign_in user
    end

    it 'returns http success on GET /show' do
      get '/products/show'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /create' do
      get '/products/create'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /edit' do
      get '/products/edit'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /update' do
      get '/products/update'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /destroy' do
      get '/products/destroy'
      expect(response).to have_http_status(200)
    end
  end
end
