class Ability < ActiveRecord::Base
  belongs_to :skill
  belongs_to :gig

end
