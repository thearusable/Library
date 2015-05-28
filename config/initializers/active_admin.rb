ActiveAdmin.setup do |config|
  
  config.site_title = "Library"
  config.comments = false

  config.authentication_method = :authenticate_librarian!

  config.current_user_method = :current_librarian

  config.logout_link_path = :destroy_librarian_session_path

  config.batch_actions = true

  config.default_per_page = 20

end

