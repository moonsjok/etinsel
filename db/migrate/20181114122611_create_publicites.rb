class CreatePublicites < ActiveRecord::Migration[5.2]
  def change
    create_table :publicites do |t|
	  t.string :pays
	  t.string :ville
	  t.string :quartier
	  
      t.string :resolution
      t.string :entreprise
      t.string :duree

      t.timestamps
    end
  end
end
