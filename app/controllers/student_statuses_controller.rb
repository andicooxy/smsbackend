class StudentStatusesController < ApplicationController
  def index
    render json: {  
      enrollmentStatus: %i[prospective onborded expelled],
      status: %i[not_set available_in_school not_in_school]
      }, status: :ok
  end
end
