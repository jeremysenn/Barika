class HomeController < ApplicationController
  
  before_filter :login_required, :except => []

  def index
    @notes = current_user.notes.sort_by{|n| n.date}.reverse.first(20)
#    @charts = current_user.charts.sort_by{|c| c.notes.last.date}.limit(10)
    @clients = current_user.clients.sort_by{|c| c.last}
#    @tags = current_user.tags.sort_by{|t| t.name}
    tags = []
    @notes.each do |note|
      note.tags.each do |tag|
        tags << tag
      end
    end
    @tags = tags.uniq{|t| t.name}
  end

end
