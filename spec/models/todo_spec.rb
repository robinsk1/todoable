require 'spec_helper'

describe Todo do

    describe 'associations' do
      it { should belong_to :project }
    end

end
