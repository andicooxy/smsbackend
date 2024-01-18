class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.integer :user_type_id, index: true, null: false 
      t.timestamps
    end
  end
end
