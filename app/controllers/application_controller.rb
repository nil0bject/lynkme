class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    @user = User.new
  end
  
  
        
        
  
  def login
    @user = User.where(:email => params[:email]).first
    if params[:password].empty?
      flash[:error] = "Please enter your password"
    else
      if !@user
        if params[:password] == params[:password_confirmation]
          @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
          @user.save!
        else
          flash[:error] = "Make sure your passwords are the same"
        end
      end
      if @user
        if @user.authenticate(params[:password])
          @user.session_id = session[:session_id]
          if @user.save!
            session[:user_id] = @user.id
            flash[:message] = "Hello #{params[:email]}"
          else
            flash[:error] = "System error: Could not save session for #{params[:email]}"
          end
        else
          flash[:error] = "Incorrect login. Forgot your password?"
          session[:user_id] = nil
        end
      end
    end
    redirect_to root_path, :email => params[:email]
  end
  
  def create  
    user = User.find_by_email(params[:email])  
    if user && user.authenticate(params[:password])  
      session[:user_id] = user.id  
      redirect_to root_url, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end
end
