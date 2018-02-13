require 'test_helper'

class GossipTest < ActiveSupport::TestCase
  
test "should not save article without title" do
  gossip = gossip.new
  assert_not gossip.save
end

end
