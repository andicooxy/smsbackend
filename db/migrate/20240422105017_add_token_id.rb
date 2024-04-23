class AddTokenId < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :active, :boolean, default: false 
    add_column :users, :token_id, :string
    add_index(:users, :token_id)
    add_index(:users, :active)
  end
end
