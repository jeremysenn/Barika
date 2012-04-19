class ChartsController < ApplicationController

  before_filter :login_required, :except => []

  def index
    @charts = Chart.all
  end

  def show
    @chart = Chart.find(params[:id])
    @tags = Tag.all.uniq.sort_by{|t| t.name.downcase}
#    @tags = current_user.tags.all.uniq.sort_by{|t| t.name.downcase}
    unless current_user.tags.all.blank?
      @tag_list = current_user.tags.all.sort_by(&:name).collect{|t| t.name}.uniq
    else
      @tag_list = []
    end
    #@tags = Tag.all.sort_by(&:name)
    #@notes = Note.where("chart_id = @chart.id").page(params[:page])
    if not params[:tag].blank? #LOOK FOR SINGLE TAG TO FILTER NOTES ON
      tag = Tag.find_by_name(params[:tag])
      @notes = Kaminari.paginate_array(@chart.notes.find(:all, :conditions => ['tags.id = ?', tag.id], :joins => [:tags])).page(params[:page]).per(6)
    elsif not params[:tags].blank? #LOOK FOR MULTIPLE TAGS TO FILTER NOTES ON
      filter_tags= Tag.find(:all, :conditions => {:id => params[:tags]})
      @notes = Kaminari.paginate_array(@chart.notes.find(:all, :joins => :tags, :conditions => {:tags => {:id => filter_tags}})).page(params[:page]).per(6)
    else #SHOW ALL NOTES
      @notes = Kaminari.paginate_array(@chart.notes.sort_by(&:date).reverse).page(params[:page]).per(6)
    end
  end

  def new
    @chart = Chart.new
    @clients = Client.all
    @chart.client = Client.find(params[:client]) unless params[:client].blank?

    1.times{@chart.notes.build}
    @tags = current_user.tags.all.sort_by(&:name).collect{|t| t.name}.uniq unless current_user.tags.all.blank?
  end

  def create
    @chart = Chart.new(params[:chart])
    if @chart.save
      redirect_to @chart, :notice => "Successfully created chart."
    else
      render :action => 'new'
    end
  end

  def edit
    @chart = Chart.find(params[:id])
    @clients = Client.all
  end

  def update
    @chart = Chart.find(params[:id])
    if @chart.update_attributes(params[:chart])
      redirect_to @chart, :notice  => "Successfully updated chart."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy
    redirect_to charts_url, :notice => "Successfully destroyed chart."
  end

  def tag_filter

  end
end
