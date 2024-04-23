class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :destroy, :update, :unassign]
  before_action :find_family_member, only: [:unassign]
  before_action :authorized
  
  def index 
    @students = Student.unarchived.order('created_at desc')
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
      @student.status = params[:status] if  params[:status].present?

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

  def destroy 
    if @student.present? 
       @student.update(archived: true)
      render "students/show", status: :ok, formats: [:json]
    else
      render json: { error: "not_found", student: nil }, status: :not_found
    end
  end

  def unassign
    begin
      unless @student
        return render json: {
          error: "not_found",
          error_message: "Student not found",
          status: 404
        }
      end
  
      unless @family_member
        return render json: {
          error: "not_found",
          error_message: "Family member not found",
          status: 404
        }
      end

      @student&.family_members&.delete(@family_member)
      @student&.save
  
      render "students/show", status: :created, formats: [:json]
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
  

  private 
  def find_student 
    @student = Student.find_by(id: params[:id]&.to_i || params[:student_id]&.to_i)
  end

  def find_family_member 
    @family_member = @student&.family_members&.find_by(id: params[:familyMemberId].to_i)
  end
end
