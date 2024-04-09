class AddRelationTypeId < ActiveRecord::Migration[7.1]
  def change
    add_column :student_family_members, :relation_type_id, :integer 
    add_index :student_family_members, :relation_type_id
  end
end
