class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.float :price
      t.boolean :new
      t.integer :year
      t.string :maker
      t.string :color
      t.string :model
      t.float :mileage

      t.timestamps
    end
  end
end
