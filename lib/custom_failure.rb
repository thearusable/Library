class CustomFailure < Devise::FailureApp
  def redirect_url
    if warden_options[:scope] == :reader
      register_path
    else
      new_user_registration_path
    end
  end
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end

  def redirect
    store_location!
    flash[:alert] = i18n_message unless flash[:notice]
    redirect_to '/'
  end
end