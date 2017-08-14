class ReservationsController < ApplicationController
	before_action :authenticate_user!

def preload
	room = Room.find(params[:room_id])
	today = Date.today
	reservations = room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

	render json: reservations
end

	def preview
		start_date = Date.parse(params[:start_date])
		end_date = Date.parse(params[:end_date])

		output = {
			conflict: is_conflict(start_date, end_date)
		}

		render json: output
	end
	def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:alert] = "You cannot book your own property!"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room = room
      @reservation.price = room.price
      @reservation.total = room.price * days
      @reservation.save

      flash[:notice] = "Booked Successfully!"
    end
    redirect_to room
  end

	def your_trips
		@trips = current_user.reservations
	end

	def your_reservations
		@rooms = current_user.rooms
	end

	private
		def is_conflict(start_date, end_date)
			room = Room.find(params[:room_id])

			check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
			check.size > 0? true : false
		end
		def reservation_params
			params.require(:reservation).permit(:start_date, :end_date)
		end
end
