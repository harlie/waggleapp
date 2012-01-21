class HomeController < ApplicationController
  def index
    if (current_user) 
      @pet_list = current_user.pets
    end
  end
end
