class CreateDecisionFuturs < ActiveRecord::Migration[5.2]
  def change
    create_table :decision_futurs do |t|
      t.references :decision, foreign_key: true
      t.references :futur, foreign_key: true

      t.timestamps
    end
  end
end
