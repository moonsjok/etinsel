class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer  :user_id
      t.integer  :destinataire
      t.text     :message
      t.integer  :status, default:0

      t.timestamps
    end
  end
end
