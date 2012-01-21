class Update
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :note, :type => String
  
  embedded_in :pet
end
