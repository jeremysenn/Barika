class HomeController < ApplicationController
  
  before_filter :login_required, :except => []

  def index
    @clients = current_user.clients.sort_by(&:last)
    @charts = current_user.charts.sort_by(&:created_at)
    @notes = current_user.notes.sort_by(&:created_at)
    @tags = current_user.tags.sort_by(&:name)
  end

  def download
#    send_file '/Users/jeremysenn/RubyProjects/BarikaChart/mike_data.zip', :type=>"application/zip", :x_sendfile=>true
#    send_file '/usr/local/RubyProjects/Barika/mike_data.zip', :type=>"application/zip", :x_sendfile=>true

  end

end
