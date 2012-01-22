class HomeController < ApplicationController
  def index
    if (current_user) 
      @pet_list = current_user.pets
      @pet= Pet.find(:first)
      @news_feed = @pet.updates
    end
  end
end
