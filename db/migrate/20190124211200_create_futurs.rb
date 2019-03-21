class CreateFuturs < ActiveRecord::Migration[5.2]
  def change
    create_table :futurs do |t|
      t.string :titre
      t.text :description

      t.timestamps
    end
  end
end
