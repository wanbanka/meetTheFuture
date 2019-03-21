class AddBooleanDecision < ActiveRecord::Migration[5.2]
  def change
      add_column :decisions, :first_decision, :boolean
  end
end
