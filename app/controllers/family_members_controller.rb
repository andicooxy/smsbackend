class FamilyMembersController < ApplicationController
  
  # GET /family_members
  def index
    @query = FamilyMember
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
        @query.limit(params[:limit]).offset(params[:offset]).reorder(id: :asc)
    end

    render "family_members/index", formats: [:json]
  end
  
  def show 
    @family_member = FamilyMember.find_by(id: params[:id])
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
       reference: DateTime.now.to_i.to_s, 
       recidence_address: params[:recidence_address],
       nationality: params[:nationality]
      ) #TODO PHONE email occupation relationship(dropdown) 

    if @family_member.save 
      render "family_members/show", status: :created, formats: [:json]
    else
      render json: { status: 404, family_member: nil }
    end
  end

  def update 
  end

end
