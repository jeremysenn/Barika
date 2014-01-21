class Client < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
#  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessible :user_id

  set_table_name 'client'
  set_primary_key 'clientid'

  belongs_to :user
  has_one :chart
  has_many :notes, :through => :chart

  ##############################
  #    Class Methods           #
  ##############################

  def self.search(search)
    if search
      find(:all, :conditions => ["((lower(first) || ' ' || lower(last)) LIKE ?) OR lower(first) LIKE ? OR lower(last) LIKE ?", "%#{search}%".downcase, "%#{search}%".downcase, "%#{search}%".downcase])
    else
      find(:all)
    end
  end

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
