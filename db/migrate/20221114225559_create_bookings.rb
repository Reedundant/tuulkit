class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :tool, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :starting_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end