ActiveAdmin.register Reservation do

  menu priority: 1

  permit_params :received, :returned, :receivedDate, :returnedDate


  actions :index, :new, :create, :update, :edit, :destroy

  config.per_page = 50
  config.batch_actions = false

  scope :all, :default => true
  scope :NieOdebraneKsiążki do |r|
    Reservation.where({received: false})
  end
  scope :NieZwróconeKsiążki do |r|
    Reservation.where({returned: false})
  end

    #filters
    filter :received, :label => "Odebrano?"
    filter :returned, :label => "Zwrócono?"
    filter :reader, :label => "Rezerwujący", collection: proc{ Reader.order(:name) }
    filter :receivedDate, :label => "Data Odebrania"
    filter :returnedDate, :label => "Data Zwrócenia"
    filter :updated_at, :label => "Data Aktualizacji"

	#index
    index do
      column "Książka"  do |r|
        if r.book_id?
          b = Book.find(r.book_id)
          link_to b.title, edit_admin_book_path(b)
        end
      end
      column "Książka Odebrana?", :received
      column "Książka Zwrócona?", :returned
      column "Data Odebrania", :receivedDate
      column "Data Zwrócenia", :returnedDate
      column "Rezerwujący" do |r|
        obj = Reader.find(r.reader_id)
        link_to obj.name, edit_admin_reader_path(obj)
      end 
      column "Ostatnia Aktualizacja", :updated_at
      actions
    end

    #update - do poprawy 
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły Rezerwacji" do
      f.input :received, :label => "Książka została odebrana z biblioteki."
      f.input :returned, :label => "Książka została zwrócona do biblioteki."
      end
      f.actions
    end

end
