class RemoveUserFromReview < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :user, foreign_key: true
  end
end
