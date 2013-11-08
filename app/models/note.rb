class Note < ActiveRecord::Base
  attr_accessible :chart_id, :details, :date, :tag_names, :document_attributes

  belongs_to :chart
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_one :document, :as => :documentable,  :dependent => :destroy

#  accepts_nested_attributes_for :document, :allow_destroy => true, :reject_if => lambda { |a| a[:file].blank? }
  
  validates :details, :presence => true
  attr_writer :tag_names
  after_save :assign_tags


  ##############################
  #    Class Methods           #
  ##############################

  def tag_names
    @tag_names || tags.map(&:name).join(',')
  end

  #############################
  #     Instance Methods      #
  #############################


  private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(',').map do |name|
        Tag.find_or_create_by_name(name.downcase)
      end
    end
  end

end
