class AddRatingToPigs < ActiveRecord::Migration[6.1]
  def change
    add_column :pigs, :rating, :integer
  end
end
