class NotesController < ApplicationController

  before_filter :login_required, :except => []

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
    if @note.document.blank?
      @note.document.build
    end
    @tags = current_user.tags.all.sort_by(&:name).collect{|t| t.name}.uniq unless current_user.tags.all.blank?
  end

  def create
    @note = Note.new(params[:note])
    @tags = current_user.tags.all.sort_by(&:name).collect{|t| t.name}.uniq unless current_user.tags.all.blank?
    if @note.save
      unless params[:note][:document].blank?
        document = Document.new(params[:note][:document])
        document.documentable_id = @note.id
        document.documentable_type = "Note"
        document.save
      end
      redirect_to @note, :notice => "Successfully created note."
    else
      render :action => 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
#    @tags = current_user.tags.all.sort_by(&:name).collect{|t| t.name}.uniq unless current_user.tags.all.blank?
    @tags = Tag.all.uniq.sort_by{|t| t.name.downcase}
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      unless @note.document.blank?
        @note.document.update_attributes(params[:note][:document])
      else
        document = Document.new(params[:note][:document])
        document.documentable_id = @note.id
        document.documentable_type = "Note"
        document.save
      end
      redirect_to @note, :notice  => "Successfully updated note."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_url, :notice => "Successfully destroyed note."
  end
end
