Rails.application.routes.draw do

    namespace :admin do
        resources :homes
        resources :pages
        resources :users
        resources :identities
        resources :annonces
        resources :annoncesmiseenavants
        resources :messages
        # resources :chats
        # resources :photos
        # resources :publictchats
		resources :administrateurs
        root to: "homes#index"
    end
      resources :annoncesmiseenavants
      resources :publictchats
      resources :contacts , only:[:new,:create]
      resources :messages #PRIVE et PUBLIC
      resources :annonces #PRIVE et PUBLIC
      resources :identities  #PRIVE
      resources :photos	   #PRIVE
      #LES PAGES DISPONIBLES AU PUBLIQUES
      root 'publicpages#accueil'
      get 'cgu'=>'publicpages#cgu'
      get 'quisommesnous'=> 'publicpages#quisommesnous'
      get 'commentcamarche' =>'publicpages#commentcamarche'
      get 'lesannoncesde(/:id_annonceur)'=>'publicpages#lesannoncesde'
      get 'ajax(/:param0)(/:param1)(/:param2)' =>'myajaxs#ajax' , :as => :myajax



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
          root 'privatepages#monprofil'
          get 'chats' => 'chats#index'
          get 'monprofil(/:contenu)' => 'privatepages#monprofil', :as => :monprofil
          get 'mesannonces'=>'privatepages#mesannonces'
      end
     # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
