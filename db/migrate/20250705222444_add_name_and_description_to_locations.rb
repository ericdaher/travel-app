class AddNameAndDescriptionToLocations < ActiveRecord::Migration[8.0]
  def change
    add_column :locations, :name, :string
    add_column :locations, :description, :text
  end
end
