class CreateRelationTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :relation_types do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end