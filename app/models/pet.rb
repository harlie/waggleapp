class Pet
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :name, :type => String
  field :birthdate, :type => Date
  
  belongs_to :user
  embeds_many :updates
  
  validates_presence_of :name
  
end
