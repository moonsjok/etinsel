class CreateAnnoncesmiseenavants < ActiveRecord::Migration[5.2]
  def change
    create_table :annoncesmiseenavants do |t|
      t.references :annonce, foreign_key: true

      t.timestamps
    end
  end
end
