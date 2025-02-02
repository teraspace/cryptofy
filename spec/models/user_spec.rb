require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    user.email = nil
    user.password = Faker::Internet.password
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('can\'t be blank')
  end

end
