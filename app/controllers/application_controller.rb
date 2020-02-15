require './config/environment'
# require 'pry'
class ApplicationController < Sinatra::Base
 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "learning_center_app"
  end
 
  get "/" do
    # binding.pry
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
  end
    
  # notify me who sign in 
  helpers do
   def logged_in?
      # (double bang returns true else false)
    !!current_user
   end
   def current_user
      # reduce number of db calls(done by creating instance variable)
  @current_user ||= User.find_by(id: session[:user_id])
   end
  end
      
end
