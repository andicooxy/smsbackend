class UsersController < ApplicationController
  def index
    render json: { message: 'Welcome to the API!' }
  end
end
