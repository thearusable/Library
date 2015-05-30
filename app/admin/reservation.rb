ActiveAdmin.register Reservation do

  menu priority: 0

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
      column "Książka" do |r|
        if r.book_id?
          b = Book.find(r.book_id)
          link_to b.title, admin_book_path(b)
        end
      end
      column "Odebrano?", :received
      column "Zwrócono?", :returned
      column "Data Odebrania", :receivedDate
      column "Data Zwrócenia", :returnedDate
      column "Rezerwujący" do |r|
        obj = Reader.find(r.reader_id)
        link_to obj.name, admin_reader_path(obj)
      end 
      column "Ostatnia Aktualizacja", :updated_at
      actions
    end

    #update - do poprawy 
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły Rezerwacji" do
      f.input :received, :label => "Odebrano?"
      f.input :returned, :label => "Zwrócono?"
      #f.input :receivedDate, :label => "Data Odebrania" - to bedzie w modelu
      #f.input :returnedDate, :label => "Data Zwrócenia"
      end
      f.actions
    end

end
