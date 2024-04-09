class RelationTypesController < ApplicationController
  def index 
    @relation_types = RelationType.all 
    render "relation_types/index", formats: [:json]
  end
end
