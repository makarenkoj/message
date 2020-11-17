require 'rails_helper'

RSpec.describe Notification, type: :model do
  context 'validation test' do
    it 'ensures body presence' do
      notification = Notification.new.save
      expect(notification).to eq(false)
    end
    it 'should save successfully' do
      notification = Notification.new(body: 'test text', user_id: '1').save
      expect(notification).to eq(true)
    end
  end
end
