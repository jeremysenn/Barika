class ChartsController < ApplicationController
  def index
    @charts = Chart.all
  end

  def show
    @chart = Chart.find(params[:id])
    @tags = Tag.all.sort_by{|t| t.name.downcase}
    #@tags = Tag.all.sort_by(&:name)
    #@notes = Note.where("chart_id = @chart.id").page(params[:page])
    unless params[:tag].blank?
      tag = Tag.find_by_name(params[:tag])
      @notes = Kaminari.paginate_array(@chart.notes.find(:all, :conditions => ['tags.id = ?', tag.id], :joins => [:tags])).page(params[:page]).per(2)
    else
      @notes = @chart.notes.page(params[:page]).per(2)
    end
  end

  def new
    @chart = Chart.new
    @clients = Client.all
    @chart.client = Client.find(params[:client]) unless params[:client].blank?

    1.times{@chart.notes.build}
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
end
