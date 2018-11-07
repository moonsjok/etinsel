class VuesController < ApplicationController
  before_action :set_vue, only: [:show, :edit, :update, :destroy]

  # GET /vues
  # GET /vues.json
  def index
    @vues = Vue.all
  end

  # GET /vues/1
  # GET /vues/1.json
  def show
  end

  # GET /vues/new
  def new
    @vue = Vue.new
  end

  # GET /vues/1/edit
  def edit
  end

  # POST /vues
  # POST /vues.json
  def create
    @vue = Vue.new(vue_params)

    respond_to do |format|
      if @vue.save
        format.html { redirect_to @vue, notice: 'Vue was successfully created.' }
        format.json { render :show, status: :created, location: @vue }
      else
        format.html { render :new }
        format.json { render json: @vue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vues/1
  # PATCH/PUT /vues/1.json
  def update
    respond_to do |format|
      if @vue.update(vue_params)
        format.html { redirect_to @vue, notice: 'Vue was successfully updated.' }
        format.json { render :show, status: :ok, location: @vue }
      else
        format.html { render :edit }
        format.json { render json: @vue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vues/1
  # DELETE /vues/1.json
  def destroy
    @vue.destroy
    respond_to do |format|
      format.html { redirect_to vues_url, notice: 'Vue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vue
      @vue = Vue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vue_params
      params.require(:vue).permit(:annonce_id, :pays, :ville, :quartier, :user_id)
    end
end
