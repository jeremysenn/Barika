class TagsController < ApplicationController

  before_filter :login_required, :except => []

  def index
    @tags = Tag.all
    respond_to do |format|
     format.html
     format.json { render :json => @tags }
    end

  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to @tag, :notice => "Successfully created tag."
    else
      render :action => 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to @tag, :notice  => "Successfully updated tag."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_url, :notice => "Successfully destroyed tag."
  end

  def autocomplete
     tags = Tag.all
     render :json => tags
  end

end
