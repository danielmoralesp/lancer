class AddOfferToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :offer, :integer
  end
end
