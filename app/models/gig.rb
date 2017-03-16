# == Schema Information
#
# Table name: gigs
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  budget           :integer
#  location         :string
#  open             :boolean          default("t")
#  awarded_proposal :integer
#  latitude         :float
#  longitude        :float
#  created_at       :datetime
#  updated_at       :datetime
#  category_id      :integer
#  user_id          :integer
#  time_off_id      :integer
#  experience       :text
#  responsabilities :text
#  offer            :integer
#

class Gig < ActiveRecord::Base
  has_many :proposals
  belongs_to :category
  belongs_to :user
  belongs_to :time_off

  has_many :abilities
  has_many :skills, through: :abilities

  geocoded_by :location
  after_validation :geocode

  validates :name, :budget, :location, :description, :skill_list, :offer, presence: true
  validates :budget, numericality: { only_integer: true }
  validates :description, length: { minimum: 250 }

  def self.search(params)
    if params[:category].present?
      gigs = Gig.where(category_id: params[:category].to_i)
      gigs = gigs.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      gigs = gigs.near(params[:location], 20) if params[:location].present?
    else
      gigs = Gig.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    end
    gigs
  end

  def skill_list=(skills_string)
    skill_names = skills_string.split(",").collect{ |s| s.strip.downcase }.uniq
    new_or_found_skills = skill_names.collect{ |name| Skill.find_or_create_by(name: name) }
    self.skills = new_or_found_skills
  end

  def skill_list
    self.skills.collect do |skill|
      skill.name
    end.join(", ")
  end

  def self.order_list(sort_order)
    if sort_order == "newest"  || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == "name"
      order(name: :asc)
    else
      order(created_at: :asc)
    end
  end
end
