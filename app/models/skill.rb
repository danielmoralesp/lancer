# == Schema Information
#
# Table name: skills
#
#  id   :integer          not null, primary key
#  name :string
#

class Skill < ActiveRecord::Base
  has_many :abilities
  has_many :gigs, through: :abilities

end
