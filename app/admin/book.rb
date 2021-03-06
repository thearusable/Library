ActiveAdmin.register Book do

    menu prority: 2

    permit_params :title, :image, :publishingHouse, :ISBN, :releaseDate,  :description

    actions :index, :new, :create, :update, :edit, :destroy

    config.per_page = 50
    config.batch_actions = false

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
      column "Tytuł" do |b|
        link_to b.title, edit_admin_book_path(b)
      end
      column "Rezerwujący" do |b|
        if b.current_reservation_id?
          r = Reservation.find(b.current_reservation_id)
          re = Reader.find(r.reader_id)
          link_to re.name, edit_admin_reservation_path(r)
        end
      end
      column "Kategoria" do |b|
        link_to Category.find(b.category_id).name, edit_admin_category_path(b) 
      end
      column "Autor" do |b|
        b.writers.map{|w| w.name}.join(", ")
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
      f.input :category_id, :as => :select, collection: Category.all
      f.input :publishingHouse, :label => "Wydawnictwo"
      f.input :ISBN, :label => "Numer ISBN"
      f.input :releaseDate, :label => "Data Wydania"
      f.input :description, :label => "Opis"
      end
      f.actions
    end

end
