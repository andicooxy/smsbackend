class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :update]
  def index 
    @students = Student.order('created_at')
    render "students/index", formats: [:json]
  end

  def create 
    @student = Student.new(
       surname: params[:surname],
       othername: params[:othername], 
       firstname: params[:firstname], 
       profile_picture: params[:profilePicture] || "N/A", 
       dob: params[:dateOfBirth]) #Todo Add ClassRoom

    if params[:levelId].present? 
      @student.level_id = params[:levelId]
    end

    if @student.save 
      render "students/show", status: :created, formats: [:json]
    else
      render json: { status: 404, student: nil }
    end
  end

  def update 
    if @student.present? 
      @student.surname = params[:surname] if  params[:surname].present?
      @student.othername = params[:othername] if  params[:othername].present?
      @student.profile_picture = params[:profilePicture] if  params[:profilePicture].present?
      @student.dob = params[:dateOfBirth] if  params[:dateOfBirth].present?
      @student.firstname = params[:firstname] if  params[:firstname].present?
     
     if params[:levelId].present? 
       @student.level_id = params[:levelId]
     end
 
     if @student.save 
       render "students/show", status: :ok, formats: [:json]
     else
       render json: { status: 404, student: nil }
     end
    else
      render json: { error: "not_found", student: nil }, status: :not_found
    end
  end

  def show
    if @student.present? 
      render "students/show", status: :ok, formats: [:json]
    else
      render json: { error: "not_found", student: nil }, status: :not_found
    end
  end

  private 
  def find_student 
    @student = Student.find_by(id: params[:id])
  end
end
