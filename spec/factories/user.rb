FactoryGirl.define do
	#We can create a different email for each user in the factories, this resolve the problem of uniquenesss
	
	sequence :email do |n|
		"user#{n}@test.com"
	end

	factory :user do
		first_name			"project"
		last_name				"manager"
		email					{ generate :email }
		password			  	"asdfasdf"
		password_confirmation 	"asdfasdf"
	end

	factory :other_user, class: "User" do
		first_name				"other"
		last_name				"user"
		email					{ generate :email }
		password 				"asdfasdf"
		password_confirmation   "asdfasdf"
	end

end