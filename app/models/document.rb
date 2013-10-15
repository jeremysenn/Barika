class Document < ActiveRecord::Base
  attr_accessible :title, :file, :documentable_id, :documentable_type

  mount_uploader :file, FileUploader

  belongs_to :documentable, :polymorphic => true

#  validates :title,  :presence => true
end
