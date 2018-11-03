class PublicpagesController < ApplicationController

      def accueil
          @accueil = Page.find(1)
          @annonce_id =[]
          for mise_en_avant in Annoncesmiseenavant.select('annonce_id').limit(3).order('created_at DESC')
              @annonce_id.push(mise_en_avant.annonce_id.to_i)
          end
              @annonces = Annonce.find(@annonce_id)
			end

      def quisommesnous
          @quisommesnous = Page.find(2)
      end

      def commentcamarche
          @commentcamarche = Page.find(3)
      end

      def cgu
          @cgu = Page.find(4)
      end

      def contact
      end

      def annonce
      end

      def lesannoncesde
          @id_annonceur = params[:id_annonceur]
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
