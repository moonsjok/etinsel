class CreatePublictchats < ActiveRecord::Migration[5.2]
  def change
    create_table :publictchats do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
