class CreateUtilisateurDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_decisions do |t|
      t.references :decision, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
