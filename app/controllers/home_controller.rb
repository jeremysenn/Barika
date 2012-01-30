class HomeController < ApplicationController
  
  before_filter :login_required, :except => []

  def index
  end

  def download
#    send_file '/Users/jeremysenn/RubyProjects/BarikaChart/mike_data.zip', :type=>"application/zip", :x_sendfile=>true
#    send_file '/usr/local/RubyProjects/Barika/mike_data.zip', :type=>"application/zip", :x_sendfile=>true

  end

end
