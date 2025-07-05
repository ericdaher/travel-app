class AddLocationsToOutings < ActiveRecord::Migration[8.0]
  def change
    remove_column :outings, :address, :string
    remove_column :outings, :lat, :decimal
    remove_column :outings, :lng, :decimal
    add_reference :outings, :location, null: false, foreign_key: true
  end
end
