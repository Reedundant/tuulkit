class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
