class HostReviewsController < ApplicationController

  def create
    # Step 1Check if the reservation exist (rooms_id, guest_id, host_id)

    # Step 2 Check if current host already reviewed the guest in this reservation

    @reservation = Reservation.where(
                    id: host_review_params[:reservation_id],
                    room_id: host_review_params[:room_id],
                    user_id: host_review_params[:guest_id]
                    ).first

    if !@reservation.nil?
      @has_reviewed = HostReview.where(
                      reservation_id: @reservation_id,
                      guest_id: host_review_params[:guest_id]
                      ).first

          if @has_reviewed.nil?
            #allow to review
            @host_review = current_user.host_reviews.create(host_review_params)
            flash[:success] = "Review created..."
          else
            flash[:success] = "You already reviewd this reservation"
          end

    else
      flash[:alert] = "Not found this reservation"
    end


    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @host_review = Review.find(params[:id])
    @host_review.destroy

    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end




private
  def host_review_params
    params.require(:host_review).permit(:comment, :star, :room_id, :reservation_id, :guest_id)
  end
end
