class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  private

    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end
end

