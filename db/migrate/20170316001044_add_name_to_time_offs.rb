class AddNameToTimeOffs < ActiveRecord::Migration
  def change
    add_column :time_offs, :name, :string
  end
end
