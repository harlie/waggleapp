class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name
  
  has_many :pets
  has_and_belongs_to_many :clientpets, :class_name => "Pet", :inverse_of => 'caretakers'
  
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
end

