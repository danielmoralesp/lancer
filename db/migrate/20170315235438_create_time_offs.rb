class CreateTimeOffs < ActiveRecord::Migration
  def change
    create_table :time_offs do |t|
      t.integer :hours
      t.integer :days
      t.integer :week
      t.integer :month
      t.text :experience
      t.text :responsabilities

      t.timestamps null: false
    end
  end
end
