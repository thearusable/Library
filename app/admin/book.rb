ActiveAdmin.register Book do

    menu prority: 1

    permit_params :title, :image, :publishingHouse, :ISBN, :releaseDate,  :description

    actions :index, :new, :create, :update, :edit

    config.per_page = 50
    config.batch_actions = false

    #sidebar :Informacje do 
    #  table_for writers do |w|
    #    column "Received On" do
    #         link_to w.name, admin_writer_path(w)
    #      end 
    #  end
    #end

    #filters
    filter :category, :label => "Kategoria",collection: proc{ Category.order(:name) }
    filter :writers, :as => :select, :label => "Autor", collection: proc{ Writer.order(:name) }
    filter :title, :label => "Tytuł"
    filter :publishingHouse, :label => "Wydawnictwo"
    filter :ISBN, :label => "Numer ISBN"
    filter :releaseDate, :label => "Rok Wydania"
    filter :description, :label => "Opis"
    #index
    index do
      column "Okładka" do |book|
        image_tag(book.image(:thumb))
      end
      column "Tytuł", :title
      column "Rezerwujący" do |b|
        if b.current_reservation_id?
          r = Reservation.find(b.current_reservation_id)
          re = Reader.find(r.reader_id)
          link_to re.name, admin_reservation_path(r)
        end
      end
      column "Kategoria" do |b|
        link_to Category.find(b.category_id).name, admin_category_path(b) 
      end
      column "Autor" do |b|
        b.writers.map{|w| w.name}.join(", ")
      end 
      column "Średnia Ocen", sortable: :averageRating do |b|
        if b.averageRating != nil
          b.averageRating 
        else 
          "Brak Ocen"
        end
      end 
      column "Wydawnictwo", :publishingHouse
      column "Numer ISBN", :ISBN
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :title, :label => "Tytuł"
      f.input :image, :as => :file, :label => "Okładka", :hint => image_tag(f.object.image.url(:medium))
      f.input :publishingHouse, :label => "Wydawnictwo"
      f.input :ISBN, :label => "Numer ISBN"
      f.input :releaseDate, :label => "Data Wydania"
      f.input :description, :label => "Opis"
      end
      f.actions
    end

end
