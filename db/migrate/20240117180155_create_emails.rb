class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :str_value, null: false, index: true 
      t.integer :parent_id, index: true
      t.boolean :active, default: false, index: true
      t.boolean :archived, default: false, index: true
      t.integer :user_id, index: true 
      t.timestamps
    end
  end
end
