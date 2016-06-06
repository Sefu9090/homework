require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "homework_secret"
  end

  get '/' do
    erb :index
  end
  
  get '/sign-up' do
    erb :signup

  end
  
  post '/sign-up' do
    user = User.new(:username  => params[:username], :password => params[:password]) 
    if user.save
      redirect '/login'
    else
      redirect '/sign-up'
    end
  end
  
  post '/create_class' do
    classroom = Classroom.new(:name => params[:name], :students => [], :homework => [])
  end
  
  get '/login' do
    @users = User.all
    if logged_in?
      erb :index
    else
      erb :login
    end
  end
  
 post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/"
    else
        redirect "/login"
    end
  end

  get '/ph' do
    if logged_in?
        erb :ph 
     else
        redirect "/login"
     end  
  end

  post '/ph' do
    homework = Homework.new(:name => params[:name], :work => params[:work])
    homework.save
    redirect '/homework'
  end
  
  get '/classes' do
    if logged_in?
        erb :classes 
     else
        redirect "/login"
     end  
  end
  get '/homework' do
    if logged_in?
        erb :homework 
     else
        redirect "/login"
     end  
  end
  
  
  get '/logout' do
    session.destroy
    redirect '/login'
  end
  
  helpers do
    def logged_in?
      session[:user_id]
    end
    
    def current_user
      User.find(session[:user_id])
    end
  end
end
#this makes you logout and after you logout it destroys the session so your informaton could be safec