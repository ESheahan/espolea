class AddAverageReviewToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :average_review, :float
  end
end
