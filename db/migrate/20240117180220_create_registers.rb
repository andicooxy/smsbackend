class CreateRegisters < ActiveRecord::Migration[7.1]
  def change
    create_table :registers do |t|
      t.integer :student_id, index: true
      t.integer :parent_id, index: true
      t.integer :approved_user_id, index: true
      t.integer :activity, null: false, default: 0
      t.timestamps
    end
  end
end
