require 'rails_helper'



RSpec.describe User, type: :model do
	it "with username, email, password, password_confirmation and sign_up_code is valid" do
		user = User.create(username: 'myyyUsername', email: 'myyyemail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')		
		expect(user.valid?).to be true
	end

	it "without username is not valid" do
		user = User.create(email: 'myyemail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')		
		expect(user.valid?).to be false
	end

	it "without email is not valid" do
		user = User.create(username: 'myyUsername', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')		
		expect(user.valid?).to be false
	end

	it "should return users's validity is false when email is already used" do
		user = User.create(username: 'myyUsername', email: 'myyemail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')
		user1 = User.create(username: 'myyUsername1', email: 'myyemail@gmail.com', password: 'monpassword1', password_confirmation: 'monpassword1', sign_up_code: 'THPGOSSIPS')		
		expect(user1.valid?).to be false
	end


	it "email form must be valid" do
		user = User.create(username: 'myyUsername', email: 'mjsydhevr', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')		
		expect(user.valid?).to be false

	end

	it "password must be present" do
		user = User.create(username: 'myyUsername', email: 'myyemail@gmail.com', sign_up_code: 'THPGOSSIPS')		
		expect(user.valid?).to be false
	end

	it "sign_up_code must be present" do
		user = User.create(username: 'myyUsername', email: 'myyemail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword')		
		expect(user.valid?).to be false
	end

	it "should be associated with gossip" do
		user = User.create(username: 'myyUsername', email: 'myyemail@gmail.com', password: 'monpassword', password_confirmation: 'monpassword', sign_up_code: 'THPGOSSIPS')		
		gossip = Gossip.create(content: 'Gossip!Gossip!Gossip!Gossip!')
		user.gossips << gossip
		expect(gossip.user_id).to(eq(user.id))
	end
end