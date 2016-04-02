class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :treatment_options
      t.integer :the_clinic
      t.integer :clinics_identification

      t.timestamps null: false
    end
  end
end
