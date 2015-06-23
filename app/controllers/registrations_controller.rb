class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def create
    build_resource(sign_up_params)
    if resource.save
     if resource.active_for_authentication?
      sign_up(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)
     else
      expire_session_data_after_sign_in!
      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
     end
    else

     clean_up_passwords resource
     
     resource.errors.full_messages.each do |m|
      if flash[:alert].blank? 
        flash[:alert] = [m]
      else
        flash[:alert] << m
      end
     end
     redirect_to register_path
    end



   end


  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      #respond_with resource
      resource.errors.full_messages.each do |m|
      if flash[:alert].blank? 
        flash[:alert] = [m]
      else
        flash[:alert] << m
      end
     end
      redirect_to editProfile_reader_path(resource)
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :name << :phone << :adress << :email
    devise_parameter_sanitizer.for(:sign_up) << :name << :phone << :adress << :email
    devise_parameter_sanitizer.for(:account_update) << :name << :phone << :adress << :email
  end

  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end


end 