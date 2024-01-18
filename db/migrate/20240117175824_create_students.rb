class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :surname, null: false, index: true 
      t.string :othername, index: true 
      t.string :firstname, null: false, index: true 
      t.string :profile_picture
      t.date :dob, null: false 
      t.timestamps
    end
  end
end
