class AddTimeOffToGigs < ActiveRecord::Migration
  def change
    add_reference :gigs, :time_off, index: true
  end
end
