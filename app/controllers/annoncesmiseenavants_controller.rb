class AnnoncesmiseenavantsController < ApplicationController
  before_action :set_annoncesmiseenavant, only: [:show, :edit, :update, :destroy]

  # GET /annoncesmiseenavants
  # GET /annoncesmiseenavants.json
  def index
    @annoncesmiseenavants = Annoncesmiseenavant.all
  end

  # GET /annoncesmiseenavants/1
  # GET /annoncesmiseenavants/1.json
  def show
  end

  # GET /annoncesmiseenavants/new
  def new
    @annoncesmiseenavant = Annoncesmiseenavant.new
  end

  # GET /annoncesmiseenavants/1/edit
  def edit
  end

  # POST /annoncesmiseenavants
  # POST /annoncesmiseenavants.json
  def create
    @annoncesmiseenavant = Annoncesmiseenavant.new(annoncesmiseenavant_params)

    respond_to do |format|
      if @annoncesmiseenavant.save
        format.html { redirect_to @annoncesmiseenavant, notice: 'Annoncesmiseenavant was successfully created.' }
        format.json { render :show, status: :created, location: @annoncesmiseenavant }
      else
        format.html { render :new }
        format.json { render json: @annoncesmiseenavant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoncesmiseenavants/1
  # PATCH/PUT /annoncesmiseenavants/1.json
  def update
    respond_to do |format|
      if @annoncesmiseenavant.update(annoncesmiseenavant_params)
        format.html { redirect_to @annoncesmiseenavant, notice: 'Annoncesmiseenavant was successfully updated.' }
        format.json { render :show, status: :ok, location: @annoncesmiseenavant }
      else
        format.html { render :edit }
        format.json { render json: @annoncesmiseenavant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoncesmiseenavants/1
  # DELETE /annoncesmiseenavants/1.json
  def destroy
    @annoncesmiseenavant.destroy
    respond_to do |format|
      format.html { redirect_to annoncesmiseenavants_url, notice: 'Annoncesmiseenavant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annoncesmiseenavant
      @annoncesmiseenavant = Annoncesmiseenavant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annoncesmiseenavant_params
      params.require(:annoncesmiseenavant).permit(:annonce_id)
    end
end
