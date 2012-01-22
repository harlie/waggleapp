# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

puts 'LETS MAKE SOME USERS'
@kara = User.create! :name => 'Kara', :email => 'kara@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << @kara.name

user = User.create! :name => 'Mark', :email => 'mark@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

user = User.create! :name => 'Gerson', :email => 'gerson@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

user = User.create! :name => 'Harlie', :email => 'harlie@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

@walker = User.create! :name => 'Walker', :email => 'walker@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << @walker.name

@user = User.create! :name => 'Owner', :email => 'owner@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

puts 'LETS MAKE SOME DOGS'
@cody = @user.pets.create! :name => 'Cody', :gender => 'm', :breed => 'Coton de Tulear', :birthdate => Date.new(2005,2,3)      
puts 'New pet created: ' << @cody.name

@mo = @user.pets.create! :name => 'Mo', :gender => 'm', :breed => 'Cockapoo', :birthdate => Date.new(2009,7,11)
puts 'New pet created: ' << @mo.name

@cin = @kara.pets.create! :name => 'Cinnamon', :gender => 'f', :breed => 'Miniature Pinscher', :birthdate => Date.new(2007,10,1)
puts 'New pet created: ' << @cin.name

puts 'NOW ADDING WALKERS'

@cin.addCaretaker(@walker)
@cody.addCaretaker(@walker)
@mo.addCaretaker(@walker)