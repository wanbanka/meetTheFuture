class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.string :titre
      t.text :description
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
