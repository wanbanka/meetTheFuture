class AddIndexDecision < ActiveRecord::Migration[5.2]
  def change
      change_table :decisions do |t|
         t.belongs_to :futur, index: true 
      end
  end
end
