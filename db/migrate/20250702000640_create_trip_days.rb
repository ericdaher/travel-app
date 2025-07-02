class CreateTripDays < ActiveRecord::Migration[8.0]
  def change
    create_table :trip_days do |t|
      t.references :trip, null: false, foreign_key: true
      t.date :day

      t.timestamps
    end
  end
end
