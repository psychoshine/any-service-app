class AddReservationTimesToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :reservation_time, :time
  end
end
