class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.string :firstname, null: false, index: true 
      t.string :surname, null: false, index: true 
      t.string :othername, index: true 
      t.string :occupation, null: false, index: true 
      t.timestamps
    end
  end
end
