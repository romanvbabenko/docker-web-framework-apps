# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET index' do
    it 'assigns @users' do
      user = create(:user, f_name: 'John', l_name: 'Doe')
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:users)).to eq([user])
    end
  end
end
