ActiveAdmin.register Book do


permit_params :title, :author

index do 
    selectable_column
    id_column 
    column "Tytuł:", :title
    column "Pisarz:", :author
    column "Dodano:", :created_at
    actions
  end

  filter :title
  filter :author

end
