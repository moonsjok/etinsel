class PublictchatsController < ApplicationController
  before_action :set_publictchat, only: [:show, :edit, :update, :destroy]
def demo

end
  # GET /publictchats
  # GET /publictchats.json
  def index
      if !@user.nil?
           session[:tchater] = @user.username
      end
      if !params[:pseudo].nil?
           session[:tchater] = params[:pseudo]
      end


     @publictchats = Publictchat.all.order('created_at DESC').limit(50)
     @publictchats_count = Publictchat.all.count


  end

  # GET /publictchats/1
  # GET /publictchats/1.json
  def show
  end

  # GET /publictchats/new
  def new
    @publictchat = Publictchat.new
  end

  # GET /publictchats/1/edit
  def edit
  end

  # POST /publictchats
  # POST /publictchats.json
  def create
    @publictchat = Publictchat.new(publictchat_params)

    respond_to do |format|
      if @publictchat.save
        format.html { redirect_to @publictchat, notice: 'Publictchat was successfully created.' }
        format.json { render :show, status: :created, location: @publictchat }
      else
        format.html { render :new }
        format.json { render json: @publictchat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publictchats/1
  # PATCH/PUT /publictchats/1.json
  def update
    respond_to do |format|
      if @publictchat.update(publictchat_params)
        format.html { redirect_to @publictchat, notice: 'Publictchat was successfully updated.' }
        format.json { render :show, status: :ok, location: @publictchat }
      else
        format.html { render :edit }
        format.json { render json: @publictchat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publictchats/1
  # DELETE /publictchats/1.json
  def destroy
    @publictchat.destroy
    respond_to do |format|
      format.html { redirect_to publictchats_url, notice: 'Publictchat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publictchat
      @publictchat = Publictchat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publictchat_params
      params.require(:publictchat).permit(:name, :message)
    end
end
