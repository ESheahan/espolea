class AddHelpfulnessToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :helpfulness, :integer
  end
end
