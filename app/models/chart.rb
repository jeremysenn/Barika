class Chart < ActiveRecord::Base
  attr_accessible :client_id, :notes_attributes

  has_many :notes, :dependent => :destroy
  belongs_to :client

  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:details].blank? }, :allow_destroy => true

  def self.all_charts_with_existing_clients
    Chart.all.select { |c| Client.exists?(c.client_id) }
  end
end
