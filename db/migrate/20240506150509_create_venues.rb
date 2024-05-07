class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.string :venue_type
      t.string :details
      t.boolean :available, default: false

      t.timestamps
    end
  end
end
