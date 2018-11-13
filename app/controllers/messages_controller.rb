class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
      @messages = Message.all
      users_= User.select(:id,:username).where(online: 1).order("created_at DESC")
      @users_online = []
      i=0
       for user_ in users_
          if !Photo.find_by(role:"profil_pic",user_id: user_.id).nil?
              profil_pic = Photo.find_by(role:"profil_pic",user_id: user_.id).name
         else
             profil_pic = "/img/Inscrit_avatar.png"
         end
           tableau = [user_.id,user_.username,profil_pic]
           @users_online.push(tableau)
           i = i+1
       end

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html {
             if params[:message][:annonce_id]
			           redirect_to "/annonces/"+params[:message][:annonce_id], notice: 'Votre message a bien été envoyé.'
             else
               redirect_to "/monprofil/messages/" , notice: 'Votre message a bien été envoyé.'
             end
		}
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :destinataire, :message, :status)
    end
end
