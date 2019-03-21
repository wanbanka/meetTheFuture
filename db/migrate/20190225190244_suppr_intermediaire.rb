class SupprIntermediaire < ActiveRecord::Migration[5.2]
  def change
      drop_table :decision_futurs
  end
end
