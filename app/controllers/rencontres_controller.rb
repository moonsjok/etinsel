class RencontresController < ApplicationController
  def index
  end
  def profile
         @id_annonceur = params[:format]
          @identite_annonceur = Identity.find_by(user_id: @id_annonceur)
          @user = User.find_by(@id_annonceur)
          @total_annonce = Annonce.select(:id).where(user_id: @id_annonceur).count
          if Photo.find_by(role: "wall_pic", user_id: @id_annonceur).nil?
             @photo_wall_annonceur = "Inscrit_Wall_pic.png"
       else
            @photo_wall_annonceur = Photo.find_by(user_id: @id_annonceur, role: "wall_pic").name
       end

          if Photo.find_by(role: "profil_pic", user_id: @id_annonceur).nil?
          @photo_profil_annonceur = "Inscrit_avatar.png"
        else
         @photo_profil_annonceur = Photo.find_by(user_id: @id_annonceur, role: "profil_pic").name
       end

  end
end
