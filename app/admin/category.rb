ActiveAdmin.register Category do

	filter :name 

	config.per_page = 30

	#index
    index do
      column :name
      column :booksCount
      actions
    end

end
