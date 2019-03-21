class AjoutTheme < ActiveRecord::Migration[5.2]
  def change
      add_column :themes, :texte_depart, :text
  end
end
