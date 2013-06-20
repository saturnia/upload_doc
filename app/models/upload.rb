class Upload < ActiveRecord::Base
  attr_accessible :document, :tag_list
  #attr_accessor :document_file_name, :created_at
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  belongs_to :user
  has_attached_file :document
  acts_as_taggable


  #validates :user_id, presence: true

  default_scope order: 'uploads.created_at DESC'

end
