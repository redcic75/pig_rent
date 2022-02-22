class CreatePigs < ActiveRecord::Migration[6.1]
  def change
    create_table :pigs do |t|

      t.timestamps
    end
  end
end
