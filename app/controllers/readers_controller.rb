class ReadersController < InheritedResources::Base

  private

    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end
end

