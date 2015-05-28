ActiveAdmin.register Book do

    permit_params :title, :image, :publishingHouse, :ISBN, :releaseDate,  :description

    actions :index, :new, :create, :update, :edit

    config.per_page = 30

    #filters
    filter :category, :label => "Kategoria"
    filter :writers, :as => :select, :label => "Autor"
    filter :title, :label => "Tytuł"
    filter :publishingHouse, :label => "Wydawnictwo"
    filter :ISBN, :label => "ISBN"
    filter :releaseDate, :label => "Rok Wydania"
    filter :description, :label => "Opis"
    #index
    index do
      selectable_column
      column "Okładka" do |book|
        image_tag(book.image(:thumb))
      end
      column "Tytuł", :title
      column "Zarezerwowane Przez" do |b|
        if b.current_reservation_id?
          r = Reservation.find(b.current_reservation_id)
          re = Reader.find(r.reader_id)
          link_to re.name + " " + re.lastname, admin_reservation_path(r)
        end
      end
      column "Kategoria" do |b|
        link_to Category.find(b.category_id).name, admin_category_path(b) 
      end
      column "Autor" do |b|
        b.writers.map{|w| w.name + " " + w.lastname}.join(", ")
      end 
      column "Średnia Ocen", :averageRating
      column "Wydawnictwo", :publishingHouse
      column "ISBN", :ISBN
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :title, :label => "Tytuł"
      f.input :image, :as => :file, :label => "Okładka", :hint => image_tag(f.object.image.url(:medium))
      f.input :publishingHouse, :label => "Wydawnictwo"
      f.input :ISBN, :label => "ISBN"
      f.input :releaseDate, :label => "Data Wydania"
      f.input :description, :label => "Opis"
      end
      f.actions
    end

end
