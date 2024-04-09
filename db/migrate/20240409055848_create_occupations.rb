class CreateOccupations < ActiveRecord::Migration[7.1]
  def change
    create_table :occupations do |t|
      t.boolean :archived, default: false, index: true 
      t.string :name, index: true 
      t.timestamps
    end
  end
end
