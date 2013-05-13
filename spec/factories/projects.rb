# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do |f|
    f.name "MyString"
    f.description "MyText"

    before(:create) do |project|
      a = project.todos
      a << FactoryGirl.build(:todo, project: project, description: "bla bla bla", status: true)
      a << FactoryGirl.build(:todo, project: project, description: "bla bla bla", status: true)
      a << FactoryGirl.build(:todo, project: project, description: "bla bla bla", status: false)
    end
  end

end

