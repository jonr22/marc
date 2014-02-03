class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.date :date
      t.string :venue
      t.text :notes
      t.references :season, index: true

      t.timestamps
    end
  end
end
