class AddPaperclipToWriter < ActiveRecord::Migration
  def change
  	add_attachment :writers, :image  
  end
end
