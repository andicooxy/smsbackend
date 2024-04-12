class FamilyMembersController < ApplicationController
  before_action :find_family_member, only: [:show, :update, :unassign]
  before_action :find_student, only: [:unassign]

  # GET /family_members
  def index
    @query = FamilyMember.unarchived
    # @query = @query.search params[:search] if params[:search]
    # @query = @query.includes(:project, :incoming_call_manager)
    if (params[:column_name] && params[:sort]).present?
      @family_members =
        @query
          .limit(params[:limit])
          .offset(params[:offset])
          .reorder("#{params[:column_name]} #{params[:sort]}")
    else
      @family_members =
        @query.limit(params[:limit]).offset(params[:offset]).reorder(created_at: :asc)
    end

    render "family_members/index", formats: [:json]
  end
  
  def show 
    if @family_member.present? 
      render "family_members/show", status: :ok, formats: [:json]
    else
      render json: { error: "not_found", family_member: nil }, status: :not_found
    end
  end

  def create 
    @family_member = FamilyMember.new(
       surname: params[:surname],
       othername: params[:othername], 
       firstname: params[:firstname], 
       reference: FamilyMember.generate_reference, 
       recidence_address: params[:recidenceAddress],
       nationality: params[:nationality]
      )  

    if @family_member.save 
      add_other_details
      render "family_members/show", status: :created, formats: [:json]
    else
      render json: { status: 404, family_member: nil }
    end
  end

  def update 
    @family_member.recidence_address =  params[:recidenceAddress] if params[:recidenceAddress].present?
    @family_member.othername =  params[:othername] if params[:othername].present?
    @family_member.firstname =  params[:firstname] if params[:firstname].present?
    @family_member.surname =  params[:surname] if params[:surname].present?
    @family_member.nationality =  params[:nationality] if params[:nationality].present?

    add_other_details

    if @family_member.save 
      render "family_members/show", status: :created, formats: [:json]
    else
      render json: { status: 404, family_member: nil }
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
  
      if @family_member == nil
        return render json: {
          error: "not_found",
          error_message: "Family member not found",
          status: 404
        }
      end

      @family_member&.students&.delete(@student)
      @family_member&.save
  
      render "family_members/show", status: :created, formats: [:json]
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
  
  private 
  def find_student 
    @student = @family_member&.students&.find_by(id: params[:student_id].to_i)
  end

  def find_family_member 
    @family_member = FamilyMember.find_by(id: params[:id].to_i)
  end

  def add_other_details 
    if params[:telephones].present? 
      params[:telephones].each do |phone|
        unless Telephone.exists?(family_member_id: @family_member.id, str_value: phone)
          Telephone.create(family_member_id: @family_member.id, str_value: phone) 
        end 
      end
    end

    if params[:emails].present? 
      params[:emails].each do |email|
        # unless Email.exists?(family_member_id: @family_member.id, str_value: email)
          Email.find_or_create_by(family_member_id: @family_member.id, str_value: email) 
        # end 
      end
    end

    if params[:students].present? 
      params[:students].each do |hash|
        StudentFamilyMember.find_or_create_by(
          family_member_id: @family_member.id,
          student_id: hash[:student_id], 
          relation_type_id: hash[:relation_type_id]) 
      end
    end
  end
end
