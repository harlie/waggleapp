class UpdateMailer < ActionMailer::Base
  default from: "info@waggleapp.com"
  
  def update_email(user, update)
      @user = user
      @url  = "http://www.waggleapp.com/login"
      @update = update
     # mail(:to => user.email, :subject => "Waggleapp Update")
     #FIXME - shouldn't be hardcode
     mail(:to => 'harlie.levine@gmail.com', :subject => "Waggleapp Update") do |format|
      format.html
      format.text
    end
  end
end
