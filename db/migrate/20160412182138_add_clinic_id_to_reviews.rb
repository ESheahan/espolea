class AddClinicIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :clinic_id, :integer
  end
end
