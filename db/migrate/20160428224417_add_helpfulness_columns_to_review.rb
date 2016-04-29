class AddHelpfulnessColumnsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :helpful, :integer
    add_column :reviews, :unhelpful, :integer
    add_column :reviews, :percent_helpful, :float
    add_reference :reviews, :helpful_list, index: true, foreign_key: true
    add_reference :reviews, :unhelpful_list, index: true, foreign_key: true
  end
end
