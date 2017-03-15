# == Schema Information
#
# Table name: abilities
#
#  id       :integer          not null, primary key
#  gig_id   :integer
#  skill_id :integer
#

class Ability < ActiveRecord::Base
  belongs_to :skill
  belongs_to :gig

end
