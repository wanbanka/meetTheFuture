class ChangeMdp < ActiveRecord::Migration[5.2]
  def change
      rename_column :users, :mot_de_passe, :password
  end
end
