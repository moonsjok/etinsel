Rails.application.routes.draw do

    namespace :admin do
        resources :homes
        resources :pages
        resources :users
        resources :identities
        resources :annonces
        resources :annoncesmiseenavants
        resources :messages
		resources :administrateurs
		resources :publicites
        root to: "homes#index"
    end
	    resources :publicites
        resources :annoncesmiseenavants
        resources :contacts , only:[:new,:create], via: [:get, :post]
        resources :messages #PRIVE et PUBLIC
        resources :annonces #PRIVE et PUBLIC
        resources :identities  #PRIVE
        resources :photos	   #PRIVE
        #LES PAGES DISPONIBLES AU PUBLIQUES
		    # ETINSEL IMMOBILLIER 
				root 'publicpages#accueil'
				get 'cgu'=>'publicpages#cgu'
				get 'quisommesnous'=> 'publicpages#quisommesnous'
				get 'commentcamarche' =>'publicpages#commentcamarche'
				get 'lesannoncesde(/:id_annonceur)'=>'publicpages#lesannoncesde'
				get 'ajax(/:param0)(/:param1)(/:param2)' =>'myajaxs#ajax' , :as => :myajax
		    # ETINSEL RENCONTRE 
			    get 'rencontres' => 'rencontres#index'
			    get 'rencontres/profile' => 'rencontres#profile'
                		
			# ETINSEL BLOG 

        devise_for :users, path: 'users', controllers: {
			sessions: 'users/sessions',
			#registrations: 'users/registrations'
        }
		devise_for :administrateurs, path: 'administrateurs' 
		# , controllers: {
			# sessions: 'administrateurs/sessions',
			# registrations: 'administrateurs/registrations'
		# }

        #LES PAGES DONT L'ACCES EST PROTEGES
        authenticated :user do
            root 'privatepages#monprofil', via: [:get, :post]
            get 'chats' => 'chats#index', via: [:get, :post]
            get 'monprofil(/:contenu)' => 'privatepages#monprofil', :as => :monprofil , via: [:get, :post]
            get 'mesannonces'=>'privatepages#mesannonces'
        end
        # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
