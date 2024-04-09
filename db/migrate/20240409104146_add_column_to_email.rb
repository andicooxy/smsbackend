class AddColumnToEmail < ActiveRecord::Migration[7.1]
  def change
    remove_column :emails, :parent_id 
  end
end
