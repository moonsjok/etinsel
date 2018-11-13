class PrivatepagesController < ApplicationController
  before_action :require_login
  before_action :global_var

  def monprofil
      #DECLARATION ET INITIALISATION DES VARIABLES
      @contenu = params[:contenu] #LE contenu à affiché
      @user = current_user
      if Identity.find_by(user_id:@user.id).nil?
          @identity=Identity.new
      else
          @identity=Identity.find_by(user_id:@user.id)
      end

     @messages = Message.where(destinataire:  @user.id).limit(50).order("created_at DESC")


     #FIN DES DECLARATIONS

  if @contenu == "change_password"
     if params[:password] == params[:confirm_password]

       @user=User.find(current_user.id)
        respond_to do |format|
          if @user.update(password: params[:password])
            format.html { redirect_to "/", notice: 'Mot de passe changé avec sucess veuillez vous reconnecter!.' }
            format.json { render :show, status: :ok, location: "/" }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

############################# FOR THE CHAT ################
	    # @chats = Chat.limit(50)
      @username = User.find(message.user_id).username
  end


  end

  def change_password

  end



  def mesannonces
  end

  private
  def require_login
    unless user_signed_in?
      flash[:error] = "Veuillez vous connecter "
      redirect_to root_path # halts request cycle
    end
  end
  def global_var
    if Photo.find_by(user_id: current_user.id).nil?
          @photo=Photo.new

          @wall_pic_Photo = Photo.new
          @wall_pic_Photo_method = "create"

          @profil_pic_Photo = Photo.new
          @profil_pic_Photo_method = "create"

      end

      if Photo.find_by(role: "wall_pic", user_id: current_user.id).nil?
        @wall_pic_Photo = Photo.new
        @wall_pic_Photo_method = "create"
        @wall_pic_Photo_file = "/img/Inscrit_Wall_pic.png"
      else
        @wall_pic_Photo = Photo.find_by(role: "wall_pic", user_id: current_user.id)
        @wall_pic_Photo_method = "put"
        @wall_pic_Photo_file = "/uploads/"+@wall_pic_Photo.name
      end
      if Photo.find_by(role: "profil_pic", user_id: current_user.id).nil?
        @profil_pic_Photo = Photo.new
        @profil_pic_Photo_method = "create"
        @profil_pic_Photo_file = "/img/Inscrit_avatar.png"
      else
        @profil_pic_Photo = Photo.find_by(role: "profil_pic", user_id: current_user.id)
        @profil_pic_Photo_method = "put"
        @profil_pic_Photo_file = "/uploads/"+@profil_pic_Photo.name
      end


      if Photo.find_by(role: "wall_pic", user_id: current_user.id).nil?
        @wall_pic_Photo = Photo.new
        @wall_pic_Photo_method = "create"
        @wall_pic_Photo_file = "/img/Inscrit_Wall_pic.png"
      else
        @wall_pic_Photo = Photo.find_by(role: "wall_pic", user_id: current_user.id)
        @wall_pic_Photo_method = "put"
        @wall_pic_Photo_file = "/uploads/"+@wall_pic_Photo.name
      end
      if Photo.find_by(role: "profil_pic", user_id: current_user.id).nil?
        @profil_pic_Photo = Photo.new
        @profil_pic_Photo_method = "create"
        @profil_pic_Photo_file = "/img/Inscrit_avatar.png"
      else
        @profil_pic_Photo = Photo.find_by(role: "profil_pic", user_id: current_user.id)
        @profil_pic_Photo_method = "put"
        @profil_pic_Photo_file = "/uploads/"+@profil_pic_Photo.name
      end

  end
end
