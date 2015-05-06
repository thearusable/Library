ActiveAdmin.register Librarian do
  #manage librarians only for admin
  menu :if => proc { current_librarian.admin? }

  permit_params :name, :lastname, :admin, :email, :password, :password_confirmation 


  index do 
    selectable_column
    id_column
    column :name
    column :lastname
    column :admin
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  
  filter :name
  filter :lastname
  filter :admin
  filter :email

  form do |f|
    f.inputs "Informacje" do
      f.input :name
      f.input :lastname
      f.input :admin
      f.input :email
    end
    f.actions
  end

end
