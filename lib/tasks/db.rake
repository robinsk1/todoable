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



  desc "projects"
   task :seed_projects => :environment do
    [Project].each(&:delete_all)
    user = User.find(2)

    puts user.inspect

    cities = {
     bcn: "Barcelona, Spain",
     mad: "Madrid, Spain",
     lnd: "London, United Kingdom",
     edn: "Edinburgh, United Kingdom",
     par: "Paris, France",
     rom: "Rome, Italy",
     ban: "Bangkok, Thailand",
     nyc: "New York, USA",
     ist: "Istanbul, Turkey",
     dub: "Dubai, United Arab Emirates",
     kul: "Kuala Lumpur, Malaysia",
     hnk: "Hong Kong, China",
     seo: "Seoul, South Korea",
     mil: "Milan, Italy",
     sha: "Shanghai, China",
     ams: "Amsterdam, Holland",
     tok: "Tokyo, Japan",
     vie: "Vienna, Austria",
     tap: "Taipei, Taiwan",
     riy: "Riyadh, Saudi Arabia",
     lan: "Los Angeles, USA"
    }


     cities.each do |k,v|
      prj = user.projects.build(:name => "stuff to do in #{v}",
                                      :description => "lorem ipsum improve stuff",
                                      :tag_list=> "stuff")

      prj.build_location(:city => v)

      prj.save!
      puts prj

      k = 1
      i = 10
      while k < i
        todo = prj.todos.build(:description => "todo #{k}", :status=> true)
        todo.save!
        k += 1
      end
     end

   end

end
