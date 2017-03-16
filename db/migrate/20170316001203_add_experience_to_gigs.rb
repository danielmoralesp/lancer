class AddExperienceToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :experience, :text
    add_column :gigs, :responsabilities, :text
  end
end
