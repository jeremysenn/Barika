class Client < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :user_id

  set_table_name 'client'
  set_primary_key 'clientid'

  belongs_to :user
  has_one :chart
  has_many :notes, :through => :chart

  searchable do
    text    :first, :last
    integer :user_id
    string  :last
  end

  ##############################
  #    Class Methods           #
  ##############################

  #############################
  #     Instance Methods      #
  #############################

  def full_name
    if !first.blank? || !last.blank?
      "#{first} #{last}".strip
    else
      clientid
    end
  end

end
