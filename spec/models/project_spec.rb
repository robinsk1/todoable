require 'spec_helper'

describe Project do

    it 'has valid factories' do
      project = FactoryGirl.build(:project)
      project.valid?.should be_true
    end

    describe 'instance' do
      before(:each) do
        @project = FactoryGirl.create(:project)
      end

      it 'should retrieve project todos' do
        @project.items.length == 3
      end

      it 'should check if a project is complete' do
        puts @project.items.inspect.to_yaml
        @project.done?.should be_false
      end

      it 'should retrieve hash of grouped items by day' do
        @project.items_by_days.should ""
      end

      it 'should retrieve todos created today' do
        @project.recent_items.should ""
      end

    end

end
