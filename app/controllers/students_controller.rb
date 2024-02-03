class StudentsController < ApplicationController
  def index 
    @students = Student.all
    render "students/index", formats: [:json]
  end

  def create 
    @student = Student.new(
       surname: params[:surname],
       othername: params[:othername], 
       firstname: params[:firstname], 
       profile_picture: params[:profilePicture] || "N/A", 
       dob: params[:dateOfBirth])

    if @student.save 
      render "students/show", status: :created, formats: [:json]
    else
      render json: { status: 404, student: nil }
    end
  end

  def show 
    @student = Student.find_by(id: params[:id])
    if @student.present? 
      render "students/show", status: :ok, formats: [:json]
    else
      render json: { error: "not_found", student: nil }, status: :not_found
    end
  end

end
