class CreateOutings < ActiveRecord::Migration[8.0]
  def change
    create_table :outings do |t|
      t.references :trip_day, null: false, foreign_key: true
      t.datetime :time
      t.string :address
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
