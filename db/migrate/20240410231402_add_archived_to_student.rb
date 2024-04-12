class AddArchivedToStudent < ActiveRecord::Migration[7.1]
  def change
    add_column :family_members, :archived, :boolean, default: false 
    add_index(:family_members, :archived)
    add_column :students, :archived, :boolean, default: false 
    add_index(:students, :archived)
  end
end
