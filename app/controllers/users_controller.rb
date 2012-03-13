class UsersController < ApplicationController
  def index
    @users = User.all    
  end
  
  def show
    @user = User.find(params[:id])    
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end
  
  def create
    @user = User.new(params[:user])  
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Congrats! You have successfuly signed up for Twitta!"
      redirect_to root_path
    else
      flash.now[:error] = "There was an error signing up."
      render :new 
    end
  end
  
  def login
    #nothing
    
  end
  
  def authenticate
    encrypted_password = User.encrypt_password(params[:password])
    user = User.where("email = ? AND password = ?", params[:email], encrypted_password).first
    if user
      session[:user_id] = user.id
      flash[:success] = "You have loged in!"
      redirect_to root_path
    else
      flash.now[:error] = "There was an error loging in."
      render :login
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:success] = "Hope to see you soon."
    redirect_to root_path    
    
  end
end
