class CreateStudentFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :student_family_members do |t|
      t.integer :student_id, index: true 
      t.integer :family_member_id, index: true 
      t.timestamps
    end
  end
end
