require 'grape'

class User
  class << self
    def all
      [{name: 'John Doe'}, {name: 'Jane Doe'}, {name: 'Kotygoroshko'}]
    end
  end
end

module RubyGrape
  class API < Grape::API
    version 'v1', using: :header, vendor: 'ruby-grape'
    format :json
    prefix :api

    get '/users' do
      User.all
    end
  end
end
