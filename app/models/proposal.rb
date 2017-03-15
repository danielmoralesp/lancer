# == Schema Information
#
# Table name: proposals
#
#  id          :integer          not null, primary key
#  bid         :integer
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  gig_id      :integer
#  user_id     :integer
#

class Proposal < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user

end
