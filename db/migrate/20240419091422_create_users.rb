class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :user_type_id, index: true, null: false 
      t.boolean :archived, index: true, default: false 
      t.string :password_digest
      t.string :firstname
      t.string :username
      t.string :lastname
      t.string :othername
      t.string :email
      t.timestamps
    end
  end
end
