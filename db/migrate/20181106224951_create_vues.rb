class CreateVues < ActiveRecord::Migration[5.2]
  def change
    create_table :vues do |t|
      t.references :annonce, foreign_key: true
      t.string :pays
      t.string :ville
      t.string :quartier
      t.integer :user_id

      t.timestamps
    end
  end
end
