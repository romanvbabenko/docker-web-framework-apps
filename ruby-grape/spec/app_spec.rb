require_relative '../app'

require 'rack/test'

describe RubyGrape::API do
  context 'GET /api/users' do
    it 'returns exactly 3 users' do
      get '/api/users'

      expect(last_response.status).to eq 200
      expect(JSON.parse(last_response.body).size).to eq 3
    end
  end

  # helpers
  include Rack::Test::Methods

  def app
    RubyGrape::API
  end
end

describe User do
  it 'returns all 3 users' do
    users = User.all

    expect(users.size).to eq 3
    expect(users).to eq [{name: 'John Doe'}, {name: 'Jane Doe'}, {name: 'Kotygoroshko'}]
  end
end
