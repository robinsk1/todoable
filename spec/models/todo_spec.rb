require 'spec_helper'

describe Todo do

  it 'has valid factories' do
      todo = FactoryGirl.build(:todo)
      todo.valid?.should be_true
  end

end
