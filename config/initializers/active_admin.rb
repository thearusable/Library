ActiveAdmin.setup do |config|
  
  config.site_title = "lib15"
  config.comments = false

  config.authentication_method = :authenticate_librarian!

  config.current_user_method = :current_librarian

  config.logout_link_path = :root_path

  config.batch_actions = true

end

