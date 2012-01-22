class Update
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note, :type => String
  field :name, :type => String
  field :poster, :type => String
  
  embedded_in :pet, :inverse_of => :updates
  
  
end
