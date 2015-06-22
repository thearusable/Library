class RegistrationsController < Devise::RegistrationsController

def after_update_path_for(resource)
      searching_reader_path
    end

end 