class CreateAnnonces < ActiveRecord::Migration[5.2]
  def change
    create_table :annonces do |t|
      t.string :designation
     t.string :categorie
     t.string :sous_categorie
     t.string :pays
     t.string :ville
     t.string :quartier
     t.string :je_suis_le
     t.string :tel
     t.text :description,limit: 4294967295
     t.integer :prix ,limit: 50
     t.integer :commission_agence ,limit: 50
     t.string :minimum
     t.string :condition

     t.integer :nbr_menage
     t.integer :superficie
     t.integer :chambre
     t.integer :salon
     t.string  :situe_dans
     t.integer :cuisine
     t.integer :douche
     t.integer :wc
##################### POUR LES CHECKBOX ###################
     t.boolean :hopital, :default => false
     t.boolean :marche, :default => false
     t.boolean :ecole, :default => false
     t.boolean :service_public, :default => false
     t.boolean :aeroport, :default => false
     t.boolean :supermarche, :default => false
     t.boolean :hotel, :default => false
     t.boolean :bar_restaurant, :default => false
     t.boolean :mairie, :default => false
     t.boolean :centre_de_loisir, :default => false
     t.boolean :pharmacie, :default => false
     t.boolean :pressing, :default => false
     t.boolean :plage, :default => false
     t.boolean :station_d_essence, :default => false
     t.boolean :garage, :default => false
     t.boolean :gare_routiere, :default => false

     t.boolean  :climatisation, :default => false
     t.boolean :brasseur, :default => false
     t.boolean :parking, :default => false
     t.boolean :electricite, :default => false
     t.boolean :eau, :default => false
     t.boolean :voirie, :default => false
     t.boolean :terrasse, :default => false
     t.boolean :jardin, :default => false
     t.boolean :meubles, :default => false
     t.boolean :cours, :default => false
     t.boolean :machine_a_laver, :default => false
     t.boolean :chauffe_eau_toilette, :default => false
     t.boolean :placards, :default => false
     t.boolean :fibre_optique, :default => false
     t.boolean :adsl, :default => false
     t.boolean :reseaux_mobile, :default => false
     t.boolean :sat, :default => false
     t.boolean :wimax, :default => false
     t.boolean :blr, :default => false
     t.boolean :tv, :default => false
     t.boolean :debarras, :default => false
     t.boolean :valide, :default => false
     t.boolean :signale, :default => false


     t.string :caution_electricite_eau
     t.string :localisation_longitude
     t.string :localisation_latitude

     t.integer :user_id

     t.timestamps
    end
  end
end
