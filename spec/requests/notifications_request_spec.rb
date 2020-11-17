require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  context 'GET #show' do
    it 'returns a success response' do
      notification = Notification.create!(body: 'test text', user_id: '1')
      get :show, params: { id: notification.to_param }
      expect(response).to be_success
    end
  end
end
