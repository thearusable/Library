ActiveAdmin.register Review do

  permit_params :score, :comment, :book_id, :reader_id

  actions :index, :new, :create, :update, :edit, :destroy

  scope :all, :default => true
  scope :"1" do |r|
    Review.where({score: 1})
  end
  scope :"2" do |r|
    Review.where({score: 2})
  end
  scope :"3" do |r|
    Review.where({score: 3})
  end
  scope :"4" do |r|
    Review.where({score: 4})
  end
  scope :"5" do |r|
    Review.where({score: 5})
  end
  scope :"6" do |r|
    Review.where({score: 6})
  end
  scope :"7" do |r|
    Review.where({score: 7})
  end
  scope :"8" do |r|
    Review.where({score: 8})
  end
  scope :"9" do |r|
    Review.where({score: 9})
  end
  scope :"10" do |r|
    Review.where({score: 10})
  end

 #filters
    filter :score, :label => "Ocena"
    filter :comment, :label => "Komentarz"
    filter :book, :as => :select, :label => "Książka"
    filter :reader, :as => :select, :label => "Czytelnik"
    filter :updated_at, :label => "Data Aktualizacji"

	#index
    index do
      selectable_column
      column "Ocena", :score
      column "Komentarz", :comment
      column "Książka" do |r|
  		link_to Book.find(r.book_id).title, admin_book_path(r.book_id)
	  end 
	  column "Czytelnik" do |r|
  		obj = Reader.find(r.reader_id)
  		link_to obj.name + " " + obj.lastname, admin_reader_path(obj)
	  end 
      column "Data Aktualizacji", :updated_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :score, :label => "Ocena"
      f.input :comment, :label => "Komentarz"
      f.input :book, :label => "Książka"
      f.input :reader, :label => "Czytelnik"
      end
      f.actions
    end

end
