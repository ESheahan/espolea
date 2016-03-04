class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :website

      t.timestamps null: false
    end
  end
end
