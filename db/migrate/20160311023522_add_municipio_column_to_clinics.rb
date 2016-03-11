class AddMunicipioColumnToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :municipio, :string
  end
end
