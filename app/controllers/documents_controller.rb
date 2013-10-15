class DocumentsController < ApplicationController
  before_filter :login_required

  def index
#    @documents = Document.all
    @company_documents = current_user.documents
    @chart_documents = current_user.charts.map(&:documents).flatten
    @note_documents = current_user.notes.map(&:documents).flatten
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    unless params[:chart].blank?
      @chart = Chart.find(params[:chart])
      @document = Document.new
      @document.documentable_type = 'Chart'
      @document.documentable_id = @chart.id
      @document.title = @chart.client.full_name
    end
    unless params[:note].blank?
      @note = Note.find(params[:note])
      @document = Document.new
      @document.documentable_type = 'Note'
      @document.documentable_id = @note.id
      @document.title = @note.date
    end
    unless params[:user].blank?
      @user = User.find(params[:user])
      @document = Document.new
      @document.documentable_type = 'User'
      @document.documentable_id = @user.id
      @document.title = @user.username
    end
    
  end

  def create
    @document = Document.new(params[:document])
    if @document.save
      if @document.documentable_type == 'Chart'
        redirect_to chart_path(@document.documentable), :notice => "Successfully created document."
      elsif @document.documentable_type == 'Note'
        redirect_to chart_path(@document.documentable.chart), :notice => "Successfully created document."
      else
        redirect_to @document, :notice => "Successfully created document."
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      redirect_to @document, :notice  => "Successfully updated document."
    else
      render :action => 'edit'
    end
  end

  def serve
    @document = Document.find(params[:id])
    path = @document.file.path
    if File.extname(@document.file.path) == '.pdf'
      send_file(path, :filename => "your_document.pdf", :disposition => 'inline', :type => "application/pdf")
    else
      path
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_url, :notice => "Successfully destroyed document."
  end
end
