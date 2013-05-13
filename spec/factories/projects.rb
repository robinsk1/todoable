# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do |f|
    f.name "MyString"
    f.description "MyText"

    #factory :project_with_items do
    #      # posts_count is declared as an ignored attribute and available in
    #      # attributes on the factory, as well as the callback via the evaluator
    #      ignore do
    #        items_count 5
    #      end
    #
    #      # the after(:create) yields two values; the user instance itself and the
    #      # evaluator, which stores all values from the factory, including ignored
    #      # attributes; `create_list`'s second argument is the number of records
    #      # to create and we make sure the project is associated properly to the item
    #      after(:create) do |project, evaluator|
    #        FactoryGirl.create_list(:todo, evaluator.items_count, project: project)
    #      end
    #end


    after(:create) do |project|
      project.todos = create_list(:todo, 3)
    end
  end

end

