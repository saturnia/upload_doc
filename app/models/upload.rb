class Upload < ActiveRecord::Base

  attr_accessible :document, :tag_list
  belongs_to :user
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/pdf", "application/doc"]

  acts_as_taggable
  default_scope order: 'uploads.created_at DESC'

end