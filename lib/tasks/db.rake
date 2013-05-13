namespace :db do
  desc "TODO"
  task :seed_test_data => :environment do

    [Project].each(&:delete_all)

    a = Project.create(:name => "improve", :description => "lorem ipsum improve stuff")

    a.todos.create(:description => "todo 1", :status=> true)
    a.todos.create(:description => "todo 2", :status=> false)
    a.todos.create(:description => "todo 3", :status=> true)
    a.todos.create(:description => "todo 4", :status=> false)
    a.todos.create(:description => "todo 5", :status=> true)
    a.todos.create(:description => "todo 6", :status=> true)

  end

end
