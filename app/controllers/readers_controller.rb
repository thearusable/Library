class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  private

    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end
    def searching
  	render file: "readers#reader"
  end
  def my_reservations
  	render file: "readers#my_reservations"
  end
  def my_borrows
  	render file: "readers#my_borrows"
  end
  def my_statistics
  	render file: "readers#my_mystatistics"
  end
end

