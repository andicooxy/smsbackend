class AddStatusToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column(:students, :enrollment_status, :integer, default: 0)
    add_index(:students, :enrollment_status)

    add_column(:students, :status, :integer, default: 0)
    add_index(:students, :status)
  end
end
