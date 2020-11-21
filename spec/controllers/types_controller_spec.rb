require_relative '../spec_helper'

describe 'Types API' do

  describe 'GET all event types' do
    Type.create!(name: 'Hacking', description: 'Hackathon')
    it 'return event types' do
      get '/types'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body).size).to be > 0
    end
  end

  describe 'GET an event type by id' do
    type = Type.create!(name: 'Hacking', description: 'Hackathon')
    it 'return a event type' do
      get "/types/#{type.id}"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body).size).to be > 0
    end
  end

end
