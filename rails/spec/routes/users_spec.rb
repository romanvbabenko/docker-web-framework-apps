# frozen_string_literal: true

require "rails_helper"

describe 'routes for users', type: :routing do
  it 'routes / to users#index' do
    expect(get('/')).to route_to('users#index')
  end

  it 'routes /users to users#index' do
    expect(get('/users')).to route_to('users#index')
  end
end
