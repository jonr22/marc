class CreateDriverDivisions < ActiveRecord::Migration
  def change
    create_table :driver_divisions do |t|
      t.string :name

      t.timestamps
    end
  end
end
