class AddAttachmentDocumentToProposals < ActiveRecord::Migration
  def self.up
    change_table :proposals do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :proposals, :document
  end
end
