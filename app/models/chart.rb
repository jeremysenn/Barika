class Chart < ActiveRecord::Base
  attr_accessible :client_id, :notes_attributes, :documents_attributes

  has_many :notes, :dependent => :destroy
  belongs_to :client
  has_many :documents, :as => :documentable,  :dependent => :destroy

  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => lambda { |a| a[:document].blank? }

  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:details].blank? }, :allow_destroy => true

  searchable do
    text :notes do
      notes.map { |note| note.details }
    end
    text :client_full_name
    
    integer :user_id
    string :client_full_name
  end

  def client_full_name
    client.full_name
  end

  def user_id
    client.user.id
  end
end
