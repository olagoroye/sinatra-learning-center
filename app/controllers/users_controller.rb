require "pry"
class UsersController < ApplicationController
#route for login/render login page

    get '/login' do
        erb :login
    end 
# this form is to receive the login-in form, create and find user
    post '/login' do
        # param, find_all users
        @user =User.find_by(name: params[:name], email: params[:email])
        # if password is valid log in user
        if  @user.authenticate(params[:password])   
            session[:user_id] = @user.id
            puts session
            redirect "/users/#{@user.id}"
        else
            # tell user password is incorrect and redirect
        end
    end


        #route for signup/render signup form
    get '/signup' do
       erb :signup     
    end
    # creating new users
    post '/users' do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
       @user = User.create(params)
       session[:user_id] = @user.id  

    #    redirect get the actual url
       redirect "/users/#{@user.id}" 
       else
        redirect '/signup'
       end
    end
    # show.erb route 
    get '/users/:id' do
        # binding.pry
        @user = User.find_by(id: params[:id])
       erb :'/users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end