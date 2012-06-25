require 'spec_helper'

describe ApplicationHelper do
  
  describe "#format_price" do
    
    it { format_price(300).should == "$3" }

    it { format_price(299).should == "$2.99" }

    it { format_price(250).should == "$2.50" }

  end
  
end