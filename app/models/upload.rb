class Upload < ActiveRecord::Base

  attr_accessible :document, :tag_list
  belongs_to :user
  has_attached_file :document
  acts_as_taggable
  default_scope order: 'uploads.created_at DESC'

end
