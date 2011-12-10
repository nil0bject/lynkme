class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    
  end
  
  def login
    puts "Logging in:"
    if params[:commit] == "Login"
      
      @user = User.where(:email => params[:email]).first
      puts @user.inspect
      if @user
        puts @user.inspect
        if @user.password == params[:password]
          @user.session_id = session[:session_id]
          if @user.save!
            session[:user_id] = @user.id
            flash[:success] = "Hello #{params[:email]}"
          else
            flash[:error] = "System error: Could not save session for #{params[:email]}"
          end
        else
          flash[:error] = "Incorrect login. Forgot your password?"
          session[:user_id] = nil
        end
      else
        
      end
      
    end
    redirect_to root_path
  end
end
