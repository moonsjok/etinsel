class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content, limit:4294967295

      t.timestamps
    end
  end
end
