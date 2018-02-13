require 'rails_helper'

user = User.create(username: 'monUser', email: 'useremail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')

RSpec.describe Gossip, type: :model do
	it "with content and user association is valid" do
		g = Gossip.create(content: 'MonGossip')
		user.gossips << g
		expect(g.valid?).to be true
	end

	it "without user association is not valid" do
		g = Gossip.create(content: 'MonGossip')
		expect(g.valid?).to be false
	end

	it "without content is not valid" do
		g = Gossip.new
		user.gossips << g
		expect(g.valid?).to be false
	end

	it "should associate a gossip to a user" do
		gossip = Gossip.create(content: 'MonGossip')
		user.gossips << gossip
		expect(gossip.user_id).to(eq(user.id))
	end
end