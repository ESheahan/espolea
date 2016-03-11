class RenameColumnMunicipioInClinicsToMunicipality < ActiveRecord::Migration
  def change
    rename_column :clinics, :municipio, :municipality
  end
end
