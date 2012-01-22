class Pet
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::Paperclip

  field :name, :type => String
  field :birthdate, :type => Date
  field :breed, :type => String
  field :gender, :type => String
  
  belongs_to :user
  embeds_many :updates
  
  has_mongoid_attached_file :avatar
  
  
  
  validates_presence_of :name
  
end
