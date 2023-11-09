require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  let(:user) { FactoryBot.create(:user, email: 'miemail@email.com') }
  let(:cart) { FactoryBot.create(:cart) }

  describe 'without user logged in' do
    it 'returns http error if the user is not logged' do
      get '/carts/show'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/carts/create'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/carts/edit'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/carts/update'
      expect(response).to have_http_status(302)
    end

    it 'returns http error if the user is not logged' do
      get '/carts/destroy'
      expect(response).to have_http_status(302)
    end
  end

  describe 'with user logged in' do
    before do
      sign_in user
    end

    it 'returns http success on GET /show' do
      get '/carts/show'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /create' do
      get '/carts/create'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /edit' do
      get '/carts/edit'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /update' do
      get '/carts/update'
      expect(response).to have_http_status(200)
    end

    it 'returns http success on GET /destroy' do
      get '/carts/destroy'
      expect(response).to have_http_status(200)
    end
  end
end
