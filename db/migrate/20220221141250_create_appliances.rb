class CreateAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :appliances do |t|
      t.string :title
      t.string :description
      t.references :user
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
