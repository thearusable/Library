ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Wybrane więcej niż 90 dni temu." do
          ul do
            r = Reservation.where(["receivedDate < ?" , Date.today - 90.days]).order("updated_at desc").limit(15).map do |r|
              book = Book.find(r.book_id)
              li link_to(book.title, edit_admin_reservation_path(r))
            end
            if r.empty?
              "Brak Rezerwacji Do Wyświetlenia"
            end
          end
        end
        panel "Ostatnio Zarezerwowane Książki." do
          ul do
            Reservation.order("updated_at desc").limit(15).map do |r|
              book = Book.find(r.book_id)
              li link_to(book.title, edit_admin_reservation_path(r))
            end
          end
        end
      end 
      column do
        panel "Najnowsi użytkownicy." do
          ul do
            Reader.order("created_at desc").limit(15).map do |r|
              li link_to(r.name, edit_admin_reader_path(r))
            end
          end
        end
      end
    end

    # end
  end # content
end

=begin
ActiveAdmin::Dashboard.build do
  section "Your tasks for this week" do
    table_for current_admin_user.tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now) do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, admin_task_path(task) }
      t.column("Assigned To") { |task| task.admin_user.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    end
  end
 
  section "Tasks that are late" do
    table_for current_admin_user.tasks.where('due_date < ?', Time.now) do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, admin_task_path(task) }
      t.column("Assigned To") { |task| task.admin_user.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    end
  end
end
=end