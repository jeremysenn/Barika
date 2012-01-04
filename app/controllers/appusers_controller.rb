class AppusersController < ApplicationController
  def index
    @appusers = Appuser.all
  end

  def show
    @appuser = Appuser.find(params[:id])
  end

  def new
    @appuser = Appuser.new
  end

  def create
    @appuser = Appuser.new(params[:appuser])
    if @appuser.save
      redirect_to @appuser, :notice => "Successfully created appuser."
    else
      render :action => 'new'
    end
  end

  def edit
    @appuser = Appuser.find(params[:id])
  end

  def update
    @appuser = Appuser.find(params[:id])
    if @appuser.update_attributes(params[:appuser])
      redirect_to @appuser, :notice  => "Successfully updated appuser."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @appuser = Appuser.find(params[:id])
    @appuser.destroy
    redirect_to appusers_url, :notice => "Successfully destroyed appuser."
  end
end
