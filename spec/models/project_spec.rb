require 'spec_helper'

describe Project do

    it 'has valid factories' do
      project = Factory.build(:project)
      project.valid?.should be_true
    end

    describe 'instance' do
      before(:each) do
        @project = Factory(:project, :name => "stuff", :description => "lorem ipsum")
        @todo_1 = Factory(:todo, :description => "Sell surf board", :status => true, :project_id => @project.id)
        @todo_2 = Factory(:todo, :description => "learn clarinet", :status => true, :project_id => @project.id)
        @todo_3 = Factory(:todo, :description => "write novel", :status => false, :project_id => @project.id)
      end
      it 'should retrieve project todos' do
        @project.items.count.should == 3
      end

      it 'should check if a project is complete' do
        @project.items.done?.should be_false
      end

      it 'should retrieve hash of grouped items by day' do
        @project.items.items_by_days.should ""
      end

      it 'should retrieve todos created today' do
        @project.items.recent_items.should ""
      end

    end

end
