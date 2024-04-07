class LevelsController < ApplicationController
  def index 
    @levels = Level.all
    render "levels/index", formats: [:json]
  end
end
