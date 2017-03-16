# == Schema Information
#
# Table name: time_offs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class TimeOff < ActiveRecord::Base
  has_many :gigs
end
