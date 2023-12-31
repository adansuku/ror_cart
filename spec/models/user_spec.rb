require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      email: 'test@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end
end
