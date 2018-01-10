class DocumentAcademicsController < ApplicationController
  #before_action :set_document_academic, only: [:show, :edit, :update, :destroy]

  # GET /document_academics
  # GET /document_academics.json
  def index
    @document_academics = DocumentAcademic.all
  end

  # GET /document_academics/1
  # GET /document_academics/1.json
  def show
  end

  # GET /document_academics/new
  def new
    @document_academic = DocumentAcademic.new
  end

  # GET /document_academics/1/edit
  def edit
  end

  # POST /document_academics
  # POST /document_academics.json
  def create
    @document_academic = DocumentAcademic.new(document_academic_params)
    respond_to do |format|
      if @document_academic.save
        format.html { redirect_to @document_academic, notice: 'Document academic was successfully created.' }
        format.json { render :show, status: :created, location: @document_academic }
      else
        format.html { render :new }
        format.json { render json: @document_academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_academics/1
  # PATCH/PUT /document_academics/1.json
  def update
    respond_to do |format|
      if @document_academic.update(document_academic_params)
        format.html { redirect_to @document_academic, notice: 'Document academic was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_academic }
      else
        format.html { render :edit }
        format.json { render json: @document_academic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_academics/1
  # DELETE /document_academics/1.json
  def destroy
    @document_academic.destroy
    respond_to do |format|
      format.html { redirect_to document_academics_url, notice: 'Document academic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_academic
      @document_academic = DocumentAcademic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_academic_params
      params.require(:document_academic).permit(:document, :commentary, :academic_id)
    end
end
