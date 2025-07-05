class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
