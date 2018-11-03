class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy, :test]

  # GET /annonces
  # GET /annonces.json
  def index
    #@annonces = Annonce.all
    @user=current_user
    			if session[:sous_categorie].blank? && session[:pays].blank?
            		if params[:prix].to_s != "" && params[:demande].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where("prix "+params[:prix].to_s).order("id DESC").limit(params[:end]).offset(params[:start])
            		elsif params[:demande].to_s != ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:demande]).order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif  params[:offre].to_s != ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:offre]).order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif @annonces.nil?
            			 @annonces = Annonce.select(:id, :designation, :valide).order("id DESC").limit(params[:end]).offset(params[:start])
            		 end

    			elsif !session[:sous_categorie].blank? && !session[:pays].blank?

            		if params[:prix].to_s != "" && params[:demande].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where("prix "+params[:prix].to_s+"AND pays='"+session[:pays]+"' AND sous_categorie ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		elsif params[:demande].to_s != "" && params[:prix].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:demande]+"AND pays='"+session[:pays]+"' AND sous_categorie ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif  params[:offre].to_s != "" && params[:demande].to_s == "" && params[:prix].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:offre]+"AND pays='"+session[:pays]+"' AND sous_categorie ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif @annonces.nil?
            			 @annonces = Annonce.select(:id, :designation, :valide).where("pays='"+session[:pays]+"' AND sous_categorie ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 end
    			elsif session[:sous_categorie].blank? && !session[:pays].blank?
           		   if params[:prix].to_s != "" && params[:demande].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where("prix "+params[:prix].to_s+"AND pays='"+session[:pays]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		elsif params[:demande].to_s != "" && params[:prix].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:demande]+"AND pays='"+session[:pays]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif  params[:offre].to_s != "" && params[:demande].to_s == "" && params[:prix].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:offre]+"AND pays='"+session[:pays]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif @annonces.nil?
            			 @annonces = Annonce.select(:id, :designation, :valide).where("pays='"+session[:pays]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 end

    			elsif !session[:sous_categorie].blank? && session[:pays].blank?

            		if params[:prix].to_s != "" && params[:demande].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where("prix "+params[:prix].to_s+"sous_categorie  ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		elsif params[:demande].to_s != "" && params[:prix].to_s == "" && params[:offre].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:demande]+"sous_categorie  ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif  params[:offre].to_s != "" && params[:demande].to_s == "" && params[:prix].to_s == ""
            			 @annonces = Annonce.select(:id, :designation, :valide).where(categorie: params[:offre]+"AND sous_categorie ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 elsif @annonces.nil?
            			 @annonces = Annonce.select(:id, :designation, :valide).where("sous_categorie  ='"+session[:sous_categorie]+"'").order("id DESC").limit(params[:end]).offset(params[:start])
            		 end

end
  end

  # GET /annonces/1
  # GET /annonces/1.json
  def show
    @annonce = Annonce.find(params[:id])
    @user=User.find(@annonce.user_id)
    @photos =  @annonce.photos

    @message = Message.new
    if @user.online == 1
       @online = '<div class="font-weight-bold " ><span class="text-success">L\'annonceur est en ligne ;</span> envoyer lui un message .</div>'
    else
       @online = '<div class="font-weight-bold " ><span class="text-warning">L\'annonceur est deconnecté ;</span> laisser lui un message .</div>'
    end
    @annonceur = Identity.find_by(user_id: @annonce.user_id)
  end

  # GET /annonces/new
  def new
    @annonce = Annonce.new
    @user=current_user
  end

  # GET /annonces/1/edit
  def edit
      @annonce = Annonce.find(params[:id])
	    @user = User.find(@annonce.user_id)
  end

  # POST /annonces
  # POST /annonces.json
  def create
    @annonce = Annonce.new(annonce_params)
    @user=current_user
    respond_to do |format|
      if @annonce.save
          if Identity.find_by(user_id: current_user.id).nil?
             Identity.new(user_id: current_user.id).save
             format.html { redirect_to monprofil_path('identiter'), notice: "L'annonce a été créée avec succès. <br/> Veuillez completer maintenant votre identité." }
          else
              format.html { redirect_to @annonce, notice: "L\'annonce a été créée avec succès." }
              format.json { render :show, status: :created, location: @annonce }
          end
      else
        format.html { render :new }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annonces/1
  # PATCH/PUT /annonces/1.json
  def update
    respond_to do |format|
      if @annonce.update(annonce_params)
        format.html { redirect_to @annonce, notice: "L\'annonce a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @annonce }
      else
        format.html { render :edit }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annonces/1
  # DELETE /annonces/1.json
  def destroy
    @annonce.destroy
    respond_to do |format|
      format.html { redirect_to mesannonces_path, notice: "L\'annonce détruite avec succès." }
      format.json { head :no_content }
    end
  end

def signaler
    respond_to do |format|
         format.js
    end
end

def valider

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

   # Never trust parameters from the scary internet, only allow the white list through.
    def annonce_params
      #:photo_1,:photo_2,:photo_3,:photo_4,:photo_5,:photo_6,
      params.require(:annonce).permit(:designation,:categorie,:sous_categorie,:pays,:ville,:quartier,:je_suis_le,:tel,:description, :prix, :commission_agence,:minimum,:condition,:hopital,:marche,:ecole,:service_public,:aeroport,:supermarche,:hotel,:bar_restaurant,:mairie,:centre_de_loisir,:pharmacie,:pressing,:plage,:station_d_essence,:garage,:gare_routiere, :nbr_menage, :superficie, :chambre, :salon, :situe_dans, :cuisine, :douche, :wc,:climatisation,:brasseur,:parking,:electricite,:eau,:voirie,:terrasse,:jardin,:meubles,:cours,:machine_a_laver,:chauffe_eau_toilette,:placards,:fibre_optique,:adsl,:reseaux_mobile,:sat,:wimax,:blr,:tv,:debarras,:caution_electricite_eau,:localisation_longitude,:localisation_latitude,:user_id,photos:[])
    end

end
