class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]

  def index
    @document = Document.all.order("created_at DESC")
  end

  def new
    @document = Document.new
  end

  def show
  end

  def create
    @document = Document.new(doc_params)
    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @document.update(doc_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end

  private

    def find_document
      @document = Document.find(params[:id])
    end

    def doc_params
      params.require(:document).permit(:title, :content)
    end
end
