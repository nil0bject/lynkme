class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    
  end
  
  
  def logout
    temp = session
    reset_session
    session.reverse_merge!(temp)
  end    
        
  
  def login
    @user = User.find_by_email(params[:email])
    if params[:password].empty?
      flash[:error] = "Please enter your password"
    else
      if !@user
        if params[:password] == params[:password_confirmation]
          @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
          @user.save!
        else
          flash[:error] = (params[:commit]=="Login") ? "Username or password incorrect." : "Make sure your passwords are the same. "
           flash[:message] = "Please try again."
        end
      end
      if @user
        if @user.authenticate(params[:password])
          @user.session_id = session[:session_id]
          session[:last_date_online] = @user.updated_at
          if @user.save!
            session[:user_id] = @user.id
            flash[:message] = "Signed in #{params[:email]}"
          else
            flash[:error] = "System error: Could not save session for #{params[:email]}"
          end
        else
          flash[:error] = "Incorrect login. Forgot your password?"
          session[:user_id] = nil
        end
      end
    end
    redirect_to root_path
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

  private
  
  def current_user
    if session[:session_id] && session[:user_id] && @current_user = User.find(session[:user_id])
      @current_user ||= User.find_by_session_id(session[:session_id])
    end
  end

  helper_method :current_user

end
