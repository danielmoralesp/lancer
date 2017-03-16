class RemoveHoursFromGigs < ActiveRecord::Migration
  def change
    remove_column :gigs, :hours, :integer
    remove_column :gigs, :days, :integer
    remove_column :gigs, :week, :integer
    remove_column :gigs, :month, :integer
    remove_column :gigs, :experience, :text
    remove_column :gigs, :responsabilities, :text
  end
end
