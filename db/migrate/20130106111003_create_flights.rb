class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.datetime :in
      t.datetime :on
      t.datetime :out
      t.datetime :off
      t.string :source
      t.string :dest
      t.string :desc

      t.timestamps
    end
  end
end
