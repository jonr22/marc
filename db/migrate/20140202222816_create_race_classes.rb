class CreateRaceClasses < ActiveRecord::Migration
  def change
    create_table :race_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
