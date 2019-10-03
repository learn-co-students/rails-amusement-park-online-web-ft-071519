class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :nauseau_rating
      t.integer :happiness_rating
      t.integer :ticket_number
    end
  end
end
