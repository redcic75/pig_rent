class AddActiveToPig < ActiveRecord::Migration[6.1]
  def change
    add_column :pigs, :active, :boolean
  end
end
