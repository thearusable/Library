ActiveAdmin.register Category do

	filter :name 

	config.per_page = 30

	#index
    index do
    selectable_column
      column :name
      column :booksCount
      actions
    end

end
