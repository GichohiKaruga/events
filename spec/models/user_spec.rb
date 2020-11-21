require_relative '../spec_helper'

describe 'User' do

  before(:each) do
    @user = User.new(name: Faker::Name, email:Faker::Internet.email, phone:Faker::PhoneNumber, password: 's3cr3t')
  end

  it 'is valid' do
    expect(@user).to be_valid
  end

  it 'should have a name' do
    @user = User.new
    expect(@user).to_not be_valid
  end

end