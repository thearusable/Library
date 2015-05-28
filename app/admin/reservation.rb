ActiveAdmin.register Reservation do

  permit_params :received, :returned, :receivedDate, :returnedDate

	config.per_page = 30

  actions :index, :new, :create, :update, :edit, :destroy

  scope :all, :default => true
  scope :NieOdebrano do |r|
    Reservation.where({received: false})
  end
  scope :NieZwrócono do |r|
    Reservation.where({returned: false})
  end
  scope :UpłynełaDataOddania do |r|
    Reservation.where(['receivedDate > ?', Date.today])
  end
  scope :UpłynełaDataZwrócenia do |r|
    Reservation.where(['returnedDate > ?', Date.today])
  end

    #filters
    filter :received, :label => "Odebrano?"
    filter :returned, :label => "Zwrócono?"
    filter :reader, :as => :select, :label => "Czytelnik"
    filter :receivedDate, :label => "Data Odebrania"
    filter :returnedDate, :label => "Data Zwrócenia"
    filter :updated_at, :label => "Data Aktualizacji"

	#index
    index do
      selectable_column
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
      column "Czytelnik" do |r|
        obj = Reader.find(r.reader_id)
        link_to obj.name + " " + obj.lastname, admin_reader_path(obj)
      end 
      column "Ostatnia Aktualizacja", :updated_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły Rezerwacji" do
      f.input :received, :label => "Odebrano?"
      f.input :returned, :label => "Zwrócono?"
      f.input :receivedDate, :label => "Data Odebrania"
      f.input :returnedDate, :label => "Data Zwrócenia"
      end
      f.actions
    end

end
