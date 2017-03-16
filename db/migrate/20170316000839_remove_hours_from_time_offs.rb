class RemoveHoursFromTimeOffs < ActiveRecord::Migration
  def change
    remove_column :time_offs, :hours, :integer
    remove_column :time_offs, :days, :integer
    remove_column :time_offs, :week, :integer
    remove_column :time_offs, :month, :integer
    remove_column :time_offs, :experience, :text
    remove_column :time_offs, :responsabilities, :text
  end
end
