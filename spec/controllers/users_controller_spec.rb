require_relative '../spec_helper'

describe 'Users API' do

  describe 'GET a user by id' do
    user = User.create!(name: 'Gichohi', phone: '52357383', email: 'gichohi@karuga.net',
                        password: 's3cr3t')
    it 'return a user' do
      get "/users/#{user.id}"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body).size).to be > 0
    end
  end

  describe 'POST /users' do
    it 'create a new user' do
      user_params = { name: Faker::Name, phone: Faker::PhoneNumber, email: Faker::Internet,
                      password: 's3cr3t' }
      post '/users', params = user_params.to_json, headers: { "Content-Type": 'application/json' }
      puts last_response
      expect(last_response.status).to eq(200)
    end
  end



end