require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success # response.success?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create!(email: 'first.last@example.com', password: '123456')
      get :show, params: { id: user.to_param }
      expect(response).to be_success
    end
  end
end
