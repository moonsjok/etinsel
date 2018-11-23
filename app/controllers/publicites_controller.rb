class PublicitesController < ApplicationController
  before_action :set_publicite, only: [:show, :edit, :update, :destroy]

  # GET /publicites
  # GET /publicites.json
  def index
    @publicites = Publicite.all
  end

  # GET /publicites/1
  # GET /publicites/1.json
  def show
  end

  # GET /publicites/new
  def new
    @publicite = Publicite.new
  end

  # GET /publicites/1/edit
  def edit
  end

  # POST /publicites
  # POST /publicites.json
  def create
    @publicite = Publicite.new(publicite_params)

    respond_to do |format|
      if @publicite.save
        format.html { redirect_to @publicite, notice: 'Publicite was successfully created.' }
        format.json { render :show, status: :created, location: @publicite }
      else
        format.html { render :new }
        format.json { render json: @publicite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicites/1
  # PATCH/PUT /publicites/1.json
  def update
    respond_to do |format|
      if @publicite.update(publicite_params)
        format.html { redirect_to @publicite, notice: 'Publicite was successfully updated.' }
        format.json { render :show, status: :ok, location: @publicite }
      else
        format.html { render :edit }
        format.json { render json: @publicite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicites/1
  # DELETE /publicites/1.json
  def destroy
    @publicite.destroy
    respond_to do |format|
      format.html { redirect_to publicites_url, notice: 'Publicite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicite
      @publicite = Publicite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicite_params
      params.require(:publicite).permit(:resolution, :entreprise, :duree,:banner)
    end
end
