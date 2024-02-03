class StatusController < ApplicationController
  def index
    render json: { message: 'API is Ok!' }
  end
end
