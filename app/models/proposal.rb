# == Schema Information
#
# Table name: proposals
#
#  id                    :integer          not null, primary key
#  bid                   :integer
#  description           :text
#  created_at            :datetime
#  updated_at            :datetime
#  gig_id                :integer
#  user_id               :integer
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#

class Proposal < ActiveRecord::Base
  belongs_to :gig
  belongs_to :user

  has_attached_file :document,
    :url => "/:rails_root/public/attachments/:id/:basename.:extension",
    :path => ":rails_root/public/attachments/:id/:basename.:extension"

  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
