class HomeController < ApplicationController
  
  def home
    
  end
  
  def index
    if (current_user) 
      @pet_list = current_user.pets
      @client_list = current_user.clientpets
      @news_feed = Pet.first().updates
  
        
    end
  end
end
