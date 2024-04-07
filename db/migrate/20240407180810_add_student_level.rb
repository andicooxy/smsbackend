class AddStudentLevel < ActiveRecord::Migration[7.1]
  def change
    add_column(:students, :level_id, :integer)
    add_index(:students, :level_id)
  end
end
