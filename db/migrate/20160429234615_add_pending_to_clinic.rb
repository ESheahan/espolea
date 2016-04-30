class AddPendingToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :pending, :boolean
  end
end
