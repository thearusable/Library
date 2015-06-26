class PasswordsController < Devise::PasswordsController
  #protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    login_path
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])

    if resource.errors.empty?
      set_flash_message(:notice, :send_instructions) if is_navigational_format?
      redirect_to login_path
    else
      flash[:alert] = "Nie znaleziono podanego adresu!"
      redirect_to forgottenPassword_path

    end
  end

end