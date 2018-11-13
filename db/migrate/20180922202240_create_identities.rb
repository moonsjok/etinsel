class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
        t.string :typeannonceur
        t.string :name
        t.string :country
        t.string :city
        t.string :adress
        t.string :zip
        t.text :about,limit: 4294967295
        t.integer :user_id

        t.timestamps
    end
  end
end
