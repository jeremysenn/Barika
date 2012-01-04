class Appuser < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
#  attr_accessible :username, :email, :password, :password_confirmation

  set_table_name 'appuser'
  set_primary_key 'appuserid'

end
