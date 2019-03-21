class AddSecondFuture < ActiveRecord::Migration[5.2]
  def change
      add_column :decisions, :second_futur, :string
  end
end
