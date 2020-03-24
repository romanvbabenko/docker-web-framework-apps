# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render component: 'Users', props: { users: @users }
  end
end
