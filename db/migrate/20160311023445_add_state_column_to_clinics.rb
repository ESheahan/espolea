class AddStateColumnToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :state, :string
  end
end
