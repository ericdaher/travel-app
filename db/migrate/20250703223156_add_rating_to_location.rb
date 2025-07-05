class AddRatingToLocation < ActiveRecord::Migration[8.0]
  def change
    add_column :locations, :rating, :integer
  end
end
