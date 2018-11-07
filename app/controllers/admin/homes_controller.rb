module Admin
  class HomesController < Admin::ApplicationController
     def index
	    @totalAnnonce = Annonce.count
		@totalInscrit = User.count
		
     end

     def annonces

     end


  end
end