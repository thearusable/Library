class ReservationsController < InheritedResources::Base

	def destroy
	@reservation = Reservation.find(params[:id])
    @reservation.destroy
    
    redirect_to my_reservations_reader_path(current_reader)
 	end


end