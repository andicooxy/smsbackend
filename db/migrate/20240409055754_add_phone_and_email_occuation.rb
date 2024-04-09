class AddPhoneAndEmailOccuation < ActiveRecord::Migration[7.1]
  def change
    remove_column :emails, :parent_id
    remove_column :telephones, :parent_id
  end
end
