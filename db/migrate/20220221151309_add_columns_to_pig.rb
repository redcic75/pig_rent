class AddColumnsToPig < ActiveRecord::Migration[6.1]
  def change
    add_column :pigs, :name, :string
    add_column :pigs, :required_space, :integer
    add_column :pigs, :eat_capacity, :integer
    add_reference :pigs, :user, null: false, foreign_key: true
    add_column :pigs, :daily_price, :integer
  end
end
