class AddReservationGuestHostToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :reservation, foreign_key: true
    add_reference :reviews, :guest, foreign_key: { to_table: :users }
    add_reference :reviews, :host, foreign_key: { to_table: :users }
  end
end
