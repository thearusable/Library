class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  private

    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end
  def my_reservations
  	render file: "readers#my_reservations"
  end
end

