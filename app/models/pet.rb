class Pet
  include Mongoid::Document
  field :name, :type => String
  field :birthdate, :type => Date
  
  has_and_belongs_to_many :users 
  
  validates_presence_of :name
  
end
