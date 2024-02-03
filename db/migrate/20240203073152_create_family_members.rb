class CreateFamilyMembers < ActiveRecord::Migration[7.1]
  def change
    drop_table :parents
    create_table :family_members do |t|
      t.string :surname, null: false, index: true 
      t.string :othername, index: true 
      t.string :firstname, null: false, index: true 
      t.string :nationality
      t.string :recidence_address
      t.string :reference, null: false, index: true 
      t.integer :occupation_id, index: true 
      t.integer :phone_id, index: true 
      t.integer :email_id, index: true 
      t.timestamps
    end
  end
end
