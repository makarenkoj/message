require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures email and password presence' do
      user = User.new.save
      expect(user).to eq(false)
    end
    it 'should save successfully' do
      user = User.new(email: 'sample@example.com', password: '123456').save
      expect(user).to eq(true)
    end
  end
end
